package com.zsc.web.controller.common;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.concurrent.TimeUnit;
import javax.imageio.ImageIO;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.util.FastByteArrayOutputStream;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import com.google.code.kaptcha.Producer;
import com.zsc.common.config.RuoYiConfig;
import com.zsc.common.constant.CacheConstants;
import com.zsc.common.constant.Constants;
import com.zsc.common.core.domain.AjaxResult;
import com.zsc.common.core.redis.RedisCache;
import com.zsc.common.utils.sign.Base64;
import com.zsc.common.utils.uuid.IdUtils;
import com.zsc.system.service.ISysConfigService;

/**
 * 验证码操作处理
 * 
 * @author zsc
 */
@RestController
public class CaptchaController
{
    @Autowired(required = false)
    private Producer captchaProducer;

    @Autowired(required = false)
    @Qualifier("captchaProducerMath")
    private Producer captchaProducerMath;

    @Autowired(required = false)
    private RedisCache redisCache;

    @Autowired
    private ISysConfigService configService;
    /**
     * 生成验证码
     */
    @GetMapping("/captchaImage")
    public AjaxResult getCode(HttpServletResponse response) throws IOException
    {
        AjaxResult ajax = AjaxResult.success();
        boolean captchaEnabled = configService.selectCaptchaEnabled();
        boolean registerUser = "true".equals(configService.selectConfigByKey("sys.account.registerUser"));
        ajax.put("captchaEnabled", captchaEnabled);
        ajax.put("registerUser", registerUser);
        if (!captchaEnabled)
        {
            return ajax;
        }

        // 如果 Redis 不可用，使用内存缓存或直接返回验证码已禁用
        if (redisCache == null)
        {
            ajax.put("captchaEnabled", false);
            return ajax;
        }

        // 保存验证码信息
        String uuid = IdUtils.simpleUUID();
        String verifyKey = CacheConstants.CAPTCHA_CODE_KEY + uuid;

        String capStr = null, code = null;
        BufferedImage image = null;

        // 验证码生成器不可用时，禁用验证码
        if (captchaProducer == null && captchaProducerMath == null) {
            ajax.put("captchaEnabled", false);
            return ajax;
        }

        // 生成验证码
        String captchaType = RuoYiConfig.getCaptchaType();
        if ("math".equals(captchaType) && captchaProducerMath != null)
        {
            String capText = captchaProducerMath.createText();
            capStr = capText.substring(0, capText.lastIndexOf("@"));
            code = capText.substring(capText.lastIndexOf("@") + 1);
            image = captchaProducerMath.createImage(capStr);
        }
        else if (captchaProducer != null)
        {
            capStr = code = captchaProducer.createText();
            image = captchaProducer.createImage(capStr);
        }
        else
        {
            ajax.put("captchaEnabled", false);
            return ajax;
        }

        redisCache.setCacheObject(verifyKey, code, Constants.CAPTCHA_EXPIRATION, TimeUnit.MINUTES);
        // 转换流信息写出
        FastByteArrayOutputStream os = new FastByteArrayOutputStream();
        try
        {
            ImageIO.write(image, "jpg", os);
        }
        catch (IOException e)
        {
            return AjaxResult.error(e.getMessage());
        }

        ajax.put("uuid", uuid);
        ajax.put("img", Base64.encode(os.toByteArray()));
        return ajax;
    }
}
