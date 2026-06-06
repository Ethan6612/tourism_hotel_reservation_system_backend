package com.zsc.framework.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.zsc.common.constant.CacheConstants;
import com.zsc.common.constant.Constants;
import com.zsc.common.constant.UserConstants;
import com.zsc.common.core.domain.entity.SysUser;
import com.zsc.common.core.domain.model.RegisterBody;
import com.zsc.common.core.redis.RedisCache;
import com.zsc.common.exception.user.CaptchaException;
import com.zsc.common.exception.user.CaptchaExpireException;
import com.zsc.common.utils.DateUtils;
import com.zsc.common.utils.MessageUtils;
import com.zsc.common.utils.SecurityUtils;
import com.zsc.common.utils.StringUtils;
import com.zsc.framework.manager.AsyncManager;
import com.zsc.framework.manager.factory.AsyncFactory;
import com.zsc.system.service.ISysConfigService;
import com.zsc.system.service.ISysUserService;

/**
 * 注册校验方法
 * 
 * @author zsc
 */
@Component
public class SysRegisterService
{
    @Autowired
    private ISysUserService userService;

    @Autowired
    private ISysConfigService configService;

    @Autowired
    private RedisCache redisCache;

    /**
     * 普通用户角色ID
     */
    private static final Long NORMAL_USER_ROLE_ID = 2L;

    /**
     * 商家角色ID
     */
    private static final Long MERCHANT_ROLE_ID = 3L;

    /**
     * 注册用户默认部门（与角色数据权限保持一致）
     */
    private static final Long DEFAULT_DEPT_ID = 100L;

    /**
     * 注册
     */
    public String register(RegisterBody registerBody)
    {
        String msg = "";
        String email = registerBody.getEmail();
        String password = registerBody.getPassword();
        String emailCode = registerBody.getEmailCode();
        Integer userType = registerBody.getUserType();
        String nickName = registerBody.getNickName();

        SysUser sysUser = new SysUser();
        // 使用邮箱作为用户名
        sysUser.setUserName(email);
        sysUser.setEmail(email);

        // 1. 验证邮箱
        if (StringUtils.isEmpty(email))
        {
            msg = "邮箱地址不能为空";
        }
        else if (!email.matches("^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$"))
        {
            msg = "请输入正确的邮箱地址";
        }
        // 2. 验证邮箱验证码（支持两步注册：先验证邮箱，再设置密码）
        else if (!validateEmailOrVerified(email, emailCode))
        {
            msg = "请先完成邮箱验证";
        }
        // 3. 验证密码
        else if (StringUtils.isEmpty(password))
        {
            msg = "用户密码不能为空";
        }
        else if (password.length() < UserConstants.PASSWORD_MIN_LENGTH
                || password.length() > UserConstants.PASSWORD_MAX_LENGTH)
        {
            msg = "密码长度必须在5到20个字符之间";
        }
        // 4. 验证用户类型
        else if (userType == null || (userType != 0 && userType != 1))
        {
            msg = "请选择用户类型";
        }
        // 5. 检查邮箱是否已注册
        else if (!userService.checkEmailUnique(sysUser))
        {
            msg = "该邮箱已被注册";
        }
        // 6. 检查用户名是否唯一
        else if (!userService.checkUserNameUnique(sysUser))
        {
            msg = "用户名已存在";
        }
        else
        {
            // 设置昵称，优先使用用户输入的昵称，否则使用邮箱
            sysUser.setNickName(StringUtils.isNotEmpty(nickName) ? nickName : email);
            sysUser.setPwdUpdateDate(DateUtils.getNowDate());
            sysUser.setPassword(SecurityUtils.encryptPassword(password));
            sysUser.setStatus("0");
            sysUser.setDelFlag("0");
            sysUser.setDeptId(DEFAULT_DEPT_ID);
            sysUser.setSex("2");
            sysUser.setCreateBy(email);

            // 根据用户类型分配角色（与后台用户管理-分配角色一致）
            if (userType == 1)
            {
                // 商家
                sysUser.setRoleId(MERCHANT_ROLE_ID);
                sysUser.setRoleIds(new Long[]{MERCHANT_ROLE_ID});
            }
            else
            {
                // 普通用户
                sysUser.setRoleId(NORMAL_USER_ROLE_ID);
                sysUser.setRoleIds(new Long[]{NORMAL_USER_ROLE_ID});
            }

            boolean regFlag = userService.registerUser(sysUser);
            if (!regFlag)
            {
                msg = "注册失败,请联系系统管理人员";
            }
            else
            {
                AsyncManager.me().execute(AsyncFactory.recordLogininfor(email, Constants.REGISTER, MessageUtils.message("user.register.success")));
                // 注册成功后清除验证标记
                redisCache.deleteObject(CacheConstants.EMAIL_VERIFIED_KEY + email);
            }
        }
        return msg;
    }

    /**
     * 校验邮箱验证码或已验证标记
     */
    private boolean validateEmailOrVerified(String email, String emailCode)
    {
        String verifiedKey = CacheConstants.EMAIL_VERIFIED_KEY + email;
        String verified = redisCache.getCacheObject(verifiedKey);
        if ("1".equals(verified))
        {
            return true;
        }
        if (StringUtils.isEmpty(emailCode))
        {
            return false;
        }
        return validateEmailCode(email, emailCode);
    }

    /**
     * 校验邮箱验证码
     * 
     * @param email 邮箱
     * @param emailCode 邮箱验证码
     * @return 结果
     */
    public boolean validateEmailCode(String email, String emailCode)
    {
        String verifyKey = CacheConstants.EMAIL_CODE_KEY + email;
        String code = redisCache.getCacheObject(verifyKey);
        
        if (code == null)
        {
            return false;
        }
        
        if (!code.equals(emailCode))
        {
            return false;
        }
        
        // 验证成功后删除验证码
        redisCache.deleteObject(verifyKey);
        return true;
    }

    /**
     * 校验图形验证码
     * 
     * @param username 用户名
     * @param code 验证码
     * @param uuid 唯一标识
     * @return 结果
     */
    public void validateCaptcha(String username, String code, String uuid)
    {
        String verifyKey = CacheConstants.CAPTCHA_CODE_KEY + StringUtils.nvl(uuid, "");
        String captcha = redisCache.getCacheObject(verifyKey);
        redisCache.deleteObject(verifyKey);
        if (captcha == null)
        {
            throw new CaptchaExpireException();
        }
        if (!code.equalsIgnoreCase(captcha))
        {
            throw new CaptchaException();
        }
    }
}