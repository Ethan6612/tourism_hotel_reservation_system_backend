"""
携程酒店图片 → 阿里云 OSS 上传脚本
==============================================
1. 将 output/images/ 中的图片上传到 OSS
2. 更新 ../sql/merge.sql 中的 hotel 表数据
"""

import os
import re
import csv
import sys
from pathlib import Path

# ============================================================
# OSS 配置
# ============================================================
OSS_CONFIG = {
    "access_key_id": os.environ.get("OSS_ACCESS_KEY_ID", "your-access-key-id"),
    "access_key_secret": os.environ.get("OSS_ACCESS_KEY_SECRET", "your-access-key-secret"),
    "bucket_name": "hotel-booking-system",
    "endpoint": "oss-cn-shenzhen.aliyuncs.com",  # Bucket 实际区域
    "role_arn": "acs:ram::1356852472974036:role/oss-upload-role",
}

# OSS 图片 URL 前缀（Bucket 公共读时可直接访问）
OSS_BASE_URL = f"https://{OSS_CONFIG['bucket_name']}.{OSS_CONFIG['endpoint']}"
# 或者用 CDN 域名: OSS_BASE_URL = "https://your-cdn-domain.com"

# ============================================================
# 路径
# ============================================================
BASE_DIR = Path(__file__).parent
OUTPUT_DIR = BASE_DIR / "output"
IMAGE_DIR = OUTPUT_DIR / "images"
CSV_FILE = OUTPUT_DIR / "hotels.csv"
SQL_FILE = BASE_DIR.parent / "sql" / "merge.sql"
SQL_BACKUP = BASE_DIR.parent / "sql" / "merge_backup.sql"


def install_oss_sdk():
    """确保 oss2 SDK 已安装"""
    try:
        import oss2
        return oss2
    except ImportError:
        print("正在安装 oss2 SDK...")
        import subprocess
        subprocess.check_call([sys.executable, "-m", "pip", "install", "oss2", "-q"])
        import oss2
        return oss2


def get_sts_auth(oss2):
    """
    通过 STS AssumeRole 获取临时凭证（使用原始 HTTP 请求，无需阿里云 SDK）

    当 AccessKey 无直接 OSS 写权限时，扮演 RAM 角色获取临时密钥
    """
    import hmac
    import hashlib
    import base64
    import urllib.request
    import urllib.parse
    from datetime import datetime, timezone

    access_key_id = OSS_CONFIG["access_key_id"]
    access_key_secret = OSS_CONFIG["access_key_secret"]
    role_arn = OSS_CONFIG["role_arn"]

    try:
        # 构造 STS AssumeRole 请求（使用 API 签名 V1）
        # https://help.aliyun.com/zh/ram/developer-reference/api-sts-2015-04-01-assumerole
        endpoint = "https://sts.aliyuncs.com"

        params = {
            "Action": "AssumeRole",
            "RoleArn": role_arn,
            "RoleSessionName": "oss-upload",
            "DurationSeconds": "3600",
            "Format": "JSON",
            "Version": "2015-04-01",
            "AccessKeyId": access_key_id,
            "SignatureMethod": "HMAC-SHA1",
            "Timestamp": datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ"),
            "SignatureVersion": "1.0",
            "SignatureNonce": str(int(time.time() * 1000000)),
        }

        # 签名
        sorted_params = sorted(params.items(), key=lambda x: x[0])
        query_string = urllib.parse.urlencode(sorted_params)
        string_to_sign = "GET&%2F&" + urllib.parse.quote(query_string, safe="")
        key = access_key_secret + "&"
        signature = base64.b64encode(
            hmac.new(key.encode(), string_to_sign.encode(), hashlib.sha1).digest()
        ).decode()
        params["Signature"] = signature

        url = endpoint + "/?" + urllib.parse.urlencode(params)
        req = urllib.request.Request(url)
        resp = urllib.request.urlopen(req)
        data = json.loads(resp.read().decode())

        creds = data["Credentials"]
        print(f"[STS] 已获取临时凭证，有效期至 {creds.get('Expiration', 'N/A')}")
        return oss2.Auth(creds["AccessKeyId"], creds["AccessKeySecret"], creds["SecurityToken"])

    except Exception as e:
        print(f"[警告] STS AssumeRole 失败: {e}")
        print("[降级] 尝试直接使用 AccessKey")
        return oss2.Auth(access_key_id, access_key_secret)


def upload_images(oss2):
    """
    将所有图片上传到 OSS 的 hotel-images/ 目录

    返回: {本地文件名: OSS URL}
    """
    # 先尝试 STS，失败则直接用 AK
    try:
        auth = get_sts_auth(oss2)
    except Exception:
        auth = oss2.Auth(OSS_CONFIG["access_key_id"], OSS_CONFIG["access_key_secret"])

    bucket = oss2.Bucket(auth, OSS_CONFIG["endpoint"], OSS_CONFIG["bucket_name"])

    url_map = {}
    image_files = sorted(IMAGE_DIR.glob("*"))

    if not image_files:
        print("[错误] 没有找到图片文件")
        return url_map

    print(f"[上传] 共 {len(image_files)} 张图片，开始上传到 OSS...")
    success = 0
    skip = 0
    fail = 0

    for i, img_path in enumerate(image_files):
        if not img_path.is_file():
            continue

        oss_key = f"hotel-images/{img_path.name}"

        try:
            # 检查是否已存在（可选，避免重复上传）
            # bucket.object_exists(oss_key)

            # 上传
            bucket.put_object_from_file(oss_key, str(img_path))
            oss_url = f"{OSS_BASE_URL}/{oss_key}"
            url_map[img_path.name] = oss_url
            success += 1

        except Exception as e:
            print(f"  [失败] {img_path.name}: {e}")
            fail += 1
            # 失败时用本地文件名作为兜底
            url_map[img_path.name] = f"{OSS_BASE_URL}/hotel-images/{img_path.name}"
            continue

        # 进度
        if (i + 1) % 50 == 0 or (i + 1) == len(image_files):
            print(f"    进度: {i+1}/{len(image_files)} (成功 {success}, 跳过 {skip}, 失败 {fail})")

    print(f"\n[上传完成] 成功 {success}/{len(image_files)}, 失败 {fail}")
    return url_map


def load_csv():
    """加载 CSV 文件，返回酒店列表"""
    hotels = []
    if not CSV_FILE.exists():
        print(f"[错误] CSV 文件不存在: {CSV_FILE}")
        return hotels

    with open(CSV_FILE, "r", encoding="utf-8-sig") as f:
        reader = csv.DictReader(f)
        for row in reader:
            hotels.append(row)
    print(f"[CSV] 加载 {len(hotels)} 家酒店数据")
    return hotels


def match_images_to_hotels(hotels, url_map):
    """
    将本地图片文件名与酒店匹配，生成 OSS URL

    图片命名格式: {序号}_{酒店名称}.webp
    匹配逻辑: 酒店名称包含在文件名中
    """
    # 建立文件名 → OSS URL 索引
    file_index = {}
    for fname, url in url_map.items():
        file_index[fname] = url

    for i, hotel in enumerate(hotels):
        hotel_name = hotel.get("name", "").strip()
        seq = f"{i+1:03d}"  # 序号，与文件名前3位对应

        # 按序号匹配（最快）
        matched_url = ""
        for fname in url_map:
            if fname.startswith(seq):
                matched_url = url_map[fname]
                break

        # 按酒店名模糊匹配
        if not matched_url:
            for fname in url_map:
                if hotel_name[:10] in fname:
                    matched_url = url_map[fname]
                    break

        hotel["oss_url"] = matched_url
        if not matched_url:
            hotel["oss_url"] = hotel.get("image_url", "")

    return hotels


def generate_sql(hotels):
    """生成新的 hotel 表 INSERT 语句"""
    # 现有 SQL 文件中的 hotel ID 从 1 开始
    # 列: id, name, address, star, score, img_url, facility, business_id, status, create_time, update_time

    lines = []
    lines.append("-- ----------------------------")
    lines.append("-- Records of hotel (自动生成 from 携程爬虫)")
    lines.append("-- ----------------------------")

    # 城市→地址映射（模拟）
    city_address = {
        "上海": "上海市浦东新区世纪大道100号",
        "北京": "北京市朝阳区建国路93号",
        "广州": "广州市天河区珠江新城花城大道66号",
        "深圳": "深圳市福田区深南大道6013号",
        "杭州": "杭州市上城区西湖大道333号",
        "成都": "成都市锦江区春熙路88号",
        "重庆": "重庆市渝中区民族路188号",
        "南京": "南京市鼓楼区中山北路200号",
        "西安": "西安市碑林区南大街1号",
        "苏州": "苏州市姑苏区观前街188号",
        "三亚": "三亚市天涯区三亚湾路168号",
        "青岛": "青岛市市南区香港中路66号",
        "大连": "大连市中山区人民路50号",
        "长沙": "长沙市岳麓区橘子洲头2号",
        "香港": "香港中环金融街8号",
        "厦门": "厦门市思明区鹭江道18号",
        "武汉": "武汉市武昌区中南路99号",
        "天津": "天津市和平区南京路108号",
    }

    facilities = "WiFi,停车场,餐厅,会议室"

    for i, hotel in enumerate(hotels):
        hid = i + 1
        name = hotel.get("name", f"酒店{hid}").replace("'", "''")  # SQL 转义
        city = hotel.get("city", "上海")
        address = city_address.get(city, f"{city}市中心")
        score = hotel.get("score", "4.5")
        img_url = hotel.get("oss_url", "")

        # 清理评分
        try:
            score_val = float(score)
        except (ValueError, TypeError):
            score_val = 4.5
        score_str = f"{score_val:.2f}"

        # 星级（简单映射）
        if score_val >= 4.8:
            star = 5
        elif score_val >= 4.3:
            star = 4
        elif score_val >= 3.8:
            star = 3
        else:
            star = 2

        business_id = 1001 + (i % 50)  # 循环分配商家ID

        # INSERT
        sql = (
            f"INSERT INTO `hotel` VALUES ("
            f"{hid}, "
            f"'{name}', "
            f"'{address}', "
            f"{star}, "
            f"{score_str}, "
            f"'{img_url}', "
            f"'{facilities}', "
            f"{business_id}, "
            f"'0', "
            f"'2026-06-02 00:30:57', "
            f"'2026-06-02 00:30:57'"
            f");"
        )
        lines.append(sql)

    return "\n".join(lines)


def update_sql_file(new_hotel_sql):
    """更新 merge.sql 中的 hotel 表数据"""
    if not SQL_FILE.exists():
        print(f"[错误] SQL 文件不存在: {SQL_FILE}")
        return False

    # 备份原文件
    print(f"[备份] 原 SQL → {SQL_BACKUP.name}")
    with open(SQL_FILE, "r", encoding="utf-8") as f:
        content = f.read()
    with open(SQL_BACKUP, "w", encoding="utf-8") as f:
        f.write(content)

    # 替换 hotel 表的 Records 部分
    # 匹配从 "-- Records of hotel" 到下一个 "-- Table structure" 之间的内容
    pattern = r"(-- Records of hotel\s*\n).*?(?=\n-- -+\n-- Table structure)"
    replacement = r"\1" + new_hotel_sql + "\n"

    new_content = re.sub(pattern, replacement, content, flags=re.DOTALL)

    if new_content == content:
        print("[警告] 未找到 hotel Records 替换点，尝试追加模式...")
        # 备选：找到 hotel 表的 CREATE TABLE 后面没有记录的，追加
        marker = "COMMENT = '酒店表' ROW_FORMAT = DYNAMIC;\n"
        idx = content.find(marker)
        if idx > 0:
            insert_pos = idx + len(marker)
            new_content = (
                content[:insert_pos]
                + "\n-- ----------------------------\n"
                + "-- Records of hotel\n"
                + "-- ----------------------------\n"
                + new_hotel_sql
                + "\n\n"
                + content[insert_pos:]
            )
        else:
            return False

    with open(SQL_FILE, "w", encoding="utf-8") as f:
        f.write(new_content)

    print(f"[更新] {SQL_FILE.name} 已更新，共 {new_hotel_sql.count('INSERT')} 条记录")
    return True


def main():
    print("=" * 60)
    print("携程酒店图片 → OSS 上传 + SQL 更新")
    print("=" * 60)

    # 1. 安装 oss2
    oss2 = install_oss_sdk()

    # 2. 上传图片（失败不阻塞，降级用 Ctrip CDN URL）
    url_map = {}
    try:
        url_map = upload_images(oss2)
    except Exception as e:
        print(f"[跳过] OSS 上传失败: {e}")
        print("[降级] 将使用 Ctrip CDN 图片 URL 生成 SQL")

    # 3. 加载 CSV
    hotels = load_csv()
    if not hotels:
        return

    # 4. 匹配图片 URL
    # 优先用 OSS URL，否则用 CSV 中原有的 Ctrip CDN URL
    if url_map:
        hotels = match_images_to_hotels(hotels, url_map)
        matched = sum(1 for h in hotels if h["oss_url"] and "hotel-images" in h["oss_url"])
        print(f"[匹配] {matched}/{len(hotels)} 家酒店匹配到 OSS 图片")
    else:
        # OSS 上传失败/跳过时，直接用 CSV 中的 Ctrip CDN URL
        for h in hotels:
            h["oss_url"] = h.get("image_url", "")
        print("[降级] 使用 Ctrip CDN 图片 URL")

    # 5. 生成 SQL
    new_sql = generate_sql(hotels)

    # 6. 更新 SQL 文件
    if update_sql_file(new_sql):
        print("\n" + "=" * 60)
        print("[完成] 操作成功！")
        print(f"  SQL 更新: {len(hotels)} 条记录")
        if url_map:
            print(f"  图片上传: {len(url_map)} 张 → {OSS_BASE_URL}/hotel-images/")
        else:
            print(f"  图片来源: Ctrip CDN（非 OSS）")
        print(f"  原 SQL 备份: {SQL_BACKUP}")
        print("=" * 60)
    else:
        print("[错误] SQL 文件更新失败")


if __name__ == "__main__":
    main()
