"""
携程酒店名称与图片爬取脚本（学习版）
==============================================
用途：学习 Python 爬虫技术，了解网页数据抓取的基本流程
目标：爬取携程酒店列表中的酒店名称和封面图片
注意：
  1. 本脚本仅供学习使用，请勿用于商业用途
  2. 请遵守 robots.txt 及网站的使用条款
  3. 适当设置爬取间隔，避免对目标网站造成压力
  4. 爬取的数据请仅用于个人学习

依赖安装：
  pip install requests beautifulsoup4 selenium webdriver-manager

使用方式：
  python ctrip_hotel_scraper.py
"""

import os
import re
import time
import json
import csv
import pickle
import hashlib
import random
from pathlib import Path
from datetime import datetime
from typing import Optional

import requests
from bs4 import BeautifulSoup

# ============================================================
# 配置区 - 可根据需要修改
# ============================================================

class Config:
    """爬虫配置"""

    # --- 目标配置 ---
    # 携程酒店搜索页
    SEARCH_URL = "https://hotels.ctrip.com"

    # 要爬取的城市（默认广州）
    TARGET_CITY = "广州"

    # 多城市爬取列表（设置了 TARGET_CITIES 会忽略 TARGET_CITY，逐个爬取）
    # 留空 = 只爬 TARGET_CITY
    # 设为 ["ALL"] = 爬取 CITY_ID_MAP 中所有城市
    TARGET_CITIES = [
        "上海", "北京", "广州", "深圳", "杭州",
        "成都", "重庆", "南京", "西安", "苏州",
        "三亚", "青岛", "大连", "长沙", "香港",
        "厦门", "武汉", "天津", "敦煌", "无锡",
        "扬州", "舟山", "淳安", "绍兴", "黄山市",
        "九江", "武夷山", "张家界", "珠海", "桂林",
        "昆明", "西双版纳", "镇江", "大理市", "丽江"
    # TARGET_CITIES = [
    #     "上海"
    ]


    # 城市名称 → 携程 cityId 映射（基于浏览器地址栏真实 URL 参数）
    CITY_ID_MAP = {
        "上海": 2,
        "北京": 1,
        "广州": 32,
        "深圳": 30,
        "杭州": 17,
        "成都": 28,
        "重庆": 4,
        "南京": 12,
        "西安": 10,
        "苏州": 14,
        "三亚": 43,
        "青岛": 7,
        "大连": 6,
        "长沙": 206,
        "香港": 58,
        "厦门": 25,
        "武汉": 477,
        "天津": 3,
        "敦煌": 11,
        "无锡": 13,
        "扬州": 15,
        "舟山": 19,
        "淳安": 20,
        "绍兴": 22,
        "黄山市": 23,
        "九江": 24,
        "武夷山": 26,
        "张家界": 27,
        "珠海": 31,
        "桂林": 33,
        "昆明": 34,
        "西双版纳": 35,
        "镇江": 16,
        "大理市": 36,
        "丽江": 37,
    }

    # 入住/离店日期（格式: YYYY-MM-DD）
    CHECK_IN = "2026-06-24"
    CHECK_OUT = "2026-06-25"

    # --- 请求头（模拟浏览器，降低被反爬的概率）---
    HEADERS = {
        "User-Agent": (
            "Mozilla/5.0 (Windows NT 10.0; Win64; x64) "
            "AppleWebKit/537.36 (KHTML, like Gecko) "
            "Chrome/125.0.0.0 Safari/537.36"
        ),
        "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
        "Accept-Language": "zh-CN,zh;q=0.9,en;q=0.8",
        "Accept-Encoding": "gzip, deflate, br",
        "Connection": "keep-alive",
        "Referer": "https://www.ctrip.com/",
    }

    # --- 爬取控制 ---
    REQUEST_DELAY = (2, 5)      # 每次请求间隔秒数范围（随机取值，模拟人类行为）
    MAX_RETRIES = 3             # 请求失败最大重试次数
    TIMEOUT = 15                # 请求超时秒数
    MAX_HOTELS = 30            # 最多爬取酒店数（学习用，设小一点）

    # --- 存储路径 ---
    OUTPUT_DIR = Path(__file__).parent / "output"
    IMAGE_DIR = OUTPUT_DIR / "images"
    DATA_FILE = OUTPUT_DIR / "hotels.csv"
    COOKIE_FILE = OUTPUT_DIR / "cookies.pkl"    # Cookie 持久化文件

    # --- Selenium 配置 ---
    USE_SELENIUM = True         # 默认启用浏览器自动化
    SHOW_BROWSER = True         # True=显示浏览器（首次登录必须可见）, False=无头模式
    PAGE_LOAD_WAIT = 20         # 页面加载等待秒数
    SCROLL_WAIT = 0.2           # 每次滚动后等待秒数（越小越快）
    SCROLL_MAX_ROUNDS = 50      # 最大滚动轮数
    BROWSER = "edge"            # 浏览器选择: "edge"(Windows自带) / "chrome" / "firefox"
    LOGIN_TIMEOUT = 120         # 等待手动登录的超时秒数（0=不等待，直接跳过）
    USER_DATA_DIR = None        # 浏览器用户数据目录（None=自动使用 output/browser_profile）
    FAST_MODE = True            # 加速模式：禁止加载图片/字体/CSS动画，大幅提升滚动速度


# ============================================================
# 工具函数
# ============================================================

def create_directories():
    """创建输出目录"""
    Config.OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    Config.IMAGE_DIR.mkdir(parents=True, exist_ok=True)
    print(f"[初始化] 输出目录: {Config.OUTPUT_DIR}")
    print(f"[初始化] 图片目录: {Config.IMAGE_DIR}")


def safe_request(url: str, headers: Optional[dict] = None) -> Optional[requests.Response]:
    """
    带重试机制的 GET 请求

    参数:
        url: 请求的 URL
        headers: 自定义请求头，默认使用 Config.HEADERS

    返回:
        Response 对象，失败返回 None
    """
    if headers is None:
        headers = Config.HEADERS

    for attempt in range(1, Config.MAX_RETRIES + 1):
        try:
            print(f"  [GET请求] 第 {attempt} 次尝试: {url[:80]}...")
            response = requests.get(
                url,
                headers=headers,
                timeout=Config.TIMEOUT,
            )
            response.raise_for_status()
            response.encoding = response.apparent_encoding
            return response

        except requests.exceptions.Timeout:
            print(f"  [警告] 请求超时，重试 {attempt}/{Config.MAX_RETRIES}")
        except requests.exceptions.HTTPError as e:
            print(f"  [警告] HTTP 错误: {e}，重试 {attempt}/{Config.MAX_RETRIES}")
        except requests.exceptions.ConnectionError:
            print(f"  [警告] 连接错误，重试 {attempt}/{Config.MAX_RETRIES}")
        except Exception as e:
            print(f"  [警告] 未知错误: {e}，重试 {attempt}/{Config.MAX_RETRIES}")

        time.sleep(attempt * Config.REQUEST_DELAY[0])

    print(f"  [错误] 请求最终失败: {url}")
    return None


def safe_post_request(
    url: str,
    json_data: dict,
    headers: Optional[dict] = None,
) -> Optional[requests.Response]:
    """
    带重试机制的 POST 请求（用于携程 API）

    参数:
        url: POST 请求的 URL
        json_data: 请求体（JSON 格式）
        headers: 自定义请求头

    返回:
        Response 对象，失败返回 None
    """
    if headers is None:
        headers = Config.HEADERS.copy()
        headers["Content-Type"] = "application/json"

    for attempt in range(1, Config.MAX_RETRIES + 1):
        try:
            print(f"  [POST请求] 第 {attempt} 次尝试: {url.split('/')[-1]}...")
            response = requests.post(
                url,
                json=json_data,
                headers=headers,
                timeout=Config.TIMEOUT,
            )
            response.raise_for_status()
            return response

        except requests.exceptions.Timeout:
            print(f"  [警告] 请求超时，重试 {attempt}/{Config.MAX_RETRIES}")
        except requests.exceptions.HTTPError as e:
            print(f"  [警告] HTTP 错误: {e}，重试 {attempt}/{Config.MAX_RETRIES}")
        except requests.exceptions.ConnectionError:
            print(f"  [警告] 连接错误，重试 {attempt}/{Config.MAX_RETRIES}")
        except Exception as e:
            print(f"  [警告] 未知错误: {e}，重试 {attempt}/{Config.MAX_RETRIES}")

        time.sleep(attempt * Config.REQUEST_DELAY[0])

    print(f"  [错误] POST 请求最终失败: {url}")
    return None


def build_head(city_id: int, check_in: str = None, check_out: str = None) -> dict:
    """
    构造携程 API 的公共 head 参数

    这是从浏览器 F12 → Network → XHR 中抓包得到的真实请求格式。
    cid/vid 每次浏览器会话会变化，这里使用固定值用于学习演示。

    参数:
        city_id: 携程城市 ID
        check_in: 入住日期 (YYYY/MM/DD)
        check_out: 离店日期 (YYYY/MM/DD)

    返回:
        head 字典
    """
    if check_in is None:
        check_in = Config.CHECK_IN
    if check_out is None:
        check_out = Config.CHECK_OUT

    return {
        "platform": "PC",
        "cver": "0",
        "cid": "1782310638010.cb716D25YsQc",  # 客户端标识（实际使用时建议从浏览器复制最新的）
        "bu": "HBU",
        "group": "ctrip",
        "aid": "4902",
        "sid": "130727",
        "ouid": "",
        "locale": "zh-CN",
        "timezone": "8",
        "currency": "CNY",
        "pageId": "10650171192",                # 页面ID（可能随时间变化）
        "vid": "1782310638010.cb716D25YsQc",    # 访问ID（实际使用时建议从浏览器复制最新的）
        "guid": "",
        "isSSR": False,
        "extension": [
            {"name": "cityId", "value": str(city_id)},
            {"name": "checkIn", "value": check_in},
            {"name": "checkOut", "value": check_out},
        ],
    }


def safe_print(*args, **kwargs):
    """
    安全的 print，兼容 Windows GBK 控制台

    当遇到 GBK 无法编码的字符（如 ¥、特殊符号）时，
    自动替换为安全字符，避免 UnicodeEncodeError。
    """
    try:
        print(*args, **kwargs)
    except UnicodeEncodeError:
        # 将无法编码的字符替换为 ?
        safe_args = []
        for a in args:
            if isinstance(a, str):
                safe_args.append(a.encode("gbk", errors="replace").decode("gbk"))
            else:
                safe_args.append(a)
        print(*safe_args, **kwargs)


def random_delay():
    """随机延迟，模拟人类浏览行为"""
    delay = random.uniform(*Config.REQUEST_DELAY)
    time.sleep(delay)


# ============================================================
# Cookie 持久化管理
# ============================================================

def save_cookies(driver) -> bool:
    """
    将浏览器 Cookie 保存到本地文件

    参数:
        driver: Selenium WebDriver 实例

    返回:
        是否保存成功
    """
    try:
        cookies = driver.get_cookies()
        with open(Config.COOKIE_FILE, "wb") as f:
            pickle.dump(cookies, f)
        print(f"  [Cookie] 已保存 {len(cookies)} 条 Cookie → {Config.COOKIE_FILE.name}")
        return True
    except Exception as e:
        print(f"  [Cookie] 保存失败: {e}")
        return False


def load_cookies(driver) -> bool:
    """
    从本地文件加载 Cookie 到浏览器

    参数:
        driver: Selenium WebDriver 实例

    返回:
        是否加载成功
    """
    if not Config.COOKIE_FILE.exists():
        print("  [Cookie] 未找到已保存的 Cookie 文件")
        return False

    try:
        with open(Config.COOKIE_FILE, "rb") as f:
            cookies = pickle.load(f)

        # 先访问携程域名，否则无法添加 cookie（浏览器安全策略要求）
        driver.get("https://www.ctrip.com")
        time.sleep(2)

        for cookie in cookies:
            try:
                # 跳过导致问题的字段
                cookie.pop("sameSite", None)
                cookie.pop("httpOnly", None)
                driver.add_cookie(cookie)
            except Exception:
                continue

        print(f"  [Cookie] 已加载 {len(cookies)} 条 Cookie")
        return True

    except Exception as e:
        print(f"  [Cookie] 加载失败: {e}")
        return False


def wait_for_login(driver, timeout: int = None) -> bool:
    """
    等待用户手动登录携程

    检测逻辑：
      1. 当前页面 URL 包含 passport/login → 等待用户登录
      2. 每 2 秒检查一次 URL 是否离开登录页
      3. 超时后返回 False

    参数:
        driver: Selenium WebDriver 实例
        timeout: 超时秒数，默认使用 Config.LOGIN_TIMEOUT

    返回:
        True=登录成功, False=超时/用户放弃
    """
    if timeout is None:
        timeout = Config.LOGIN_TIMEOUT
    if timeout <= 0:
        return False

    print(f"  ╔══════════════════════════════════════════════╗")
    print(f"  ║  >>> 请在浏览器中手动登录携程账号 <<<       ║")
    print(f"  ║  登录后脚本会自动继续                        ║")
    print(f"  ║  超时时间: {timeout} 秒                               ║")
    print(f"  ╚══════════════════════════════════════════════╝")

    start_time = time.time()

    while time.time() - start_time < timeout:
        current_url = driver.current_url

        # 检查是否已离开登录页
        if "passport" not in current_url and "login" not in current_url:
            elapsed = int(time.time() - start_time)
            print(f"  [登录成功] 检测到已离开登录页（耗时 {elapsed} 秒）")
            time.sleep(2)  # 等页面稳定
            return True

        # 每 15 秒提示一次
        elapsed = int(time.time() - start_time)
        if elapsed > 0 and elapsed % 15 == 0:
            remaining = timeout - elapsed
            print(f"  [等待] 已等 {elapsed} 秒，剩余 {remaining} 秒...")

        time.sleep(2)

    print(f"  [超时] {timeout} 秒内未完成登录，跳过登录")
    return False


def is_logged_in(driver) -> bool:
    """
    检查当前是否已登录携程

    判断依据：访问酒店列表页，看是否被重定向到登录页

    参数:
        driver: Selenium WebDriver 实例

    返回:
        True=已登录, False=需要登录
    """
    current_url = driver.current_url
    if "passport" in current_url or "login" in current_url:
        return False
    return True


def ensure_logged_in(driver) -> bool:
    """
    确保浏览器已登录携程（自动加载 Cookie 或等待手动登录）

    流程:
      1. 有保存的 Cookie → 加载并验证
      2. Cookie 无效/不存在 → 等待用户手动登录
      3. 登录成功 → 保存 Cookie 供下次使用

    参数:
        driver: Selenium WebDriver 实例

    返回:
        True=已登录, False=未登录（会继续爬取但可能数据不完整）
    """
    # 第一步：尝试加载已保存的 Cookie
    cookies_loaded = load_cookies(driver)

    if cookies_loaded:
        print("  [Cookie] 已加载历史登录状态，验证中...")

    # 第二步：验证登录状态（导航到目标页看是否被重定向）
    # 注意：这一步在 scrape_by_selenium 中访问搜索 URL 时完成
    # 这里只做 Cookie 加载，不做额外请求

    return True  # 返回 True 继续流程，具体检测在访问页面后进行


def sanitize_filename(name: str) -> str:
    """
    清理文件名，移除非法字符

    参数:
        name: 原始文件名

    返回:
        清理后的安全文件名
    """
    # 移除 Windows/Linux 文件名中的非法字符
    name = re.sub(r'[<>:"/\\|?*]', '_', name)
    # 限制长度
    return name[:100]


def download_image(image_url: str, save_path: Path) -> bool:
    """
    下载单张图片到本地

    参数:
        image_url: 图片的 URL
        save_path: 保存的本地路径

    返回:
        是否下载成功
    """
    if save_path.exists():
        print(f"    [跳过] 图片已存在: {save_path.name}")
        return True

    try:
        response = requests.get(
            image_url,
            headers=Config.HEADERS,
            timeout=Config.TIMEOUT,
            stream=True,  # 流式下载，适合大文件
        )
        response.raise_for_status()

        # 检查 Content-Type 确认是图片
        content_type = response.headers.get("Content-Type", "")
        if "image" not in content_type:
            print(f"    [跳过] 非图片资源: {content_type}")
            return False

        with open(save_path, "wb") as f:
            for chunk in response.iter_content(chunk_size=8192):
                f.write(chunk)

        print(f"    [下载] 图片已保存: {save_path.name}")
        return True

    except Exception as e:
        print(f"    [错误] 图片下载失败: {e}")
        return False


# ============================================================
# 方式一：API 接口方式（推荐，基于真实抓包参数）
# ============================================================

def parse_hotel_item(item: dict, city: str, source: str = "") -> Optional[dict]:
    """
    解析单个酒店数据项，统一字段格式

    携程 API 返回的酒店数据可能有多种字段命名方式，
    此函数尝试所有常见字段名进行兼容解析。

    参数:
        item: API 返回的单个酒店数据
        city: 城市名称
        source: 数据来源标记（用于调试）

    返回:
        标准化的酒店字典，解析失败返回 None
    """
    try:
        # --- 酒店名称（尝试多种字段名）---
        name = (
            item.get("hotelName")
            or item.get("name")
            or item.get("hotelNameCN")
            or item.get("cnName")
            or "未知酒店"
        )

        # --- 图片 URL（优先外观图字段）---
        img_url = (
            item.get("imageUrl")        # 外观图（最常见）
            or item.get("mainImage")    # 主图
            or item.get("outSidePicUrl")  # 外观图
            or item.get("frontPicUrl")  # 正面图
            or item.get("picUrl")       # 通用图片
            or item.get("hotelPic")     # 酒店图片
            or item.get("pic")          # 简写
            or ""
        )
        # 处理 // 开头的协议相对URL
        if img_url.startswith("//"):
            img_url = "https:" + img_url

        # --- 价格 ---
        price = item.get("price") or item.get("minPrice") or item.get("fromPrice") or 0
        if isinstance(price, (int, float)):
            price = str(price)

        # --- 评分 ---
        score = (
            item.get("score")
            or item.get("rating")
            or item.get("commentScore")
            or item.get("hotelScore")
            or ""
        )
        if isinstance(score, (int, float)):
            score = str(score)

        # --- 酒店ID ---
        hotel_id = item.get("hotelId") or item.get("hotelID") or item.get("id") or ""

        return {
            "name": str(name).strip(),
            "image_url": img_url,
            "price": price,
            "score": score,
            "city": city,
            "hotel_id": str(hotel_id),
            "source": source,
        }

    except Exception as e:
        print(f"  [警告] 解析酒店数据失败: {e}, 原始数据: {str(item)[:200]}")
        return None


# ============================================================
# API 分页加载（基于抓包 fetchHotelList 接口）
# ============================================================

def fetch_hotels_page_via_browser(
    driver,
    city_id: int,
    checkin: str,
    checkout: str,
    page_index: int,
    already_shown_ids: list = None,
) -> list[dict]:
    """
    通过浏览器自身的 fetch 调用携程 API 翻页

    为什么不用 requests 库？
      requests 发出的请求没有浏览器的 Cookie/Session，
      携程服务端会拒绝返回数据（第2页返回空）。
      通过 driver.execute_script 在浏览器内部执行 fetch，
      自动携带所有 Cookie、localStorage、session 信息。

    参数:
        driver:            Selenium WebDriver
        city_id:           城市 ID
        checkin:           入住 YYYYMMDD
        checkout:          离店 YYYYMMDD
        page_index:        页码
        already_shown_ids: 已展示过的酒店 ID

    返回:
        酒店列表
    """
    if already_shown_ids is None:
        already_shown_ids = []

    checkin_fmt = f"{checkin[:4]}-{checkin[4:6]}-{checkin[6:8]}"
    checkout_fmt = f"{checkout[:4]}-{checkout[4:6]}-{checkout[6:8]}"

    request_body = {
        "date": {
            "dateType": 1,
            "dateInfo": {"checkInDate": checkin, "checkOutDate": checkout},
        },
        "extension": [],
        "destination": {
            "type": 1,
            "geo": {"cityId": city_id, "countryId": 1},
            "keyword": {"word": ""},
        },
        "extraFilter": {
            "childInfoItems": [],
            "ctripMainLandBDCoordinate": True,
            "sessionId": "",
            "extendableParams": {
                "tripWalkDriveSwitch": "T",
                "isUgcSentenceB": "",
                "NeedNewHighLightModule": "",
                "NeedBanCommentTag": "",
            },
        },
        "filters": [
            {"type": "17", "title": "欢迎度排序", "value": "1", "filterId": "17|1"},
            {"type": "80", "title": "", "value": "2", "filterId": "80|2"},
            {"filterId": "29|1", "type": "29", "value": "1|2"},
        ],
        "roomQuantity": 1,
        "marketInfo": {},
        "paging": {
            "pageIndex": page_index,
            "pageSize": 10,
            "pageCode": "10650171192",
        },
        "hotelIdFilter": {"hotelAldyShown": already_shown_ids},
        "head": {
            "platform": "PC",
            "cver": "0",
            "cid": "",
            "bu": "HBU",
            "group": "ctrip",
            "aid": "",
            "sid": "",
            "ouid": "",
            "locale": "zh-CN",
            "timezone": "8",
            "currency": "CNY",
            "pageId": "10650171192",
            "vid": "",
            "guid": "",
            "isSSR": False,
            "extension": [
                {"name": "cityId", "value": ""},
                {"name": "checkIn", "value": checkin_fmt},
                {"name": "checkOut", "value": checkout_fmt},
                {"name": "region", "value": "CN"},
            ],
        },
    }

    try:
        # 在浏览器内部执行 fetch，自动携带 Cookie/Session
        result = driver.execute_script("""
            const body = arguments[0];
            const url = 'https://m.ctrip.com/restapi/soa2/34951/fetchHotelList';
            // 同步方式：使用 XMLHttpRequest（兼容性好）
            return new Promise((resolve, reject) => {
                const xhr = new XMLHttpRequest();
                xhr.open('POST', url, false);  // false = 同步
                xhr.setRequestHeader('Content-Type', 'application/json');
                try {
                    xhr.send(JSON.stringify(body));
                    if (xhr.status === 200) {
                        resolve(xhr.responseText);
                    } else {
                        resolve(null);
                    }
                } catch(e) {
                    resolve(null);
                }
            });
        """, request_body)

        if result is None:
            return []

        data = json.loads(result) if isinstance(result, str) else result

        hotel_list = (
            data.get("data", {}).get("hotelList")
            or data.get("data", {}).get("list")
            or data.get("hotelList")
            or []
        )
        return hotel_list

    except Exception as e:
        print(f"  [API] 浏览器fetch page={page_index} 失败: {e}")
        return []


def fetch_hotels_page(
    city_id: int,
    checkin: str,
    checkout: str,
    page_index: int,
    already_shown_ids: list = None,
    cid: str = "",
    page_code: str = "10650171192",
) -> list[dict]:
    """
    调用携程 fetchHotelList API 获取一页酒店数据

    接口来源：F12 → Network → fetchHotelList（向下滚动时触发）
    每页固定返回 10 条酒店数据。

    参数:
        city_id:       城市 ID
        checkin:       入住日期 (YYYYMMDD 或 YYYY-MM-DD)
        checkout:      离店日期
        page_index:    页码（1, 2, 3...）
        already_shown_ids: 已展示过的酒店 ID 列表
        cid:           客户端会话 ID
        page_code:     页面编码

    返回:
        酒店列表 [{"name": ..., "image_url": ..., ...}]
    """
    # 日期转 YYYYMMDD 格式
    checkin = checkin.replace("-", "").replace("/", "")
    checkout = checkout.replace("-", "").replace("/", "")

    if already_shown_ids is None:
        already_shown_ids = []

    api_url = "https://m.ctrip.com/restapi/soa2/34951/fetchHotelList"

    request_body = {
        "date": {
            "dateType": 1,
            "dateInfo": {
                "checkInDate": checkin,
                "checkOutDate": checkout,
            },
        },
        "extension": [],
        "destination": {
            "type": 1,
            "geo": {
                "cityId": city_id,
                "countryId": 1,
            },
            "keyword": {"word": ""},
        },
        "extraFilter": {
            "childInfoItems": [],
            "ctripMainLandBDCoordinate": True,
            "sessionId": cid or f"scraper_{int(time.time())}",
            "extendableParams": {
                "tripWalkDriveSwitch": "T",
                "isUgcSentenceB": "",
                "NeedNewHighLightModule": "",
                "NeedBanCommentTag": "",
            },
        },
        "filters": [
            {"type": "17", "title": "欢迎度排序", "value": "1", "filterId": "17|1"},
            {"type": "80", "title": "", "value": "2", "filterId": "80|2"},
            {"filterId": "29|1", "type": "29", "value": "1|2"},
        ],
        "roomQuantity": 1,
        "marketInfo": {},
        "paging": {
            "pageIndex": page_index,
            "pageSize": 10,
            "pageCode": page_code,
        },
        "hotelIdFilter": {
            "hotelAldyShown": already_shown_ids,
        },
        "head": {
            "platform": "PC",
            "cver": "0",
            "cid": cid or f"scraper_{int(time.time())}",
            "bu": "HBU",
            "group": "ctrip",
            "aid": "",
            "sid": "",
            "ouid": "",
            "locale": "zh-CN",
            "timezone": "8",
            "currency": "CNY",
            "pageId": page_code,
            "vid": cid or f"scraper_{int(time.time())}",
            "guid": "",
            "isSSR": False,
            "extension": [
                {"name": "cityId", "value": ""},
                {"name": "checkIn", "value": f"{checkin[:4]}-{checkin[4:6]}-{checkin[6:8]}"},
                {"name": "checkOut", "value": f"{checkout[:4]}-{checkout[4:6]}-{checkout[6:8]}"},
                {"name": "region", "value": "CN"},
            ],
        },
    }

    api_headers = Config.HEADERS.copy()
    api_headers["Content-Type"] = "application/json"

    try:
        resp = requests.post(api_url, json=request_body, headers=api_headers, timeout=20)
        if resp.status_code != 200:
            return []

        data = resp.json()
        # 尝试多种字段名兼容
        hotel_list = (
            data.get("data", {}).get("hotelList")
            or data.get("data", {}).get("list")
            or data.get("hotelList")
            or []
        )

        return hotel_list

    except Exception as e:
        print(f"  [API] fetchHotelList page={page_index} 失败: {e}")
        return []


def scrape_by_api(city: str = None, max_hotels: int = None) -> list[dict]:
    """
    通过携程酒店 API 获取数据（真实接口）

    接口来源：浏览器 F12 → Network → XHR/Fetch
    在 https://hotels.ctrip.com 搜索城市后，从网络请求中抓取。

    用到的接口:
      - getAdHotels:  获取广告推荐酒店（本函数使用）
      - getCityList:  获取城市列表/城市ID
      - 主搜索接口:    类似格式，可在 XHR 中自行查找

    参数:
        city: 城市名称（需在 CITY_ID_MAP 中）
        max_hotels: 最多获取酒店数

    返回:
        酒店信息列表
    """
    if city is None:
        city = Config.TARGET_CITY
    if max_hotels is None:
        max_hotels = Config.MAX_HOTELS

    # 查找城市 ID
    city_id = Config.CITY_ID_MAP.get(city)
    if city_id is None:
        print(f"[错误] 未找到城市「{city}」的 ID，请在 Config.CITY_ID_MAP 中添加")
        print(f"       当前支持的城市: {list(Config.CITY_ID_MAP.keys())}")
        return []

    print(f"\n{'='*60}")
    print(f"[API方式] 爬取「{city}」(cityId={city_id}) 的酒店信息...")
    print(f"{'='*60}")

    all_hotels = []

    # ================================================================
    # 接口1: getAdHotels — 获取广告位推荐酒店
    # URL: https://m.ctrip.com/restapi/soa2/34951/getAdHotels
    # 方法: POST, Content-Type: application/json
    # ================================================================
    print("\n--- [接口1] getAdHotels - 广告推荐酒店 ---")

    ad_url = "https://m.ctrip.com/restapi/soa2/34951/getAdHotels"
    ad_body = {
        "cityId": city_id,
        "adPositionCodes": ["HTL_LST_002", "HTL_LST_001"],
        "head": build_head(city_id),
    }

    response = safe_post_request(ad_url, ad_body)
    if response is not None:
        try:
            data = response.json()
            print(f"  [响应] 状态码: {response.status_code}")

            # 解析 getAdHotels 返回的酒店数据
            # 实际返回结构需根据响应调整，常见字段名如下：
            ad_hotels = (
                data.get("adHotelList")
                or data.get("hotelList")
                or data.get("data", {}).get("hotelList", [])
            )
            print(f"  [解析] 广告酒店数: {len(ad_hotels)}")

            for item in ad_hotels[:max_hotels]:
                hotel = parse_hotel_item(item, city, "广告")
                if hotel:
                    all_hotels.append(hotel)
                    print(f"  [广告] {hotel['name']} | ¥{hotel['price']} | 评分:{hotel['score']}")

        except (json.JSONDecodeError, KeyError, TypeError) as e:
            print(f"  [警告] getAdHotels 解析失败: {e}")
            # 打印响应片段帮助调试
            if response.text:
                print(f"  [调试] 响应内容前300字符: {response.text[:300]}")
    else:
        print("  [提示] getAdHotels 请求失败，跳过广告酒店")

    # ================================================================
    # 接口2: 主酒店搜索列表（需自行在 XHR 中查找）
    # 常见接口名: getHotelList / searchHotel / getHotelSearchResult
    # 请求体格式与 getAdHotels 类似，通常包含 head + 搜索参数
    # ================================================================
    print("\n--- [接口2] 主搜索列表（需自行抓包确认接口名）---")
    print("  [说明] 在浏览器 F12 → Network → XHR 中搜索城市后，")
    print("         查找返回酒店列表的请求，获取接口URL和参数格式")
    print("         接口格式通常类似于 getAdHotels")

    # ---- 尝试常见的主搜索接口 ----
    search_urls = [
        "https://m.ctrip.com/restapi/soa2/34951/getHotelList",
        "https://m.ctrip.com/restapi/soa2/34951/searchHotel",
    ]

    for search_url in search_urls:
        search_body = {
            "cityId": city_id,
            "checkIn": Config.CHECK_IN.replace("/", "-"),
            "checkOut": Config.CHECK_OUT.replace("/", "-"),
            "pageIndex": 1,
            "pageSize": max_hotels,
            "sort": 0,  # 0=默认排序
            "head": build_head(city_id),
        }

        response = safe_post_request(search_url, search_body)
        if response is not None:
            try:
                data = response.json()
                # 尝试多种可能的字段名
                hotel_list = (
                    data.get("hotelList")
                    or data.get("data", {}).get("hotelList")
                    or data.get("data", {}).get("list")
                    or data.get("list")
                    or []
                )

                if hotel_list:
                    print(f"  [成功] {search_url.split('/')[-1]} 返回 {len(hotel_list)} 家酒店")
                    for item in hotel_list[:max_hotels]:
                        hotel = parse_hotel_item(item, city, "搜索")
                        if hotel:
                            all_hotels.append(hotel)
                            print(f"  [搜索] {hotel['name']} | ¥{hotel['price']} | 评分:{hotel['score']}")
                    break  # 成功获取数据后跳出
                else:
                    print(f"  [提示] {search_url.split('/')[-1]} 返回空列表或无酒店数据")

            except (json.JSONDecodeError, KeyError, TypeError) as e:
                print(f"  [警告] {search_url.split('/')[-1]} 解析失败: {e}")
        else:
            print(f"  [提示] {search_url.split('/')[-1]} 请求失败")

    # 去重
    seen = set()
    unique_hotels = []
    for h in all_hotels:
        if h["name"] not in seen:
            seen.add(h["name"])
            unique_hotels.append(h)

    print(f"\n[API方式] 共获取 {len(unique_hotels)} 家酒店信息")
    return unique_hotels


# ============================================================
# 方式二：Selenium 浏览器自动化方式
# ============================================================

def scrape_by_selenium(city: str = None, max_hotels: int = None) -> list[dict]:
    """
    使用 Selenium 模拟浏览器访问携程酒店列表页面

    原理说明：
      携程酒店列表是纯客户端渲染（React），数据通过 JS 动态加载。
      Selenium 启动真实 Chrome 浏览器，完整执行页面 JS 后再抓取 DOM，
      可以拿到直接请求 HTML 无法获取的动态内容。

    URL 格式（基于真实浏览器地址栏）：
      https://hotels.ctrip.com/hotels/list?
        countryId=1&city=32&provinceId=0&
        checkin=2026/06/24&checkout=2026/06/25&
        optionId=32&optionType=City&
        display=广州&crn=1&adult=1&children=0

    前提条件：
      1. 安装 Chrome 浏览器
      2. pip install selenium webdriver-manager

    参数:
        city: 城市名称（需在 CITY_ID_MAP 中）
        max_hotels: 最多获取酒店数

    返回:
        酒店信息列表 [{"name": ..., "image_url": ..., "price": ..., "score": ..., "city": ...}]
    """
    if city is None:
        city = Config.TARGET_CITY
    if max_hotels is None:
        max_hotels = Config.MAX_HOTELS

    # 查找城市 ID
    city_id = Config.CITY_ID_MAP.get(city)
    if city_id is None:
        print(f"[错误] 未找到城市「{city}」的 ID，请在 Config.CITY_ID_MAP 中添加")
        print(f"       当前支持: {list(Config.CITY_ID_MAP.keys())}")
        return []

    print(f"\n{'='*60}")
    print(f"[Selenium方式] 爬取「{city}」(cityId={city_id}) 的酒店信息...")
    print(f"{'='*60}")

    # --- 检查依赖 ---
    try:
        from selenium import webdriver
        from selenium.webdriver.common.by import By
        from selenium.webdriver.support.ui import WebDriverWait
        from selenium.webdriver.support import expected_conditions as EC
    except ImportError:
        print("[错误] 请先安装 Selenium 相关依赖：")
        print("       pip install selenium webdriver-manager")
        return []

    # --- 构造携程酒店列表 URL（基于真实浏览器地址栏）---
    from urllib.parse import quote
    checkin = Config.CHECK_IN
    checkout = Config.CHECK_OUT

    search_url = (
        f"https://hotels.ctrip.com/hotels/list"
        f"?flexType=1"
        f"&fixedDate=0"
        f"&cityId={city_id}"
        f"&provinceId=0"
        f"&districtId=0"
        f"&countryId=1"
        f"&cityName="
        f"&destName={quote(city)}"
        f"&searchType=CT"
        f"&optionId={city_id}"
        f"&checkin={checkin}"
        f"&checkout={checkout}"
        f"&crn=1"
        f"&listFilters=29~1*29*1~2*2"
        f"&curr=CNY"
        f"&locale=zh-CN"
        f"&old=1"
        f"&v2_mod=83"
        f"&v2_version=E"
    )

    driver = None
    hotels = []

    try:
        # ================================================================
        # 步骤1: 启动浏览器（优先 Edge → Chrome → Firefox）
        # ================================================================
        print("[1/5] 正在启动浏览器...")

        browser_name = Config.BROWSER.lower()
        browser_options = None

        # ---- 尝试 Microsoft Edge（Windows 自带）----
        if browser_name == "edge":
            try:
                from selenium.webdriver.edge.service import Service as EdgeService
                from selenium.webdriver.edge.options import Options as EdgeOptions
                from webdriver_manager.microsoft import EdgeChromiumDriverManager

                browser_options = EdgeOptions()

                # --- 用户数据目录：Cookie/登录状态持久化 ---
                user_data = Config.USER_DATA_DIR or str(
                    Config.OUTPUT_DIR / "browser_profile"
                )
                browser_options.add_argument(f"--user-data-dir={user_data}")
                browser_options.add_argument("--profile-directory=Default")
                print(f"  [配置] 浏览器数据目录: {user_data}")
                print(f"  [说明] Cookie 和登录状态将在该目录中自动持久化")

                if not Config.SHOW_BROWSER:
                    browser_options.add_argument("--headless=new")
                browser_options.add_argument("--no-sandbox")
                browser_options.add_argument("--disable-dev-shm-usage")
                browser_options.add_argument("--disable-gpu")
                browser_options.add_argument("--window-size=1920,1080")
                browser_options.add_argument("--lang=zh-CN")
                browser_options.add_argument("--disable-blink-features=AutomationControlled")
                browser_options.add_experimental_option("excludeSwitches", ["enable-automation"])
                browser_options.add_experimental_option("useAutomationExtension", False)

                # --- 加速模式：禁止加载图片和字体 ---
                if Config.FAST_MODE:
                    prefs = {
                        "profile.managed_default_content_settings.images": 2,  # 禁止图片
                        "profile.default_content_setting_values.notifications": 2,
                    }
                    browser_options.add_experimental_option("prefs", prefs)
                    browser_options.add_argument("--disable-fonts")
                    print("  [加速] 已禁止加载图片和字体，滚动速度大幅提升")

                browser_options.add_argument(
                    "user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) "
                    "AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36"
                )

                print("  [驱动] 下载/使用 Edge WebDriver...")
                service = EdgeService(EdgeChromiumDriverManager().install())
                driver = webdriver.Edge(service=service, options=browser_options)
                print("  [成功] Edge 浏览器已启动")

            except Exception as e:
                print(f"  [警告] Edge 启动失败: {e}")
                print("  [降级] 尝试 Chrome...")
                browser_name = "chrome"

        # ---- 尝试 Google Chrome ----
        if browser_name == "chrome":
            try:
                from selenium.webdriver.chrome.service import Service as ChromeService
                from selenium.webdriver.chrome.options import Options as ChromeOptions
                from webdriver_manager.chrome import ChromeDriverManager

                browser_options = ChromeOptions()

                # --- 用户数据目录：Cookie/登录状态持久化 ---
                user_data = Config.USER_DATA_DIR or str(
                    Config.OUTPUT_DIR / "browser_profile"
                )
                browser_options.add_argument(f"--user-data-dir={user_data}")
                browser_options.add_argument("--profile-directory=Default")
                print(f"  [配置] 浏览器数据目录: {user_data}")
                print(f"  [说明] Cookie 和登录状态将在该目录中自动持久化")

                if not Config.SHOW_BROWSER:
                    browser_options.add_argument("--headless=new")  # 新版无头模式
                browser_options.add_argument("--no-sandbox")
                browser_options.add_argument("--disable-dev-shm-usage")
                browser_options.add_argument("--disable-gpu")
                browser_options.add_argument("--window-size=1920,1080")
                browser_options.add_argument("--lang=zh-CN")
                browser_options.add_argument("--disable-blink-features=AutomationControlled")
                browser_options.add_experimental_option("excludeSwitches", ["enable-automation"])
                browser_options.add_experimental_option("useAutomationExtension", False)

                # --- 加速模式：禁止加载图片和字体 ---
                if Config.FAST_MODE:
                    prefs = {
                        "profile.managed_default_content_settings.images": 2,  # 禁止图片
                        "profile.default_content_setting_values.notifications": 2,
                    }
                    browser_options.add_experimental_option("prefs", prefs)
                    browser_options.add_argument("--disable-fonts")
                    print("  [加速] 已禁止加载图片和字体，滚动速度大幅提升")

                browser_options.add_argument(
                    "user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) "
                    "AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36"
                )

                print("  [驱动] 下载/使用 Chrome WebDriver...")
                service = ChromeService(ChromeDriverManager().install())
                driver = webdriver.Chrome(service=service, options=browser_options)
                print("  [成功] Chrome 浏览器已启动")

            except Exception as e:
                print(f"  [警告] Chrome 启动失败: {e}")
                raise RuntimeError(
                    "所有浏览器启动均失败。请尝试:\n"
                    "  1. pip install webdriver-manager\n"
                    "  2. 或安装 Chrome: https://www.google.com/chrome/\n"
                    "  3. 或设置 Config.BROWSER='edge' 使用系统自带 Edge"
                )

        # 隐藏 webdriver 特征（新版浏览器可能禁止此操作，失败不影响）
        if driver:
            try:
                driver.execute_script(
                    "Object.defineProperty(navigator, 'webdriver', {get: () => undefined})"
                )
            except Exception:
                pass  # 新版 Chrome/Edge 不允许重定义，忽略即可

        # ================================================================
        # 步骤2: 访问酒店列表页（Cookie 由浏览器 user-data-dir 自动管理）
        # ================================================================
        print(f"[2/5] 访问酒店列表: ...city={city_id}&destName={city}")
        driver.get(search_url)

        # 等待页面主体加载
        wait = WebDriverWait(driver, Config.PAGE_LOAD_WAIT)
        time.sleep(3)  # 给 JS 一些渲染时间
        current_url = driver.current_url
        safe_print(f"  [当前URL] {current_url[:120]}...")

        # --- 检测是否被重定向到登录页 ---
        login_required = "login" in current_url or "passport" in current_url

        if login_required:
            if Config.SHOW_BROWSER:
                # 可见模式：等待用户手动登录
                safe_print("  [登录] 需要登录，请在浏览器中手动完成登录...")
                logged_in = wait_for_login(driver, Config.LOGIN_TIMEOUT)

                if logged_in:
                    # 登录成功（Cookie 由浏览器 user-data-dir 自动保存），重新导航
                    print(f"      重新访问酒店列表...")
                    driver.get(search_url)
                    time.sleep(3)
                else:
                    safe_print("  [提示] 登录超时，将尝试从未登录页面提取数据")
            else:
                # 无头模式无法手动登录
                safe_print("=" * 60)
                safe_print("[警告] 页面被重定向到登录页！")
                safe_print("[建议]")
                safe_print("  1. 首次使用请设置 Config.SHOW_BROWSER = True 并手动登录一次")
                safe_print("     （登录后 Cookie 会自动保存，下次即可免登录）")
                safe_print("  2. 已登录过的可直接设置 SHOW_BROWSER = False")
                safe_print("=" * 60)

        # ================================================================
        # 步骤3: 等待首屏酒店列表渲染
        # ================================================================
        safe_print("[3/5] 等待首屏酒店列表渲染...")

        # --- 携程酒店卡片选择器（常见模式，按优先级排列）---
        # 由于携程使用 React，class 名可能经过 hash 处理，
        # 这里列出多种可能的模式进行尝试
        hotel_card_selectors = [
            # 常见的携程酒店列表结构
            ".hotel-list .hotel-item",           # 传统结构
            ".list-card",                         # 列表中每个卡片
            ".search-result-list > div",          # 搜索结果列表中的直接子div
            ".listItem",                          # 驼峰命名
            "div[data-index]",                    # 带 data-index 属性的卡片
            ".hotelItem",                         # 另一种驼峰
            ".result-list .item",                 # 结果列表
            ".hotel-card",                        # 酒店卡片
        ]

        hotel_elements = []
        matched_selector = None
        for selector in hotel_card_selectors:
            try:
                wait.until(
                    EC.presence_of_element_located((By.CSS_SELECTOR, selector))
                )
                hotel_elements = driver.find_elements(By.CSS_SELECTOR, selector)
                if len(hotel_elements) >= 2:
                    matched_selector = selector
                    print(f"  [匹配] 选择器 '{selector}' → {len(hotel_elements)} 个元素")
                    break
            except Exception:
                continue

        # --- 如果 Selenium 选择器失败，用 BeautifulSoup 兜底 ---
        if len(hotel_elements) < 2:
            print("  [兜底] 选择器匹配不足，使用 BeautifulSoup 解析整页...")
            soup = BeautifulSoup(driver.page_source, "html.parser")
            hotel_elements = []
            for div in soup.find_all("div"):
                if div.find("img") and div.find("a"):
                    hotel_elements.append(div)
            print(f"  [兜底] BS4 找到 {len(hotel_elements)} 个候选元素")

        # ================================================================
        # 步骤3.5: 滚动加载更多卡片（直到凑够或滚到底）
        # ================================================================
        if matched_selector and len(hotel_elements) < max_hotels:
            print(f"  [滚动] 当前 {len(hotel_elements)} 个卡片，滚动加载更多...")
            no_new_rounds = 0

            for rnd in range(Config.SCROLL_MAX_ROUNDS):
                # 滚到底 + 触发事件
                driver.execute_script("""
                    window.scrollTo(0, document.body.scrollHeight);
                    document.querySelectorAll('*').forEach(function(el) {
                        if (el.scrollHeight > el.clientHeight + 5 && el.clientHeight > 100)
                            el.scrollTop = el.scrollHeight;
                    });
                    var evt = new WheelEvent('wheel', {
                        deltaY: 500, deltaMode: 0, bubbles: true, cancelable: true
                    });
                    document.dispatchEvent(evt);
                """)
                time.sleep(2.0)  # 等待API请求+DOM渲染

                # 重新统计
                try:
                    current = driver.find_elements(By.CSS_SELECTOR, matched_selector)
                except Exception:
                    current = hotel_elements

                if len(current) > len(hotel_elements):
                    added = len(current) - len(hotel_elements)
                    hotel_elements = current
                    no_new_rounds = 0
                    print(f"    第{rnd+1}轮滚动: +{added} → 共 {len(hotel_elements)} 个卡片")
                else:
                    no_new_rounds += 1
                    if rnd % 5 == 0:
                        print(f"    第{rnd+1}轮: 无变化 ({len(hotel_elements)} 个)")

                if len(hotel_elements) >= max_hotels:
                    print(f"  [够了] 卡片数 ≥ {max_hotels}")
                    break
                if no_new_rounds >= 10:
                    print(f"  [到底] 连续10轮无新卡片，停止")
                    break

        print(f"  [结果] 共 {len(hotel_elements)} 个酒店卡片")

        # ================================================================
        # 步骤4: 逐个解析酒店信息
        # ================================================================
        print("[4/5] 停止轮播并解析酒店信息...")

        # 关键：停掉所有轮播的自动播放，让外观图保持在第一张
        try:
            driver.execute_script("""
                document.querySelectorAll('.swiper, [class*=\"swiper\"], [class*=\"carousel\"], [class*=\"slider\"]').forEach(function(el) {
                    if (el.swiper) { try { el.swiper.autoplay.stop(); } catch(e) {} }
                });
                // 暴力停止：移除可能的定时器（效果有限但无害）
                for (var i = 1; i < 100; i++) { clearInterval(i); }
            """)
        except Exception:
            pass

        for i, elem in enumerate(hotel_elements[:max_hotels]):
            try:
                hotel = {"city": city, "source": "selenium"}

                # --- 酒店名称 ---
                name_selectors = [
                    ".name", ".hotel-name", ".hotelName", ".hotel_name",
                    "h3", "h4", ".title", "a[title]", "span[title]",
                    ".info-title", ".item-name",
                ]
                name = ""
                for ns in name_selectors:
                    try:
                        el = elem.find_element(By.CSS_SELECTOR, ns)
                        txt = el.text.strip() or el.get_attribute("title") or ""
                        if txt and len(txt) >= 2:
                            name = txt
                            break
                    except Exception:
                        continue

                # 还没找到，尝试从 a 标签获取
                if not name:
                    try:
                        links = elem.find_elements(By.CSS_SELECTOR, "a")
                        for link in links:
                            txt = link.text.strip() or link.get_attribute("title") or ""
                            if txt and len(txt) >= 2:
                                name = txt
                                break
                    except Exception:
                        pass

                hotel["name"] = name if name else f"未知酒店_{i+1}"

                # --- 图片 URL ---
                # multi-images 结构：
                #   div[0] = 隐藏克隆图 / 预加载的最后一张图
                #   div[1] = 酒店外观图 ★ 要这个
                #   div[2..n] = 其他轮播图
                img_url = ""
                try:
                    img_url = driver.execute_script("""
                        var card = arguments[0];
                        var container = card.querySelector('[class*=\"multi-images\"]');
                        if (!container) return '';

                        var children = container.children;
                        // 取第2个div（索引1）的img → 外观图
                        if (children.length >= 2) {
                            var img = children[1].querySelector('img');
                            if (img) {
                                var s = img.src || img.getAttribute('data-src') || img.getAttribute('src') || '';
                                if (s && s.indexOf('c-ctrip.com') > -1) return s;
                            }
                        }
                        // 回退: 取所有img中第2个携程CDN图
                        var imgs = container.querySelectorAll('img');
                        var urls = [];
                        for (var i = 0; i < imgs.length; i++) {
                            var s = imgs[i].src || '';
                            if (s && s.indexOf('c-ctrip.com') > -1 && urls.indexOf(s) === -1) {
                                urls.push(s);
                            }
                        }
                        return urls.length >= 2 ? urls[1] : (urls[0] || '');
                    """, elem)
                except Exception:
                    pass

                # 兜底
                if not img_url:
                    try:
                        imgs = elem.find_elements(By.CSS_SELECTOR, "img")
                        for img in imgs:
                            src = (img.get_attribute("src")
                                   or img.get_attribute("data-src")
                                   or img.get_attribute("data-lazy") or "")
                            if src and "c-ctrip.com" in src:
                                img_url = src
                                break
                    except Exception:
                        pass

                if img_url and img_url.startswith("//"):
                    img_url = "https:" + img_url
                hotel["image_url"] = img_url

                # --- 价格 ---
                price = ""
                price_selectors = [
                    ".price", ".real-price", ".min-price", ".sale-price",
                    ".hotel-price", ".now-price", "span[class*='price']",
                    ".Price", ".priceNum",
                ]
                for ps in price_selectors:
                    try:
                        el = elem.find_element(By.CSS_SELECTOR, ps)
                        price = el.text.strip()
                        if price:
                            break
                    except Exception:
                        continue
                hotel["price"] = price

                # --- 评分 ---
                score = ""
                score_selectors = [
                    ".score", ".rating", ".comment-score", ".grade",
                    ".hotel-score", ".point", "span[class*='score']",
                    "span[class*='rating']", ".Rate",
                ]
                for ss in score_selectors:
                    try:
                        el = elem.find_element(By.CSS_SELECTOR, ss)
                        score = el.text.strip()
                        if score:
                            break
                    except Exception:
                        continue
                hotel["score"] = score

                # --- 酒店ID（从链接中提取）---
                try:
                    link = elem.find_element(By.CSS_SELECTOR, "a[href*='hotel']")
                    href = link.get_attribute("href") or ""
                    # 尝试从 URL 中提取酒店 ID
                    import re as re_mod
                    id_match = re_mod.search(r'/hotel/(\d+)', href) or re_mod.search(r'hotelId=(\d+)', href)
                    hotel["hotel_id"] = id_match.group(1) if id_match else ""
                except Exception:
                    hotel["hotel_id"] = ""

                hotels.append(hotel)
                img_status = "[图]" if img_url else "[无图]"
                safe_print(f"  [{i+1}/{min(len(hotel_elements), max_hotels)}] {hotel['name'][:30]} | {price} | {score}分 | {img_status}")

            except Exception as e:
                safe_print(f"  [警告] 第{i+1}个酒店解析失败: {e}")
                continue

    except Exception as e:
        safe_print(f"[错误] Selenium 爬取失败: {e}")
        import traceback
        traceback.print_exc()

    finally:
        # ================================================================
        # 步骤5: 关闭浏览器（Cookie 已由 user-data-dir 自动持久化）
        # ================================================================
        if driver:
            safe_print("[5/5] 关闭浏览器...")
            driver.quit()

    safe_print(f"\n[Selenium方式] 共获取 {len(hotels)} 家酒店信息")
    return hotels


# ============================================================
# 方式三：BeautifulSoup 直接解析（适用于静态页面）
# ============================================================

def scrape_by_requests(url: str, max_hotels: int = None) -> list[dict]:
    """
    使用 requests + BeautifulSoup 直接解析页面

    适用场景：
      页面是服务端渲染的（非 SPA），HTML 中直接包含数据。
      对于携程这样的现代 SPA 网站，此方式可能获取不到数据，
      但作为学习爬虫基础很有价值。

    参数:
        url: 目标页面 URL
        max_hotels: 最多获取酒店数

    返回:
        酒店信息列表
    """
    if max_hotels is None:
        max_hotels = Config.MAX_HOTELS

    print(f"\n{'='*60}")
    print(f"[BS4方式] 开始解析页面: {url}")
    print(f"{'='*60}")

    hotels = []

    # --- 获取页面 HTML ---
    response = safe_request(url)
    if response is None:
        return []

    soup = BeautifulSoup(response.text, "html.parser")

    # --- 查找酒店列表 ---
    hotel_cards = (
        soup.find_all("div", class_=re.compile(r"hotel.*item", re.I))
        or soup.find_all("div", class_=re.compile(r"list.*card", re.I))
        or soup.find_all("li", class_=re.compile(r"hotel", re.I))
        or soup.find_all("div", class_=re.compile(r"search.*result", re.I))
    )

    if not hotel_cards:
        print("[提示] 标准选择器未匹配，尝试通用方式...")
        all_divs = soup.find_all("div")
        hotel_cards = [
            div for div in all_divs
            if div.find("img") and div.find(["h2", "h3", "h4", "a"])
        ][:max_hotels * 2]

    print(f"[解析] 找到 {len(hotel_cards)} 个可能的酒店卡片")

    for i, card in enumerate(hotel_cards[:max_hotels]):
        try:
            hotel = {}

            # --- 获取酒店名称 ---
            name_elem = (
                card.find(["h2", "h3", "h4"], class_=re.compile(r"name|title", re.I))
                or card.find("a", class_=re.compile(r"name|title", re.I))
                or card.find("a", title=True)
            )
            if name_elem:
                hotel["name"] = (
                    name_elem.get("title", "")
                    or name_elem.get_text(strip=True)
                )
            else:
                hotel["name"] = f"未知酒店_{i+1}"

            # --- 获取图片 ---
            img_elem = card.find("img")
            if img_elem:
                img_url = (
                    img_elem.get("src")
                    or img_elem.get("data-src")
                    or img_elem.get("data-lazy")
                    or ""
                )
                if img_url.startswith("//"):
                    img_url = "https:" + img_url
                hotel["image_url"] = img_url
            else:
                hotel["image_url"] = ""

            # --- 获取价格 ---
            price_elem = card.find(class_=re.compile(r"price", re.I))
            hotel["price"] = price_elem.get_text(strip=True) if price_elem else ""

            # --- 获取评分 ---
            score_elem = card.find(class_=re.compile(r"score|rating|grade", re.I))
            hotel["score"] = score_elem.get_text(strip=True) if score_elem else ""

            hotels.append(hotel)
            print(f"  [{i+1}/{min(len(hotel_cards), max_hotels)}] {hotel['name']}")

        except Exception as e:
            print(f"  [警告] 解析第 {i+1} 个卡片失败: {e}")
            continue

        random_delay()

    print(f"\n[BS4方式] 共获取 {len(hotels)} 家酒店信息")
    return hotels


# ============================================================
# 数据处理与保存
# ============================================================

def save_to_csv(hotels: list[dict], filepath: Path):
    """
    将酒店信息保存为 CSV 文件

    参数:
        hotels: 酒店列表
        filepath: CSV 文件路径
    """
    if not hotels:
        print("[警告] 没有数据可保存")
        return

    fieldnames = ["name", "image_url", "price", "score", "city", "hotel_id", "source"]

    with open(filepath, "w", newline="", encoding="utf-8-sig") as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames, extrasaction="ignore")
        writer.writeheader()
        writer.writerows(hotels)

    print(f"\n[保存] 酒店信息已保存到: {filepath}")
    print(f"[保存] 共 {len(hotels)} 条记录")


def download_all_images(hotels: list[dict]) -> int:
    """
    批量下载所有酒店图片

    参数:
        hotels: 酒店列表

    返回:
        成功下载的图片数量
    """
    print(f"\n{'='*60}")
    print("[下载] 开始下载酒店图片...")
    print(f"{'='*60}")

    success_count = 0

    for i, hotel in enumerate(hotels):
        name = hotel.get("name", f"未知_{i}")
        image_url = hotel.get("image_url", "")

        if not image_url:
            print(f"  [{i+1}/{len(hotels)}] {name}: 无图片URL，跳过")
            continue

        # 生成安全的文件名
        safe_name = sanitize_filename(name)
        # 根据 URL 后缀判断扩展名，默认 .jpg
        ext = os.path.splitext(image_url.split("?")[0])[-1] or ".jpg"
        if ext not in (".jpg", ".jpeg", ".png", ".webp", ".gif"):
            ext = ".jpg"

        filename = f"{i+1:03d}_{safe_name}{ext}"
        save_path = Config.IMAGE_DIR / filename

        print(f"  [{i+1}/{len(hotels)}] {name}")
        if download_image(image_url, save_path):
            success_count += 1

        random_delay()

    print(f"\n[下载] 成功下载 {success_count}/{len(hotels)} 张图片")
    return success_count


# ============================================================
# 主程序
# ============================================================

def main():
    """主入口函数"""
    print("""
╔══════════════════════════════════════════════════════╗
║       携程酒店名称与图片爬取脚本（学习版）          ║
║       仅供学习 Python 爬虫技术使用                   ║
╚══════════════════════════════════════════════════════╝
    """)

    # 1. 确定要爬取的城市列表
    if Config.TARGET_CITIES:
        if Config.TARGET_CITIES == ["ALL"]:
            cities = list(Config.CITY_ID_MAP.keys())
            print(f"[全部城市模式] 将依次爬取 {len(cities)} 个城市")
        else:
            cities = Config.TARGET_CITIES
        print(f"[多城市模式] 将依次爬取 {len(cities)} 个城市: {', '.join(cities)}")
    else:
        cities = [Config.TARGET_CITY]

    # 2. 初始化目录
    create_directories()
    all_hotels = []

    # 3. 逐个城市爬取
    for idx, city in enumerate(cities):
        # 检查城市 ID
        city_id = Config.CITY_ID_MAP.get(city)
        if city_id is None:
            safe_print(f"\n[跳过] 未找到城市「{city}」的 ID，请在 Config.CITY_ID_MAP 中添加")
            continue

        print(f"\n{'#'*60}")
        print(f"# [{idx+1}/{len(cities)}] 正在爬取: {city} (cityId={city_id})")
        print(f"{'#'*60}")

        # --- 主方案: Selenium ---
        if Config.USE_SELENIUM:
            hotels = scrape_by_selenium(city, Config.MAX_HOTELS)
            if not hotels:
                print(f"\n[降级] Selenium 未获取到「{city}」的数据，尝试 API...")
                hotels = scrape_by_api(city, Config.MAX_HOTELS)
        else:
            hotels = scrape_by_api(city, Config.MAX_HOTELS)

        # --- 兜底 ---
        if not hotels:
            hotels = scrape_by_requests(Config.SEARCH_URL, Config.MAX_HOTELS)

        if hotels:
            all_hotels.extend(hotels)
            print(f"  [{city}] ✓ 获取 {len(hotels)} 家酒店")
        else:
            print(f"  [{city}] ✗ 未获取到数据")

        # 城市之间等待一段时间，避免被反爬
        if idx < len(cities) - 1:
            wait = random.uniform(5, 10)
            print(f"  [等待] {wait:.0f} 秒后爬取下一个城市...")
            time.sleep(wait)

    # 4. 去重
    seen_names = set()
    unique_hotels = []
    for h in all_hotels:
        if h["name"] not in seen_names:
            seen_names.add(h["name"])
            unique_hotels.append(h)
    all_hotels = unique_hotels

    # 5. 保存数据
    if all_hotels:
        save_to_csv(all_hotels, Config.DATA_FILE)
        download_all_images(all_hotels)
    else:
        print("\n" + "="*60)
        print("[结果] 未能获取到任何酒店数据")
        print("[原因分析] 可能的原因：")
        print("  1. 携程页面结构已更新，需要调整 CSS 选择器")
        print("  2. 网络连接问题，无法访问目标网站")
        print("  3. 网站有反爬机制，需要添加更多请求头或使用代理")
        print("  4. 页面是纯客户端渲染（SPA），必须使用 Selenium 方式")
        print()
        print("[建议]")
        print("  - 设置 Config.SHOW_BROWSER = True 观察浏览器实际情况")
        print("  - 设置 Config.USE_SELENIUM = True 启用浏览器自动化")
        print("="*60)

    # 6. 输出统计
    print(f"\n{'='*60}")
    print(f"[完成] 爬取任务结束")
    if Config.TARGET_CITIES:
        print(f"[统计] 共爬取 {len(cities)} 个城市，获取 {len(all_hotels)} 家酒店")
    else:
        print(f"[统计] 共获取 {len(all_hotels)} 家酒店信息")
    print(f"[统计] 数据文件: {Config.DATA_FILE}")
    print(f"[统计] 图片目录: {Config.IMAGE_DIR}")
    print(f"{'='*60}")


# ============================================================
# 额外学习示例：演示真实 API 的请求格式
# ============================================================

def scrape_mobile_api_example():
    """
    示例：演示 getCityList 和 getAdHotels 的真实请求格式

    本函数演示两个你在 F12 → Network → XHR 中看到的真实接口：
      1. getCityList  — 获取城市列表/验证城市ID
      2. getAdHotels  — 获取广告位推荐酒店

    通过这两个接口可以学习携程 API 的通用调用模式。
    """
    print(f"\n{'='*60}")
    print("[真实API演示] 携程 getCityList & getAdHotels")
    print(f"{'='*60}")

    # 请求头（与浏览器中看到的一致）
    api_headers = {
        "User-Agent": (
            "Mozilla/5.0 (Windows NT 10.0; Win64; x64) "
            "AppleWebKit/537.36 (KHTML, like Gecko) "
            "Chrome/125.0.0.0 Safari/537.36"
        ),
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Accept-Language": "zh-CN,zh;q=0.9",
        "Referer": "https://hotels.ctrip.com/",
    }

    # ============================================================
    # 示例1: getCityList — 获取城市列表
    # ============================================================
    print("\n--- [示例1] getCityList ---")
    print("URL: https://m.ctrip.com/restapi/soa2/34951/getCityList")
    print("方法: POST, JSON Body")
    print()

    city_list_url = "https://m.ctrip.com/restapi/soa2/34951/getCityList"
    city_list_body = {
        "requestType": "5",
        "head": {
            "platform": "PC",
            "cver": "0",
            "cid": "1782310638010.cb716D25YsQc",
            "bu": "HBU",
            "group": "ctrip",
            "aid": "4902",
            "sid": "130727",
            "ouid": "",
            "locale": "zh-CN",
            "region": "CN",
            "timezone": "8",
            "currency": "CNY",
            "pageId": "10650171192",
            "vid": "1782310638010.cb716D25YsQc",
            "guid": "",
            "isSSR": False,
            "extension": [
                {"name": "cityId", "value": "32"},
                {"name": "checkIn", "value": "2026/06/24"},
                {"name": "checkOut", "value": "2026/06/25"},
            ],
        },
    }

    try:
        resp = requests.post(city_list_url, json=city_list_body, headers=api_headers, timeout=15)
        print(f"[响应] 状态码: {resp.status_code}")
        if resp.status_code == 200:
            data = resp.json()
            print(f"[响应] 返回字段: {list(data.keys())}")
            print(f"[响应] 前500字符: {json.dumps(data, ensure_ascii=False, indent=2)[:500]}...")
    except Exception as e:
        print(f"[提示] getCityList 请求失败: {e}")

    # ============================================================
    # 示例2: getAdHotels — 获取广告推荐酒店
    # ============================================================
    print("\n--- [示例2] getAdHotels ---")
    print("URL: https://m.ctrip.com/restapi/soa2/34951/getAdHotels")
    print("方法: POST, JSON Body")
    print()

    ad_url = "https://m.ctrip.com/restapi/soa2/34951/getAdHotels"
    ad_body = {
        "cityId": 32,  # 广州
        "adPositionCodes": ["HTL_LST_002", "HTL_LST_001"],
        "head": {
            "platform": "PC",
            "cver": "0",
            "cid": "1782310638010.cb716D25YsQc",
            "bu": "HBU",
            "group": "ctrip",
            "aid": "4902",
            "sid": "130727",
            "ouid": "",
            "locale": "zh-CN",
            "timezone": "8",
            "currency": "CNY",
            "pageId": "10650171192",
            "vid": "1782310638010.cb716D25YsQc",
            "guid": "",
            "isSSR": False,
            "extension": [
                {"name": "cityId", "value": "32"},
                {"name": "checkIn", "value": "2026/06/24"},
                {"name": "checkOut", "value": "2026/06/25"},
                {"name": "region", "value": "CN"},
            ],
        },
    }

    try:
        resp = requests.post(ad_url, json=ad_body, headers=api_headers, timeout=15)
        print(f"[响应] 状态码: {resp.status_code}")
        if resp.status_code == 200:
            data = resp.json()
            print(f"[响应] 返回字段: {list(data.keys())}")

            # 尝试提取酒店列表
            hotels = data.get("adHotelList") or data.get("hotelList") or []
            print(f"[响应] 酒店数量: {len(hotels)}")

            for i, h in enumerate(hotels[:5]):
                name = h.get("hotelName") or h.get("name") or "未知"
                img = h.get("imageUrl") or h.get("picUrl") or "无图片"
                print(f"  [{i+1}] {name}")
                print(f"       图片: {str(img)[:100]}")
        else:
            print(f"[响应] 请求失败: {resp.text[:200]}")
    except Exception as e:
        print(f"[提示] getAdHotels 请求失败: {e}")

    print()
    print("="*60)
    print("[学习提示]")
    print("  1. head 中的 cid/vid/pageId 每次浏览器会话可能变化")
    print("  2. 如果请求失败，打开携程网站刷新页面，")
    print("     从 F12 → Network → XHR 中复制最新的 head 参数")
    print("  3. soa2/34951 是服务编号，不同功能的服务编号不同")
    print("  4. 主酒店搜索接口也是类似格式，在 XHR 中可以找到")
    print("="*60)


if __name__ == "__main__":
    # 运行主爬虫程序
    main()

    # 运行移动端API示例（演示抓包分析的真实接口）
    scrape_mobile_api_example()
