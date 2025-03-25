package com.yupi.yuapiclientsdk.client;

import cn.hutool.core.util.RandomUtil;
import cn.hutool.crypto.digest.DigestAlgorithm;
import cn.hutool.crypto.digest.Digester;
import cn.hutool.http.HttpRequest;
import cn.hutool.http.HttpResponse;
import cn.hutool.http.HttpUtil;
import cn.hutool.json.JSONUtil;
import com.yupi.yuapiclientsdk.model.User;
import com.yupi.yuapiclientsdk.temp.DataserviceDeviceData;
import com.yupi.yuapiclientsdk.utils.SignUtils;
import java.util.HashMap;
import java.util.Map;

/**
 * 调用第三方接口的客户端
 */
public class YuApiClient {

    private static final String GATEWAY_HOST = "http://localhost:8123";

    private String accessKey;
    private String secretKey;

    public YuApiClient(String accessKey, String secretKey) {
        this.accessKey = accessKey;
        this.secretKey = secretKey;
    }

    public String getNameByGet(String name) {
        //可以单独传入http参数，这样参数会自动做URL编码，拼接在URL中
        HashMap<String, Object> paramMap = new HashMap<>();
        paramMap.put("name", name);
        String result= HttpUtil.get(GATEWAY_HOST+"/api/name/", paramMap);
        System.out.println(result);
        return result;
    }

//    public static void main(String[] args) {
//        DataserviceDeviceData dataserviceDeviceData = new DataserviceDeviceData();
//        dataserviceDeviceData.setDataDeviceId("123");
//        String json = JSONUtil.toJsonStr(dataserviceDeviceData);
//        Map<String, String> hashMap = new HashMap<>();
//        hashMap.put("accessKey", "6309de886483c18b7edd502efd7efd3d");
//        hashMap.put("nonce", RandomUtil.randomNumbers(4));
//        hashMap.put("timestamp", String.valueOf(System.currentTimeMillis()/1000));
//        Digester md5 = new Digester(DigestAlgorithm.SHA256);
//        String mySign =  md5.digestHex("e2ab71c7d8c91d65aa5c04dc77ce4973"+ hashMap.get("nonce")+hashMap.get("timestamp"));
//        hashMap.put("sign", mySign);
//        HttpResponse httpResponse = HttpRequest.post("http://localhost:8980/js/deviceAction/save")
//                .body(json)
//                .addHeaders(hashMap)
//                .execute();
//        System.out.println(httpResponse);
//    }

    public String getNameByPost(String name) {
        //可以单独传入http参数，这样参数会自动做URL编码，拼接在URL中
        HashMap<String, Object> paramMap = new HashMap<>();
        paramMap.put("name", name);
        String result= HttpUtil.get(GATEWAY_HOST+"/api/name/", paramMap);
        System.out.println(result);
        return result;
    }

    private Map<String, String> getHeaderMap(String body) {
        Map<String, String> hashMap = new HashMap<>();
        hashMap.put("accessKey", accessKey);
//        hashMap.put("secretKey", secretKey);
        hashMap.put("nonce", RandomUtil.randomNumbers(4));
        hashMap.put("body", body);
        hashMap.put("timestamp", String.valueOf(System.currentTimeMillis()/1000));
        hashMap.put("sign", SignUtils.genSing(body, secretKey));
        return hashMap;
    }

    public String getUsernameByPost(User user) {
        String json = JSONUtil.toJsonStr(user);
        HttpResponse httpResponse = HttpRequest.post(GATEWAY_HOST+"/api/name/user")
                .addHeaders(getHeaderMap(json))
                .body(json)
                .execute();

        System.out.println(httpResponse.getStatus());
        String result = httpResponse.body();
        System.out.println(result);
        return result;
    }

}
