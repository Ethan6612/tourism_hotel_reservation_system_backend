package com.zsc.module.config;

import com.zsc.common.constant.CacheConstants;
import com.zsc.common.core.redis.RedisCache;
import com.zsc.module.domain.vo.HotCityVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * 热门城市初始化器
 * 应用启动时检查 Redis 中是否有热门城市数据，若没有则写入种子数据
 *
 * @author zsc
 */
@Component
@Order(1)
public class HotCityInitializer implements CommandLineRunner {

    private static final Logger log = LoggerFactory.getLogger(HotCityInitializer.class);

    /** OSS Bucket 基础 URL */
    private static final String OSS_BASE_URL = "https://hotel-booking-system.oss-cn-shenzhen.aliyuncs.com";

    @Autowired
    private RedisCache redisCache;

    @Override
    public void run(String... args) throws Exception {
        if (redisCache.hasKey(CacheConstants.HOT_CITIES_KEY)) {
            log.info("热门城市数据已存在于 Redis 中，跳过初始化");
            return;
        }

        log.info("Redis 中无热门城市数据，开始写入种子数据...");
        List<HotCityVo> hotCities = buildSeedData();
        redisCache.setCacheList(CacheConstants.HOT_CITIES_KEY, hotCities);
        log.info("热门城市种子数据写入完成，共 {} 个城市", hotCities.size());
    }

    /**
     * 构建初始热门城市种子数据
     */
    private List<HotCityVo> buildSeedData() {
        List<HotCityVo> list = new ArrayList<>();

        list.add(HotCityVo.builder()
                .cityName("北京")
                .imageUrl(OSS_BASE_URL + "/hot-city/北京.jpg")
                .build());

        list.add(HotCityVo.builder()
                .cityName("上海")
                .imageUrl(OSS_BASE_URL + "/hot-city/上海.jpg")
                .build());

        list.add(HotCityVo.builder()
                .cityName("广州")
                .imageUrl(OSS_BASE_URL + "/hot-city/广州.jpg")
                .build());

        list.add(HotCityVo.builder()
                .cityName("深圳")
                .imageUrl(OSS_BASE_URL + "/hot-city/深圳.jpg")
                .build());

        list.add(HotCityVo.builder()
                .cityName("成都")
                .imageUrl(OSS_BASE_URL + "/hot-city/成都.jpg")
                .build());

        list.add(HotCityVo.builder()
                .cityName("杭州")
                .imageUrl(OSS_BASE_URL + "/hot-city/杭州.jpg")
                .build());

        list.add(HotCityVo.builder()
                .cityName("南京")
                .imageUrl(OSS_BASE_URL + "/hot-city/南京.jpg")
                .build());

        list.add(HotCityVo.builder()
                .cityName("西安")
                .imageUrl(OSS_BASE_URL + "/hot-city/西安.jpg")
                .build());

        list.add(HotCityVo.builder()
                .cityName("重庆")
                .imageUrl(OSS_BASE_URL + "/hot-city/重庆.jpg")
                .build());

        list.add(HotCityVo.builder()
                .cityName("武汉")
                .imageUrl(OSS_BASE_URL + "/hot-city/武汉.jpg")
                .build());

        list.add(HotCityVo.builder()
                .cityName("长沙")
                .imageUrl(OSS_BASE_URL + "/hot-city/长沙.jpg")
                .build());

        list.add(HotCityVo.builder()
                .cityName("厦门")
                .imageUrl(OSS_BASE_URL + "/hot-city/厦门.jpg")
                .build());

        return list;
    }
}
