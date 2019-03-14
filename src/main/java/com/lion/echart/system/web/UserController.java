package com.lion.echart.system.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lion.echart.Suboffice.entity.SubofficeWriteEntity;
import com.lion.echart.base.logic.BaseService;
import com.lion.echart.project.entity.MonthTotalEntity;
import com.lion.echart.project.entity.PayforEntity;

/**
 * 用户信息相关跳转控制
 * @author TANGXIAN
 *
 */
@Controller
public class UserController {
	@Autowired
	private BaseService baseService;
	//用户信息列表页 
	@RequestMapping(value = "/user/userList.web",method=RequestMethod.GET)
	public String userList(HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		req.setAttribute("ts", System.currentTimeMillis());
		req.setAttribute("who", "contract");
		return "/page/system/userList";
	}
	
	//用户信息列表数据
	@RequestMapping(value = "/user/userGetData.json",method=RequestMethod.POST)
	public @ResponseBody List<Map<String, Object>> userGetData(HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		List<Map<String, Object>> list = baseService.queryList("comle.user.getUserListData", null);
		return list;
	}
}