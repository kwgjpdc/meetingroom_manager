package com.lion.echart.Suboffice.web;

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
 * 分局填报相关跳转控制
 * @author TANGXIAN
 *
 */
@Controller
public class SubofficeWriteController {
	@Autowired
	private BaseService baseService;
	//分局填报列表页 
	@RequestMapping(value = "/subofficewrite/subofficewriteList.web",method=RequestMethod.GET)
	public String subofficewriteList(HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		req.setAttribute("ts", System.currentTimeMillis());
		req.setAttribute("who", "contract");
		return "/page/suboffice/subofficeWriteList";
	}
	
	//获取分局填报列表数据
	@RequestMapping(value = "/subofficewrite/subofficewriteGetData.json",method=RequestMethod.POST)
	public @ResponseBody List<Map<String, Object>> subofficewriteGetData(HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		List<Map<String, Object>> list = baseService.queryList("comle.Suboffice.getSubofficewriteListData", null);
		return list;
	}
}