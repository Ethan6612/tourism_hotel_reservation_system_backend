package com.zsc.module.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zsc.common.utils.SecurityUtils;
import com.zsc.module.common.response.ResultVo;
import com.zsc.module.domain.vo.MerchantNoticeVo;
import com.zsc.system.domain.SysNotice;
import com.zsc.system.service.ISysNoticeService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 商户端通知中心控制器
 *
 * @author zsc
 */
@Tag(name = "商户通知中心")
@RestController
@RequestMapping("/api/merchant/notice")
public class MerchantNoticeController {

    @Autowired
    private ISysNoticeService sysNoticeService;

    /**
     * 查询通知列表
     * 商户可以看到：1) 所有公告（通知类型=2） 2) 发送给自己的通知（通过createBy字段匹配）
     */
    @Operation(summary = "查询我的通知列表")
    @GetMapping("/list")
    public ResultVo<List<MerchantNoticeVo>> list(
            @RequestParam(defaultValue = "1") Integer pageNum,
            @RequestParam(defaultValue = "10") Integer pageSize) {
        Page<SysNotice> page = new Page<>(pageNum, pageSize);
        List<SysNotice> noticeList = sysNoticeService.selectNoticeList(page, new SysNotice());

        String currentUsername = SecurityUtils.getUsername();

        List<MerchantNoticeVo> voList = noticeList.stream()
                // 过滤：公告所有人可见，通知只显示发送给当前用户的
                .filter(notice -> "2".equals(notice.getNoticeType())
                        || currentUsername.equals(notice.getCreateBy()))
                .map(notice -> MerchantNoticeVo.builder()
                        .noticeId(notice.getNoticeId())
                        .noticeTitle(notice.getNoticeTitle())
                        .noticeType(notice.getNoticeType())
                        .noticeContent(notice.getNoticeContent())
                        .status(notice.getStatus())
                        .createBy(notice.getCreateBy())
                        .createTime(notice.getCreateTime())
                        .updateTime(notice.getUpdateTime())
                        .remark(notice.getRemark())
                        .build())
                .collect(Collectors.toList());

        return ResultVo.ok(voList);
    }

    /**
     * 获取通知详情
     */
    @Operation(summary = "获取通知详情")
    @GetMapping("/{id}")
    public ResultVo<MerchantNoticeVo> get(@PathVariable Long id) {
        SysNotice notice = sysNoticeService.selectNoticeById(id);
        if (notice == null) {
            return ResultVo.<MerchantNoticeVo>ok(null);
        }
        MerchantNoticeVo vo = MerchantNoticeVo.builder()
                .noticeId(notice.getNoticeId())
                .noticeTitle(notice.getNoticeTitle())
                .noticeType(notice.getNoticeType())
                .noticeContent(notice.getNoticeContent())
                .status(notice.getStatus())
                .createBy(notice.getCreateBy())
                .createTime(notice.getCreateTime())
                .updateTime(notice.getUpdateTime())
                .remark(notice.getRemark())
                .build();
        return ResultVo.ok(vo);
    }
}
