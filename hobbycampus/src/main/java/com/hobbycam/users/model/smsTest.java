package com.hobbycam.users.model;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.jsp.tagext.TryCatchFinally;

import com.fasterxml.jackson.databind.util.JSONPObject;


public class smsTest {
	
	public String makeSignature(String url, String timestamp, String method, String accessKey, String secretKey
			)throws NoSuchAlgorithmException, InvalidKeyException{
	
		String space = " ";					// one space
		String newLine = "\n";					// new line

		String message = new StringBuilder()
			.append(method)
			.append(space)
			.append(url)
			.append(newLine)
			.append(timestamp)
			.append(newLine)
			.append(accessKey)
			.toString();

	
		String encodeBase64String;
		try {
			SecretKeySpec signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
			Mac mac = Mac.getInstance("HmacSHA256");
			mac.init(signingKey);

			byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
			encodeBase64String = Base64.getEncoder().encodeToString(rawHmac);
		
		} catch (Exception e) {
			encodeBase64String = e.toString();
		}
		
	  return encodeBase64String;
	}
	/*
	 * https://api.ncloud-docs.com/docs/ko/ai-application-service-sens-smsv2
		{
		    "type":"(SMS | LMS | MMS)",
		    "contentType":"(COMM | AD)",
		    "countryCode":"string",
		    "from":"string",
		    "subject":"string",
		    "content":"string",
		    "messages":[
		        {
		            "to":"string",
		            "subject":"string",
		            "content":"string"
		        }
		    ],
		    "files":[
		        {
		            "name":"string",
		            "body":"string"
		        }
		    ],
		    "reserveTime": "yyyy-MM-dd HH:mm",
		    "reserveTimeZone": "string",
		    "scheduleCode": "string"
		}
	 */

	
private void SendSMS() {
	String hostNameUrl="https://sens.apigw.ntruss.com";	
	String method = "POST";					// method
	String serviceId="ncp:sms:kr:285614481946:hobbycampus";
	String requestUrl="/sms/v2/services/";
	String requestUrlType= "/messages";	// url (include query string)

	requestUrl +=serviceId+requestUrlType;
	String apiUrl=hostNameUrl + requestUrl;
	
	String timestamp = Long.toString(System.currentTimeMillis());			// current timestamp (epoch)
	String accessKey = "7N38tMYUbZjV6V7OSjcE";			// access key id (from portal or Sub Account)
	String secretKey = "Xyph9DwJtEAYTD7WQXTW4871MUw2iPPRWj4pREjL";

	
	
	JSONObject bodyJson = new JSONObject();
	JSONObject toJson = new JSONObject();
    JSONArray  toArr = new JSONArray();

    toJson.put("to","01012345678");						// Mandatory(필수), messages.to	수신번호, -를 제외한 숫자만 입력 가능
    toArr.put(toJson);
    
    bodyJson.put("type","SMS");							// Madantory, 메시지 Type (SMS | LMS | MMS), (소문자 가능)
    bodyJson.put("from","01012345678");					// Mandatory, 발신번호, 사전 등록된 발신번호만 사용 가능		
    bodyJson.put("content","sms test in spring 222");	// Mandatory(필수), 기본 메시지 내용, SMS: 최대 80byte, LMS, MMS: 최대 2000byte
    bodyJson.put("messages", toArr);					// Mandatory(필수), 아래 항목들 참조 (messages.XXX), 최대 1,000개
    
    String body = bodyJson.toString();
    
    System.out.println(body);
    
    try {
        URL url = new URL(apiUrl);

        HttpURLConnection con = (HttpURLConnection)url.openConnection();
        con.setUseCaches(false);
        con.setDoOutput(true);
        con.setDoInput(true);
        con.setRequestProperty("content-type", "application/json");
        con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
        con.setRequestProperty("x-ncp-iam-access-key", accessKey);
        con.setRequestProperty("x-ncp-apigw-signature-v2", makeSignature(requestUrl, timestamp, method, accessKey, secretKey));
        con.setRequestMethod(method);
        con.setDoOutput(true);
        DataOutputStream wr = new DataOutputStream(con.getOutputStream());
        
        wr.write(body.getBytes());
        wr.flush();
        wr.close();

        int responseCode = con.getResponseCode();
        BufferedReader br;
        System.out.println("responseCode" +" " + responseCode);
        if(responseCode == 202) { // 정상 호출
            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
        } else { // 에러 발생
            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
        }

        String inputLine;
        StringBuffer response = new StringBuffer();
        while ((inputLine = br.readLine()) != null) {
            response.append(inputLine);
        }
        br.close();
        
        System.out.println(response.toString());

    } catch (Exception e) {
        System.out.println(e);
    }
	
	}
	
	
	
}