package com.lion.echart.financing.web;

import java.io.IOException;
import java.util.Calendar;
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

import com.lion.echart.base.logic.BaseService;
import com.lion.echart.financing.entity.FinancingWritesView;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("financing")
public class FinancingController {
	@Autowired
	private BaseService baseService;
	
	//财务填报款项分类列表页 
	@RequestMapping(value = "/financingList.web",method=RequestMethod.GET)
	public String contractList(HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		req.setAttribute("ts", System.currentTimeMillis());
		req.setAttribute("who", "write");
		req.setAttribute("year", Calendar.getInstance().get(Calendar.YEAR));
		return "/page/financing/financingList";
	}
	
	//财务填报明细列表页 
	@RequestMapping(value = "/financingListDetail.web",method=RequestMethod.GET)
	public String financingListDetail(HttpServletRequest req,HttpServletResponse resp, 
			HttpSession session, String year, String costtype) throws IOException { 
		req.setAttribute("ts", System.currentTimeMillis());
		req.setAttribute("who", "write");
		req.setAttribute("year", year);
		req.setAttribute("costtype", costtype);
		return "/page/financing/financingListDetail";
	}
	
	//获取财务填报款项分类列表数据
	@RequestMapping(value = "/getfinancingListData.json",method=RequestMethod.POST)
	public @ResponseBody List<Map<String, Object>> getfinancingListData(HttpServletRequest req,
			HttpServletResponse resp, HttpSession session,String writeyear) throws IOException {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("writeyear", writeyear);
		List<Map<String, Object>> list = baseService.queryList("comle.financing.getfinancingListData", param);
		return list;
	}
	
	//获取财务填报明细列表数据
	@RequestMapping(value = "/getflistDetailData.json",method=RequestMethod.POST)
	public @ResponseBody List<Map<String, Object>> getflistDetailData(HttpServletRequest req,
			HttpServletResponse resp, HttpSession session,String year, String costtype) throws IOException {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("year", year);
		param.put("costtype", costtype);
		List<Map<String, Object>> list = baseService.queryList("comle.financing.getflistDetailData", param);
		return list;
	}
	
	
	//财务填报保存
	@RequestMapping(value = "/insertFinancing.json",method=RequestMethod.POST)
	public @ResponseBody String insertFinancing(FinancingWritesView list
			,HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		JSONObject obj = new JSONObject();
		try {
			if(list != null && list.getList() != null) {
				for (int i = list.getList().size() - 1; i > 0; i--) {
					if(list.getList().get(i).getMoney() == null) {
						list.getList().remove(i);
					}
				}
			}
			baseService.insertOupdates("comle.financing.financingWrite", list.getList());
			obj.put("msgType", 1);
		} catch (Exception e) {
			e.printStackTrace();
			obj.put("msgType", 0);
		}
		return obj.toString();
	}
}