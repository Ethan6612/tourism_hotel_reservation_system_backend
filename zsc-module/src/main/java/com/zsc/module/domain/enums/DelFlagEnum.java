package com.zsc.module.domain.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 删除标志枚举
 *
 * @author zsc
 */
@Getter
@AllArgsConstructor
public enum DelFlagEnum {

    /** 正常 */
    NORMAL("0", "正常"),

    /** 已删除 */
    DELETED("2", "已删除");

    /** 状态值 */
    private final String value;

    /** 状态描述 */
    private final String label;

    /**
     * 根据值获取枚举
     */
    public static DelFlagEnum getByValue(String value) {
        for (DelFlagEnum status : values()) {
            if (status.getValue().equals(value)) {
                return status;
            }
        }
        return null;
    }
}
