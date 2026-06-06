package com.zsc.web.controller.common;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import com.zsc.common.constant.CacheConstants;
import com.zsc.common.core.domain.AjaxResult;
import com.zsc.common.core.redis.RedisCache;
import com.zsc.common.utils.StringUtils;

/**
 * 邮箱验证码控制器
 * 
 * @author zsc
 */
@RestController
public class EmailController
{
    @Autowired
    private RedisCache redisCache;

    @Autowired
    private JavaMailSender mailSender;

    @Value("${spring.mail.username}")
    private String fromEmail;

    /**
     * 发送邮箱验证码
     */
    @PostMapping("/sendEmailCode")
    public AjaxResult sendEmailCode(@RequestBody Map<String, String> params)
    {
        String email = params.get("email");
        if (StringUtils.isEmpty(email))
        {
            return AjaxResult.error("邮箱地址不能为空");
        }

        // 验证邮箱格式
        if (!email.matches("^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$"))
        {
            return AjaxResult.error("请输入正确的邮箱地址");
        }

        // 生成6位验证码
        String code = String.format("%06d", (int) (Math.random() * 900000 + 100000));
        
        // 存储验证码到Redis，有效期5分钟
        String verifyKey = CacheConstants.EMAIL_CODE_KEY + email;
        redisCache.setCacheObject(verifyKey, code, 5, TimeUnit.MINUTES);

        // 发送真实邮件
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom(fromEmail);
            message.setTo(email);
            message.setSubject("【酒店预订系统】邮箱验证码");
            message.setText("您的验证码是：" + code + "，有效期5分钟。请尽快完成验证。\n\n如果这不是您的操作，请忽略此邮件。");
            mailSender.send(message);
        } catch (Exception e) {
            return AjaxResult.error("邮件发送失败：" + e.getMessage());
        }

        Map<String, Object> result = new HashMap<>();
        result.put("message", "验证码已发送，请注意查收邮箱");
        return AjaxResult.success(result);
    }

    /**
     * 验证邮箱验证码
     */
    @PostMapping("/verifyEmailCode")
    public AjaxResult verifyEmailCode(@RequestBody Map<String, String> params)
    {
        String email = params.get("email");
        String emailCode = params.get("emailCode");

        if (StringUtils.isEmpty(email) || StringUtils.isEmpty(emailCode))
        {
            return AjaxResult.error("邮箱或验证码不能为空");
        }

        String verifyKey = CacheConstants.EMAIL_CODE_KEY + email;
        String code = redisCache.getCacheObject(verifyKey);

        if (code == null)
        {
            return AjaxResult.error("验证码已过期，请重新获取");
        }

        if (!code.equals(emailCode))
        {
            return AjaxResult.error("验证码错误");
        }

        // 验证成功后删除验证码，并标记邮箱已验证（10分钟内可完成注册）
        redisCache.deleteObject(verifyKey);
        String verifiedKey = CacheConstants.EMAIL_VERIFIED_KEY + email;
        redisCache.setCacheObject(verifiedKey, "1", 10, TimeUnit.MINUTES);
        return AjaxResult.success("验证成功");
    }
}