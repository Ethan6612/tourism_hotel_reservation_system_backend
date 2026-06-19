package com.zsc.module.domain.vo;

import com.zsc.common.annotation.Excel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.poi.ss.usermodel.HorizontalAlignment;

import java.math.BigDecimal;

/**
 * 每日营收 VO（用于趋势图和报表导出）
 *
 * @author zsc
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class DailyRevenueVo {

    /** 日期 (yyyy-MM-dd) */
    @Excel(name = "日期", width = 15)
    private String date;

    /** 当日收入 */
    @Excel(name = "收入(元)", width = 15, align = HorizontalAlignment.RIGHT)
    private BigDecimal revenue;

    /** 当日订单数 */
    @Excel(name = "订单数", width = 12)
    private Long orderCount;
}
