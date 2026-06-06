package com.zsc.web.controller.system;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import com.zsc.common.constant.Constants;
import com.zsc.common.core.controller.BaseController;
import com.zsc.common.core.domain.AjaxResult;
import com.zsc.common.core.domain.model.RegisterBody;
import com.zsc.common.utils.StringUtils;
import com.zsc.framework.web.service.SysLoginService;
import com.zsc.framework.web.service.SysRegisterService;
import com.zsc.system.service.ISysConfigService;

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
    private SysLoginService loginService;

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
        AjaxResult ajax = AjaxResult.success();
        String token = loginService.loginWithoutCaptcha(user.getEmail(), user.getPassword());
        ajax.put(Constants.TOKEN, token);
        return ajax;
    }
}
