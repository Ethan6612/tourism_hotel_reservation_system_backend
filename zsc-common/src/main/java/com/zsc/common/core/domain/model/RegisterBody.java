package com.zsc.common.core.domain.model;

/**
 * 用户注册对象
 * 
 * @author zsc
 */
public class RegisterBody extends LoginBody
{
    /**
     * 邮箱地址
     */
    private String email;

    /**
     * 邮箱验证码
     */
    private String emailCode;

    /**
     * 用户类型：0-普通用户，1-商家
     */
    private Integer userType;

    /**
     * 昵称
     */
    private String nickName;

    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public String getEmailCode()
    {
        return emailCode;
    }

    public void setEmailCode(String emailCode)
    {
        this.emailCode = emailCode;
    }

    public Integer getUserType()
    {
        return userType;
    }

    public void setUserType(Integer userType)
    {
        this.userType = userType;
    }

    public String getNickName()
    {
        return nickName;
    }

    public void setNickName(String nickName)
    {
        this.nickName = nickName;
    }
}