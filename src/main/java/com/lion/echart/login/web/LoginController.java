package com.lion.echart.login.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lion.echart.base.logic.BaseService;
import com.lion.echart.global.GlobalThings;
import com.lion.echart.utils.ImageUtils;

import net.sf.json.JSONObject;

/**
 * 登陆相关后台请求
 * @author lion-y
 *
 */
@Controller
public class LoginController {
	@Autowired
	private BaseService baseService;
	
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

		GlobalThings.putCash("costtypes", baseService.queryList("com.system.code.getCosttypes", null));
		GlobalThings.putCash("suboffices", baseService.queryList("comle.Suboffice.getSubofficeListData", null));
		GlobalThings.putCash("contracts", baseService.queryList("comle.contract.getcontractSignedListData", null));
		
		return "/page/main";
	}
	
	/**
	 * 获取缓存数据
	 * @param resp
	 * @param cashtype
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/getCashListData.json",method=RequestMethod.POST)
	public @ResponseBody List<Map<String, Object>> getCashListData(HttpServletResponse resp, String cashtype) throws IOException { 
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		Object obj = GlobalThings.getCash(cashtype);
		if(obj != null) {
			result = (List<Map<String, Object>>)obj;
		}
		return result;
	}
}