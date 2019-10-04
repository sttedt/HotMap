package com.hot.controller;

import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hot.service.MemberService;




@Controller
public class sandController {
	@Autowired
	MemberService ms;
	
	@RequestMapping(value = "msgsend" ,method = RequestMethod.POST)
	@ResponseBody
	public int msgsend(@RequestParam("phone") String phone, Map<String, Object> map) {
		System.out.println("phone : " + phone);
		int code = numberGen();
		System.out.println(" numStr : " + code);
		map.put("phone" , phone);
		map.put("code", code);
		System.out.println("map  : " + map);
		
		
		return ms.phoneCheckNumber(map);
	}
	
    public static int numberGen() {
        
        Random rand = new Random();
        int numStr = 0; //난수가 저장될 변수
        
        for(int i=0;i<6;i++) {
            //0~9 까지 난수 생성
            int ran = rand.nextInt(10);
            numStr += ran;
        }
        return numStr;
    }	

	
	@RequestMapping(value = "msgCheck" , method = RequestMethod.POST)
	@ResponseBody
	public int msgCheck(@RequestParam("phone") int phone, @RequestParam("phoneCheckEnd") int check, Map<String , Object> map) {
		System.out.println("check : " + check);
		System.out.println( "phone : " + phone);
		map.put("phone" , phone);
		map.put("code" , check);
		
		return ms.phoneCheck(map);
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