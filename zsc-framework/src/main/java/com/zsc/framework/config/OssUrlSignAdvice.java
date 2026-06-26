package com.zsc.framework.config;

import java.lang.reflect.Field;
import java.util.Collection;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.MethodParameter;
import org.springframework.http.MediaType;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyAdvice;

import com.zsc.common.utils.file.OssUploadUtils;

/**
 * 全局响应拦截：自动将 OSS URL 转换为带签名的可访问 URL
 *
 * @author zsc
 */
@ControllerAdvice
public class OssUrlSignAdvice implements ResponseBodyAdvice<Object>
{
    private static final Logger log = LoggerFactory.getLogger(OssUrlSignAdvice.class);

    /** OSS URL 前缀，用于快速判断是否需要处理 */
    private static final String OSS_URL_PREFIX = "https://hotel-booking-system.oss-";

    @Override
    public boolean supports(MethodParameter returnType, Class converterType)
    {
        // 所有 Controller 响应都处理
        return true;
    }

    @Override
    public Object beforeBodyWrite(Object body, MethodParameter returnType,
            MediaType selectedContentType, Class selectedConverterType,
            ServerHttpRequest request, ServerHttpResponse response)
    {
        if (body == null)
            return null;

        try
        {
            return replaceOssUrls(body);
        }
        catch (Exception e)
        {
            log.warn("OSS URL签名转换失败，返回原始数据", e);
            return body;
        }
    }

    /**
     * 递归替换对象中的所有 OSS URL
     */
    @SuppressWarnings("unchecked")
    private Object replaceOssUrls(Object obj) throws Exception
    {
        if (obj == null)
            return null;

        // String：直接替换
        if (obj instanceof String)
        {
            String str = (String) obj;
            if (str.contains(OSS_URL_PREFIX))
            {
                return OssUploadUtils.generatePresignedUrl(str);
            }
            return str;
        }

        // 集合
        if (obj instanceof Collection)
        {
            for (Object item : (Collection<Object>) obj)
            {
                replaceOssUrls(item);
            }
            return obj;
        }

        // Map
        if (obj instanceof Map)
        {
            Map<Object, Object> map = (Map<Object, Object>) obj;
            for (Map.Entry<Object, Object> entry : map.entrySet())
            {
                entry.setValue(replaceOssUrls(entry.getValue()));
            }
            return obj;
        }

        // 基本类型跳过
        if (obj.getClass().getName().startsWith("java."))
            return obj;

        // 普通对象：反射遍历字段
        Field[] fields = obj.getClass().getDeclaredFields();
        for (Field field : fields)
        {
            if (java.lang.reflect.Modifier.isStatic(field.getModifiers()))
                continue;

            field.setAccessible(true);
            Object value = field.get(obj);
            if (value != null)
            {
                field.set(obj, replaceOssUrls(value));
            }
        }

        return obj;
    }
}
