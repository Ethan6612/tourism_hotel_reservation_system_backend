package com.zsc.common.utils.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URL;
import java.util.Arrays;
import java.util.Date;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.aliyun.oss.ClientBuilderConfiguration;
import com.aliyun.oss.HttpMethod;
import com.aliyun.oss.model.GeneratePresignedUrlRequest;
import com.zsc.common.config.OssProperties;
import com.zsc.common.utils.DateUtils;
import com.zsc.common.utils.spring.SpringUtils;

/**
 * 阿里云OSS文件上传工具类
 *
 * @author zsc
 */
public class OssUploadUtils
{
    private static final Logger log = LoggerFactory.getLogger(OssUploadUtils.class);

    /** 默认大小 5M */
    public static final long DEFAULT_MAX_SIZE = 5 * 1024 * 1024L;

    /** 允许上传的图片扩展名 */
    private static final String[] ALLOWED_IMAGE_EXTENSION = { "bmp", "gif", "jpg", "jpeg", "png" };

    /** 上传到OSS的目录前缀 */
    private static final String OSS_PREFIX = "merchant/logo";

    /**
     * 以默认配置上传图片到OSS
     *
     * @param file 上传的文件
     * @return OSS文件完整URL
     * @throws Exception
     */
    public static final String upload(MultipartFile file) throws Exception
    {
        OssProperties ossProperties = SpringUtils.getBean(OssProperties.class);
        return upload(ossProperties, file);
    }

    /**
     * 上传文件到OSS
     *
     * @param ossProperties OSS配置
     * @param file 上传的文件
     * @return OSS文件完整URL
     * @throws Exception
     */
    public static final String upload(OssProperties ossProperties, MultipartFile file) throws Exception
    {
        // 校验文件大小
        assertAllowed(file);

        // 校验文件扩展名
        String extension = getExtension(file);
        assertAllowedImageExtension(extension);

        // 生成OSS对象Key: merchant/logo/{datePath}/{uuid}.{ext}
        String objectKey = OSS_PREFIX + "/" + DateUtils.datePath() + "/" + UUID.randomUUID().toString().replace("-", "") + "." + extension;

        // 构建虚拟主机风格的URL
        String url = "https://" + ossProperties.getBucketName() + "." + ossProperties.getEndpoint() + "/" + objectKey;

        // 创建OSS客户端并上传
        OSS ossClient = null;
        try (InputStream inputStream = file.getInputStream())
        {
            // 配置超时和重试
            ClientBuilderConfiguration conf = new ClientBuilderConfiguration();
            conf.setConnectionTimeout(5000);      // 连接超时 5s
            conf.setSocketTimeout(10000);         // 读取超时 10s
            conf.setMaxErrorRetry(1);             // 失败重试1次

            ossClient = new OSSClientBuilder().build(
                    "https://" + ossProperties.getEndpoint(),
                    ossProperties.getAccessKeyId(),
                    ossProperties.getAccessKeySecret(),
                    conf);

            // 上传文件（不使用ACL设置，Bucket级别控制访问权限）
            ossClient.putObject(ossProperties.getBucketName(), objectKey, inputStream);

            log.info("OSS上传成功: {} -> {}", file.getOriginalFilename(), url);
        }
        catch (Exception e)
        {
            log.error("OSS上传失败: {}", file.getOriginalFilename(), e);
            throw new Exception("OSS上传失败: " + e.getMessage());
        }
        finally
        {
            if (ossClient != null)
            {
                ossClient.shutdown();
            }
        }

        return url;
    }

    /** 预签名URL默认过期时间（7天） */
    private static final long PRESIGNED_EXPIRE_SECONDS = 7 * 24 * 3600;

    /**
     * 上传本地文件到OSS
     *
     * @param localFilePath 本地文件路径
     * @param objectKey OSS对象Key（如 hot-city/北京.jpg）
     * @return OSS文件完整URL
     * @throws Exception
     */
    public static final String uploadLocalFile(String localFilePath, String objectKey) throws Exception
    {
        OssProperties ossProperties = SpringUtils.getBean(OssProperties.class);
        return uploadLocalFile(ossProperties, localFilePath, objectKey);
    }

    /**
     * 上传本地文件到OSS
     *
     * @param ossProperties OSS配置
     * @param localFilePath 本地文件路径
     * @param objectKey OSS对象Key
     * @return OSS文件完整URL
     * @throws Exception
     */
    public static final String uploadLocalFile(OssProperties ossProperties, String localFilePath, String objectKey) throws Exception
    {
        File localFile = new File(localFilePath);
        if (!localFile.exists())
        {
            throw new Exception("文件不存在: " + localFilePath);
        }

        // 构建虚拟主机风格的URL
        String url = "https://" + ossProperties.getBucketName() + "." + ossProperties.getEndpoint() + "/" + objectKey;

        OSS ossClient = null;
        try (InputStream inputStream = new FileInputStream(localFile))
        {
            ClientBuilderConfiguration conf = new ClientBuilderConfiguration();
            conf.setConnectionTimeout(5000);
            conf.setSocketTimeout(10000);
            conf.setMaxErrorRetry(1);

            ossClient = new OSSClientBuilder().build(
                    "https://" + ossProperties.getEndpoint(),
                    ossProperties.getAccessKeyId(),
                    ossProperties.getAccessKeySecret(),
                    conf);

            ossClient.putObject(ossProperties.getBucketName(), objectKey, inputStream);

            log.info("OSS上传成功(本地文件): {} -> {}", localFilePath, url);
        }
        catch (Exception e)
        {
            log.error("OSS上传失败(本地文件): {}", localFilePath, e);
            throw new Exception("OSS上传失败: " + e.getMessage());
        }
        finally
        {
            if (ossClient != null)
            {
                ossClient.shutdown();
            }
        }

        return url;
    }

    /**
     * 将OSS URL转为带签名的可访问URL（默认7天有效）
     *
     * @param ossUrl OSS完整URL (如 https://bucket.endpoint/objectKey)
     * @return 带签名的URL
     */
    public static String generatePresignedUrl(String ossUrl)
    {
        return generatePresignedUrl(ossUrl, PRESIGNED_EXPIRE_SECONDS);
    }

    /**
     * 将OSS URL转为带签名的可访问URL
     *
     * @param ossUrl OSS完整URL
     * @param expirationSeconds 有效期（秒）
     * @return 带签名的URL，如果解析失败则返回原URL
     */
    public static String generatePresignedUrl(String ossUrl, long expirationSeconds)
    {
        if (ossUrl == null || ossUrl.isEmpty())
            return ossUrl;

        try
        {
            OssProperties ossProperties = SpringUtils.getBean(OssProperties.class);
            // 从URL中提取objectKey: https://bucket.endpoint/objectKey
            URL url = new URL(ossUrl);
            String objectKey = url.getPath().substring(1); // 去掉开头的 /

            OSS ossClient = new OSSClientBuilder().build(
                    "https://" + ossProperties.getEndpoint(),
                    ossProperties.getAccessKeyId(),
                    ossProperties.getAccessKeySecret());

            Date expiration = new Date(System.currentTimeMillis() + expirationSeconds * 1000);
            GeneratePresignedUrlRequest request = new GeneratePresignedUrlRequest(
                    ossProperties.getBucketName(), objectKey, HttpMethod.GET);
            request.setExpiration(expiration);

            java.net.URL signedUrl = ossClient.generatePresignedUrl(request);
            ossClient.shutdown();
            return signedUrl.toString();
        }
        catch (Exception e)
        {
            log.warn("生成OSS签名URL失败: {}", ossUrl, e);
            return ossUrl;
        }
    }

    /**
     * 文件大小校验
     *
     * @param file 上传的文件
     * @throws Exception
     */
    private static final void assertAllowed(MultipartFile file) throws Exception
    {
        long size = file.getSize();
        if (size > DEFAULT_MAX_SIZE)
        {
            throw new Exception("上传图片大小不能超过 " + (DEFAULT_MAX_SIZE / 1024 / 1024) + "MB");
        }
    }

    /**
     * 校验是否为允许的图片扩展名
     *
     * @param extension 文件扩展名
     * @throws Exception
     */
    private static void assertAllowedImageExtension(String extension) throws Exception
    {
        if (!Arrays.asList(ALLOWED_IMAGE_EXTENSION).contains(extension.toLowerCase()))
        {
            throw new Exception("只允许上传 " + Arrays.toString(ALLOWED_IMAGE_EXTENSION) + " 格式的图片");
        }
    }

    /**
     * 获取文件扩展名
     *
     * @param file 文件
     * @return 扩展名（小写）
     */
    private static String getExtension(MultipartFile file)
    {
        return FilenameUtils.getExtension(file.getOriginalFilename()).toLowerCase();
    }
}
