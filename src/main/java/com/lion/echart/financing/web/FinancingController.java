package com.lion.echart.financing.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
import com.lion.echart.financing.entity.FinancingRepairEntity;
import com.lion.echart.financing.entity.FinancingRepairView;
import com.lion.echart.financing.entity.FinancingWriteEntity;
import com.lion.echart.financing.entity.FinancingWritesView;
import com.lion.echart.system.entity.UserEntity;

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
			if(list!= null && list.getList()!=null) {
				for (int i = 0; i < list.getList().size(); i++) {
					if(list.getList().get(i).getPayfordateStr() == null ||
							list.getList().get(i).getPayfordateStr().isEmpty()) {
						list.getList().get(i).setPayfordate(new Date());
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
	
	//财务填报明细数据删除
	@RequestMapping(value = "/deleteFinancing.json",method=RequestMethod.POST)
	public @ResponseBody String deleteFinancing(FinancingWritesView list
			,HttpServletRequest req,HttpServletResponse resp, HttpSession session, FinancingWriteEntity entity) throws IOException { 
		JSONObject obj = new JSONObject();
		try {
			baseService.updateObject("comle.financing.financingWriteDelete", entity);
			obj.put("msgType", 1);
		} catch (Exception e) {
			e.printStackTrace();
			obj.put("msgType", 0);
		}
		return obj.toString();
	}
	

	//财务数据统计表 
	@RequestMapping(value = "/financingReport.web",method=RequestMethod.GET)
	public String financingReport(HttpServletRequest req,HttpServletResponse resp, 
			HttpSession session, String year, String costtype) throws IOException { 
		req.setAttribute("ts", System.currentTimeMillis());
		req.setAttribute("who", "write");
		return "/page/financing/financingReport";
	}

	//获取财务数据统计表列表数据
	@RequestMapping(value = "/getFinancingReportData.json",method=RequestMethod.POST)
	public @ResponseBody List<Map<String, Object>> getFinancingReportData(HttpServletRequest req,
			HttpServletResponse resp, HttpSession session,String month,
			String year1, String year2, String year3) throws IOException {
		List<Map<String, Object>> list = null;
		if(month != null && year1 != null && year2 != null && year3 != null && 
				!month.isEmpty() && !year1.isEmpty() && !year2.isEmpty() && !year3.isEmpty()) {
			HashMap<String, Object> param = new HashMap<String, Object>();
			//报告日
			param.put("year1", year1);
			param.put("year2", year2);
			param.put("year3", year3);
			param.put("month", month);
			
			list = baseService.queryList("comle.financing.getFinancingReportData", param);
		}else {
			list = new ArrayList<Map<String,Object>>();
		}
		
		return list;
	}

	//工程投资完成汇总财务补录页面跳转 
	@RequestMapping(value = "/financingRepair.web",method=RequestMethod.GET)
	public String financingRepair(HttpServletRequest req,HttpServletResponse resp, 
			HttpSession session, String year, String costtype) throws IOException { 
		req.setAttribute("ts", System.currentTimeMillis());
		req.setAttribute("who", "write");
		return "/page/financing/financingRepair";
	}

	//获取工程投资完成汇总补录数据
	@RequestMapping(value = "/getFinancingRepair.json",method=RequestMethod.POST)
	public @ResponseBody List<Map<String, Object>> getFinancingRepair(String belongTimeStr, String classes,HttpServletRequest req,
			HttpServletResponse resp, HttpSession session) throws IOException {
		List<Map<String, Object>> list = null;
		if(belongTimeStr!=null&&!belongTimeStr.equals("")){
			HashMap<String, Object> param = new HashMap<String, Object>();
			param.put("year", belongTimeStr.substring(0,4));
			param.put("month", belongTimeStr.substring(5,7));
			param.put("classes", classes);
			list = baseService.queryList("comle.financing.getFinancingRepairData", param);
			if(list.size()==0){
				list = baseService.queryList("comle.financing.getFinancingRepairData", null);
			}
		}
		return list;
	}
	
	//获取工程投资完成汇总补录数据
		@RequestMapping(value = "/getFinancingRepairSourceMoney.json",method=RequestMethod.POST)
		public @ResponseBody String getFinancingRepairSourceMoney(String belongTimeStr,HttpServletRequest req,
				HttpServletResponse resp, HttpSession session) throws IOException {
			JSONObject obj = new JSONObject();
			try {
				if(belongTimeStr!=null&&!belongTimeStr.equals("")){
					HashMap<String, Object> param = new HashMap<String, Object>();
					param.put("year", belongTimeStr.substring(0,4));
					param.put("month", belongTimeStr.substring(5,7));
					param.put("classes", "2");
					List<Map<String, Object>> list = baseService.queryList("comle.financing.getFinancingRepairSourceMoneyData", param);
					if(list.size()>0){
						obj.put("isCount", 1);
					}else{
						obj.put("isCount", 0);
					}
					for(Map<String, Object> map : list){
						String sourcemoney = (String) map.get("sourcemoney");
						String sourcemoneyArr [] = sourcemoney.split("##");
						obj.put("totalmoney", sourcemoneyArr[0]);
						obj.put("centralmoney", sourcemoneyArr[1]);
						obj.put("provincemoney", sourcemoneyArr[2]);
						obj.put("localmoney", sourcemoneyArr[3]);
						obj.put("bankmoney", sourcemoneyArr[4]);
						obj.put("sourceMoneyId", map.get("id"));
					}
					obj.put("msgType", 1);
				}
			} catch (Exception e) {
				e.printStackTrace();
				obj.put("msgType", 0);
			}
			return obj.toString();
		}
	
	//工程投资完成汇总补录数据保存
	@RequestMapping(value = "/insertFRepair.json",method=RequestMethod.POST)
	public @ResponseBody String insertFRepair(String belongTimeStr,String sourceMoneyId,String totalmoney,String centralmoney,String provincemoney,String localmoney,String bankmoney,FinancingRepairView list
			,HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		JSONObject obj = new JSONObject();
		UserEntity user = (UserEntity)session.getAttribute("USER_SESSION");
		try {
			SimpleDateFormat si_year = new SimpleDateFormat("yyyy");
			SimpleDateFormat si_month = new SimpleDateFormat("MM");
			int year = Integer.valueOf(si_year.format(new Date()));
			int month = Integer.valueOf(si_month.format(new Date()));
			if(belongTimeStr!=null&&!belongTimeStr.equals("")){
				year = Integer.valueOf(belongTimeStr.substring(0,4));
				month = Integer.valueOf(belongTimeStr.substring(5,7));
			}
			List<FinancingRepairEntity> temp =list.getList();
			for(FinancingRepairEntity en : temp){
				if(en.getCtype().equals("14")){
					//印花税
					en.setClasses("3");
				}else{
					en.setClasses("1");
				}
				en.setYear((long)year);
				en.setMonth((long)month);
				en.setOperuser(user.getId()+"");
				en.setOperdate(new Date());
			}
			FinancingRepairEntity  entity = new FinancingRepairEntity();
			entity.setId(Long.valueOf(sourceMoneyId));
			entity.setClasses("2");
			entity.setYear((long)year);
			entity.setMonth((long)month);
			entity.setOperuser(user.getId()+"");
			entity.setOperdate(new Date());
			entity.setSourcemoney(totalmoney+"##"+centralmoney+"##"+provincemoney+"##"+localmoney+"##"+bankmoney);
			temp.add(entity);
			baseService.insertOupdates("comle.financing.FRepair", temp);
			obj.put("msgType", 1);
		} catch (Exception e) {
			e.printStackTrace();
			obj.put("msgType", 0);
		}
		return obj.toString();
	}
	

	//工程投资完成汇总表页面跳转 
	@RequestMapping(value = "/financingReportTwo.web",method=RequestMethod.GET)
	public String financingReportTwo(HttpServletRequest req,HttpServletResponse resp, 
			HttpSession session, String year, String costtype) throws IOException { 
		req.setAttribute("ts", System.currentTimeMillis());
		req.setAttribute("who", "write");
		return "/page/financing/financingReportTwo";
	}
}