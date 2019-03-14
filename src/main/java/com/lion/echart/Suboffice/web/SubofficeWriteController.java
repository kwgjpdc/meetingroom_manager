package com.lion.echart.Suboffice.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
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
import com.lion.echart.Suboffice.entity.SubofficeWriteView;
import com.lion.echart.base.logic.BaseService;
import com.lion.echart.financing.entity.FinancingWritesView;
import com.lion.echart.project.entity.MonthTotalEntity;
import com.lion.echart.project.entity.PayforEntity;

import net.sf.json.JSONObject;

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
		List<Map<String, Object>> list = baseService.queryList("comle.SubofficeWrite.getSubofficewriteListData", null);
		return list;
	}
	
	//分局填报保存
	@RequestMapping(value = "subofficewrite/insertSubofficewrite.json",method=RequestMethod.POST)
	public @ResponseBody String insertSubofficewrite(SubofficeWriteView list
			,HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		JSONObject obj = new JSONObject();
		try {
			for(SubofficeWriteEntity s :list.getList()){
				s.setYear("2019");
				s.setMonth("2");
				s.setPriority(0);
				s.setIsdisabled("false");
				s.setOperuser("admin");
				s.setOperdate(new Date());
			}
			baseService.insertOupdates("comle.SubofficeWrite.subofficewrite", list.getList());
			obj.put("msgType", 1);
		} catch (Exception e) {
			e.printStackTrace();
			obj.put("msgType", 0);
		}
		return obj.toString();
	}
}