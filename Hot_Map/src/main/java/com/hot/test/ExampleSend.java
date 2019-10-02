package com.hot.test;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hot.service.MemberService;




@Controller
public class ExampleSend {
	@Autowired
	MemberService ms;
	
	@RequestMapping(value = "msgsend")
	@ResponseBody
	public int msgsend(@RequestParam("phone") int phone) {
		System.out.println("phone : " + phone);
		String ren = numberGen();
		System.out.println(" numStr : " + ren);
		return ms.phoneCheck(phone);
	}
	
    public static String numberGen() {
        
        Random rand = new Random();
        String numStr = ""; //난수가 저장될 변수
        
        for(int i=0;i<6;i++) {
            //0~9 까지 난수 생성
            String ran = Integer.toString(rand.nextInt(10));
            numStr += ran;
        }
        return numStr;
    }

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	
//	public static void main(String[] args) {
//    String api_key = "NCS7RDJ7RC3XAIBV";
//    String api_secret = "STJDPV3VSCNW7A2QK4DQOWH8GH6VQPCK";
//    Message coolsms = new Message(api_key, api_secret);
//
//    // 4 params(to, from, type, text) are mandatory. must be filled
//    HashMap<String, String> params = new HashMap<String, String>();
//    params.put("to", "01000000000");
//    params.put("from", "01090638511");
//    params.put("type", "SMS");
//    params.put("text", "Coolsms Testing Message!");
//    params.put("app_version", "test app 1.2"); // application name and version
//
//    try {
//      JSONObject obj = (JSONObject) coolsms.send(params);
//      System.out.println(obj.toString());
//      System.out.println("params : " + params);
//    } catch (CoolsmsException e) {
//      System.out.println(e.getMessage());
//      System.out.println(e.getCode());
//    }
//  }
}