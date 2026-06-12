package com.zsc.module.domain.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 分类状态枚举
 *
 * @author zsc
 */
@Getter
@AllArgsConstructor
public enum CategoryStatusEnum {

    /** 正常 */
    NORMAL("0", "正常"),

    /** 停用 */
    DISABLED("1", "停用");

    /** 状态值 */
    private final String value;

    /** 状态描述 */
    private final String label;

    /**
     * 根据值获取枚举
     */
    public static CategoryStatusEnum getByValue(String value) {
        for (CategoryStatusEnum status : values()) {
            if (status.getValue().equals(value)) {
                return status;
            }
        }
        return null;
    }
}
