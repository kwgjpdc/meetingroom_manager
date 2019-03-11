package com.lion.echart.login.web;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lion.echart.utils.ImageUtils;

import net.sf.json.JSONObject;

@Controller
public class LoginController {
	
	//获取验证码 
	@RequestMapping(value = "/drawcheckcode.json",method=RequestMethod.POST)
	public void drawCheckCode(HttpServletResponse resp, HttpSession session) throws IOException { 
		//resp.setContentType("image/jpg"); 
		//int width = 70; int height = 25; 
		//OutputStream os = resp.getOutputStream();
		//int verifySize = 4;
		//ImageUtils.outputVerifyImage(width, height, os, verifySize);
		String ckcode = ImageUtils.generateVerifyCode(4);
		resp.getOutputStream().write(ckcode.getBytes());
	}

	//登陆验证 
	@RequestMapping(value = "/login.json",method=RequestMethod.GET)
	public String login(HttpServletResponse resp, HttpSession session) throws IOException { 
		JSONObject jsonObject = new JSONObject();
		jsonObject.accumulate("msgType", 0);
		return "/page/main";
	}
	
}