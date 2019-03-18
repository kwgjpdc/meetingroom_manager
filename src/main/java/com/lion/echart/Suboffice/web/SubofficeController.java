package com.lion.echart.Suboffice.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
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
import com.lion.echart.global.GlobalThings;
import com.lion.echart.project.entity.MonthTotalEntity;
import com.lion.echart.project.entity.PayforEntity;
import com.lion.echart.system.entity.UserEntity;

/**
 * 分局信息相关跳转控制
 * @author TANGXIAN
 *
 */
@Controller
public class SubofficeController {
	@Autowired
	private BaseService baseService;
	//分局信息列表页 
	@RequestMapping(value = "/suboffice/subofficeList.web",method=RequestMethod.GET)
	public String subofficeList(HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		req.setAttribute("ts", System.currentTimeMillis());
		req.setAttribute("who", "contract");
		return "/page/suboffice/subofficeWriteList";
	}
	
	//获取分局列表数据
	@RequestMapping(value = "/suboffice/subofficeGetData.json",method=RequestMethod.POST)
	public @ResponseBody List<Map<String, Object>> subofficewriteGetData(HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		List<Map<String, Object>> list = (List<Map<String, Object>>)GlobalThings.getCash("suboffices");
		return list;
	}
	
	//获取登录用户的分局列表数据
	@RequestMapping(value = "/suboffice/mysubofficeGetData.json",method=RequestMethod.POST)
	public @ResponseBody List<Map<String, Object>> mysubofficeGetData(HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		UserEntity user = (UserEntity)session.getAttribute("USER_SESSION");

		List<Map<String, Object>> restuleList = null;
		List<Map<String, Object>> templist = (List<Map<String, Object>>)GlobalThings.getCash("suboffices");
		
		for (int i = templist.size()-1; i >= 0; i--) {
			if(user.getUsername().equals("admin")) {
				restuleList = (List<Map<String, Object>>)GlobalThings.getCash("suboffices");
			}else if(user.getSubofficeid() == null)  {
				break;
			}else if(Integer.parseInt(templist.get(i).get("subofficeid").toString()) == user.getSubofficeid()) {
				restuleList = new ArrayList<Map<String,Object>>();
				restuleList.add(templist.get(i));
				break;
			}
		}
		return restuleList;
	}
}