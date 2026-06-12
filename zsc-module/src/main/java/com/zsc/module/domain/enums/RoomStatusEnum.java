package com.zsc.module.domain.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 房型状态枚举
 *
 * @author zsc
 */
@Getter
@AllArgsConstructor
public enum RoomStatusEnum {

    /** 上架 */
    ONLINE("0", "上架"),

    /** 下架 */
    OFFLINE("1", "下架");

    /** 状态值 */
    private final String value;

    /** 状态描述 */
    private final String label;

    /**
     * 根据值获取枚举
     */
    public static RoomStatusEnum getByValue(String value) {
        for (RoomStatusEnum status : values()) {
            if (status.getValue().equals(value)) {
                return status;
            }
        }
        return null;
    }
}
