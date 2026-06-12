package com.zsc.module.domain.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 酒店状态枚举
 *
 * @author zsc
 */
@Getter
@AllArgsConstructor
public enum HotelStatusEnum {

    /** 营业中 */
    OPEN("0", "营业中"),

    /** 草稿 */
    DRAFT("1", "草稿"),

    /** 待审核 */
    PENDING_AUDIT("2", "待审核"),

    /** 已下架 */
    OFFLINE("3", "已下架"),

    /** 已冻结 */
    FROZEN("4", "已冻结");

    /** 状态值 */
    private final String value;

    /** 状态描述 */
    private final String label;

    /**
     * 根据值获取枚举
     */
    public static HotelStatusEnum getByValue(String value) {
        for (HotelStatusEnum status : values()) {
            if (status.getValue().equals(value)) {
                return status;
            }
        }
        return null;
    }
}
