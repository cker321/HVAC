package com.example.apkapiservice.bean;

/**
 * 户型类型枚举
 */
public enum HouseType {
    T2("T2"),
    T4_1("T4-1"),
    T4_2("T4-2");

    private final String value;

    HouseType(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }

    /**
     * 根据字符串值获取对应的枚举
     *
     * @param value 字符串值
     * @return 对应的枚举，如果不存在则返回默认值T4_1
     */
    public static HouseType fromString(String value) {
        for (HouseType type : HouseType.values()) {
            if (type.value.equalsIgnoreCase(value)) {
                return type;
            }
        }
        return T4_1; // 默认返回T4-1户型
    }
}
