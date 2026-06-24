package com.zsc.module.domain.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 酒店审核状态枚举
 */
@Getter
@AllArgsConstructor
public enum HotelAuditStatusEnum {

    PENDING("0", "待审核"),
    APPROVED("1", "审核通过"),
    REJECTED("2", "审核驳回");

    private final String value;
    private final String label;

    /**
     * 根据值获取枚举
     */
    public static HotelAuditStatusEnum getByValue(String value) {
        for (HotelAuditStatusEnum e : values()) {
            if (e.getValue().equals(value)) {
                return e;
            }
        }
        return null;
    }
}
