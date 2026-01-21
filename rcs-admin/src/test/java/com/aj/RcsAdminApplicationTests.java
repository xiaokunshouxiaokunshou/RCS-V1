package com.aj;

import org.json.JSONException;
import org.json.JSONObject;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import com.agv.sdk.agv.*;

@SpringBootTest
class RcsAdminApplicationTests {

    @Test
    void contextLoads() {
    }

    public static void main(String[] args) {
        // 第一步: 建立与机器人连接的客户端
        AGVClient agvClient = new AGVClient("127.0.0.1");
        try {
            //第二步：发送查询机器人电量的请求，根据 AGV 协议查询机器人电量的请求编号是 1007，请求参数 {"simple":true}。
            String reqStr = "{\"simple\": true}"; // 请求参数时 json 字符串
            AGVResult result = agvClient.request(1007, reqStr, 10000);
            if (AGVResultKind.Ok.equals(result.getKind())) {  // sdk 请求机器人成功
                String resStr = result.getResStr();         // 获取机器人返回的信息
                JSONObject resJson = new JSONObject(resStr);
                if (resJson.getInt("ret_code") == 0) {    // 机器人返回成功
                    float batteryLevel = resJson.getInt("battery_level"); // 获取电量
                } else {                                     // 机器人返回失败的原因
                    String robotErrMsg = resJson.getString("err_msg");
                }
            // //第二步： 发送抢占控制权
            // String reqsStr = "{\"nick_name\":\"AMB-01\"}";
            // AGVResult result = agvClient.request(4005, reqsStr, 10000);
            // if (AGVResultKind.Ok.equals(result.getKind())) {  // sdk 请求机器人成功
            //     String resStr = result.getResStr();         // 获取机器人返回的信息
            //     JSONObject resJson = new JSONObject(resStr);
            //     if (resJson.getInt("ret_code") == 0) {    // 机器人返回成功
            //         System.out.println("Success"); // 获取电量
            //         //第三步：发送移动指令
            //         {
            //             String moveReqStr = "{\"source_id\": \"LM3\", \"id\": \"LM1\"}";
            //             AGVResult moveResult = agvClient.request(3051, moveReqStr, 10000);
            //             if (AGVResultKind.Ok.equals(result.getKind())) {  // sdk 请求机器人成功
            //                 String moveResStr = moveResult.getResStr();         // 获取机器人返回的信息
            //                 JSONObject moveResJson = new JSONObject(moveResStr);
            //             }
            //         }
            //     } else {                                     // 机器人返回失败的原因
            //         String robotErrMsg = resJson.getString("err_msg");
            //     }

            // } else {                                          // sdk 请求请求机器人失败原因
            //     String sdkErrMsg = result.getErrMsg();
            }
        } catch (JSONException e) {
            throw new RuntimeException(e);
        } finally {
            // 第三步：客户端不在使用时，释放客户端连接
            agvClient.dispose();//释放连接资源
        }
    }

}
