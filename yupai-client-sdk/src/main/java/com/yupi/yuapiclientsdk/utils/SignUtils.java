package com.yupi.yuapiclientsdk.utils;

import cn.hutool.crypto.digest.DigestAlgorithm;
import cn.hutool.crypto.digest.Digester;

import java.util.HashMap;

/**
 * 签名工具
 */
public class SignUtils {
    /**
     * 生成签名
     * @param body
     * @param secretKey
     * @return
     */
    public static String genSing(String body, String secretKey) {
        Digester md5 = new Digester(DigestAlgorithm.SHA256);
        String content = body+"."+secretKey;
        return md5.digestHex(content);
    }

    public static String genSing(HashMap<String, String> hashMap, String secretKey) {
        Digester md5 = new Digester(DigestAlgorithm.SHA256);
        String content = hashMap.toString() + "."+secretKey;
        return md5.digestHex(content);
    }
}
