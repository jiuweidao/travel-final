package com.travel.utils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;
import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import static org.apache.commons.codec.binary.Base64.encodeBase64;



/**
 * 使用APPCODE进行云市场ocr服务接口调用
 */

public class IdCardCode {

    /*
     * 获取参数的json对象
     */
    public static JSONObject getParam(int type, String dataValue) {
        JSONObject obj = new JSONObject();
        try {
            obj.put("dataType", type);
            obj.put("dataValue", dataValue);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return obj;
    }

    public static String getIdCarMessage(String imgFile){

        String host = "http://dm-51.data.aliyun.com";
        String path = "/rest/160601/ocr/ocr_idcard.json";
        String appcode = "dc7528c3072048b99d2a40c228217f2f";
        //String imgFile = "C:\\Users\\firepig\\Desktop\\idcard.jpg";
        Boolean is_old_format = false;//如果文档的输入中含有inputs字段，设置为True， 否则设置为False
        //请根据线上文档修改configure字段
        JSONObject configObj = new JSONObject();
        configObj.put("side", "face");
        String config_str = configObj.toString();
        //            configObj.put("min_size", 5);
        //            String config_str = "";

        String method = "POST";
        Map<String, String> headers = new HashMap<String, String>();
        //最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73fe94948385f570e3c139105
        headers.put("Authorization", "APPCODE " + appcode);

        Map<String, String> querys = new HashMap<String, String>();

        // 对图像进行base64编码
        String imgBase64 = "";
        try {
            File file = new File(imgFile);
            byte[] content = new byte[(int) file.length()];
            FileInputStream finputstream = new FileInputStream(file);
            finputstream.read(content);
            finputstream.close();
            imgBase64 = new String(encodeBase64(content));
        } catch (IOException e) {
            e.printStackTrace();
            return "-1";
        }
        // 拼装请求body的json字符串
        JSONObject requestObj = new JSONObject();
        try {
            if(is_old_format) {
                JSONObject obj = new JSONObject();
                obj.put("image", getParam(50, imgBase64));
                if(config_str.length() > 0) {
                    obj.put("configure", getParam(50, config_str));
                }
                JSONArray inputArray = new JSONArray();
                inputArray.add(obj);
                requestObj.put("inputs", inputArray);
            }else{
                requestObj.put("image", imgBase64);
                if(config_str.length() > 0) {
                    requestObj.put("configure", config_str);
                }
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
        String bodys = requestObj.toString();

        try {
            /**
             * 重要提示如下:
             * HttpUtils请从
             * https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/src/main/java/com/aliyun/api/gateway/demo/util/HttpUtils.java
             * 下载
             *
             * 相应的依赖请参照
             * https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/pom.xml
             */
            HttpResponse response = HttpUtils.doPost(host, path, method, headers, querys, bodys);
            int stat = response.getStatusLine().getStatusCode();
            if(stat != 200){
                System.out.println("Http code: " + stat);
                System.out.println("http header error msg: "+ response.getFirstHeader("X-Ca-Error-Message"));
                System.out.println("Http body error msg:" + EntityUtils.toString(response.getEntity()));
                return "-1";
            }

            String res = EntityUtils.toString(response.getEntity());
            JSONObject res_obj = JSON.parseObject(res);
            if(is_old_format) {
                JSONArray outputArray = res_obj.getJSONArray("outputs");
                String output = outputArray.getJSONObject(0).getJSONObject("outputValue").getString("dataValue");
                JSONObject out = JSON.parseObject(output);
                System.out.println(out.toJSONString());
                return out.toJSONString();
            }else{
                System.out.println(res_obj.toJSONString());
                return res_obj.toJSONString();
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
		return "-1";
    }
    
    public static String verificateIdCard(String idNum,String name) {
    	  String host = "http://idcardpho.market.alicloudapi.com";
  	    String path = "/idcardinfo/photo";
  	    String method = "GET";
  	    String appcode = "dc7528c3072048b99d2a40c228217f2f";
  	    Map<String, String> headers = new HashMap<String, String>();
  	    //最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73fe94948385f570e3c139105
  	    headers.put("Authorization", "APPCODE " + appcode);
  	    Map<String, String> querys = new HashMap<String, String>();
  	    querys.put("idcard", idNum);
  	    querys.put("realname", name);

  	    try {
  	    	/**
  	    	* 重要提示如下:
  	    	* HttpUtils请从
  	    	* https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/src/main/java/com/aliyun/api/gateway/demo/util/HttpUtils.java
  	    	* 下载
  	    	*
  	    	* 相应的依赖请参照
  	    	* https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/pom.xml
  	    	*/
  	    	HttpResponse response = HttpUtils.doGet(host, path, method, headers, querys);
  	    	System.out.println(response.toString());
  	    	System.out.println(EntityUtils.toString(response.getEntity()));
  	    	return EntityUtils.toString(response.getEntity());
  	    	//获取response的body
  	    } catch (Exception e) {
  	    	e.printStackTrace();
  	    	return "-1";
  	    }
	}
    
    public static void main(String[] args) {
    	String data =verificateIdCard("500382199608073807","肖槟欣");
    	System.out.print(data);
	}
}