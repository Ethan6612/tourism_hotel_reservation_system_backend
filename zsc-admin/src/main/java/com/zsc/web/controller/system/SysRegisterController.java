package com.zsc.web.controller.system;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import com.zsc.common.constant.Constants;
import com.zsc.common.core.controller.BaseController;
import com.zsc.common.core.domain.AjaxResult;
import com.zsc.common.core.domain.entity.SysUser;
import com.zsc.common.core.domain.model.LoginUser;
import com.zsc.common.core.domain.model.RegisterBody;
import com.zsc.common.utils.StringUtils;
import com.zsc.framework.web.service.SysRegisterService;
import com.zsc.framework.web.service.TokenService;
import com.zsc.framework.web.service.UserDetailsServiceImpl;
import com.zsc.system.service.ISysConfigService;
import com.zsc.system.service.ISysUserService;

/**
 * 注册验证
 *
 * @author zsc
 */
@RestController
public class SysRegisterController extends BaseController
{
    @Autowired
    private SysRegisterService registerService;

    @Autowired
    private ISysConfigService configService;

    @Autowired
    private ISysUserService userService;

    @Autowired
    private UserDetailsServiceImpl userDetailsService;

    @Autowired
    private TokenService tokenService;

    @PostMapping("/register")
    public AjaxResult register(@RequestBody RegisterBody user)
    {
        if (!("true".equals(configService.selectConfigByKey("sys.account.registerUser"))))
        {
            return error("当前系统没有开启注册功能！");
        }
        String msg = registerService.register(user);
        if (StringUtils.isNotEmpty(msg))
        {
            return error(msg);
        }
        // 注册成功后直接构建登录用户并生成token，绕过认证链避免双重校验
        SysUser sysUser = userService.selectUserByUserName(user.getEmail());
        LoginUser loginUser = (LoginUser) userDetailsService.createLoginUser(sysUser);
        String token = tokenService.createToken(loginUser);
        AjaxResult ajax = AjaxResult.success();
        ajax.put(Constants.TOKEN, token);
        return ajax;
    }
}
