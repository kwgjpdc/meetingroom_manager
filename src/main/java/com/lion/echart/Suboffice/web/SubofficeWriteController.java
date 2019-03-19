package com.lion.echart.Suboffice.web;

import java.io.IOException;
import java.util.ArrayList;
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

import com.lion.echart.Suboffice.entity.SubofficeWriteEntity;
import com.lion.echart.Suboffice.entity.SubofficeWriteView;
import com.lion.echart.base.logic.BaseService;
import com.lion.echart.financing.entity.FinancingWritesView;
import com.lion.echart.project.entity.MonthTotalEntity;
import com.lion.echart.project.entity.PayforEntity;
import com.lion.echart.system.entity.UserEntity;

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
	public @ResponseBody List<Map<String, Object>> subofficewriteGetData(String belongTimeStr,HttpServletRequest req,HttpServletResponse resp, 
			HttpSession session, String subofficeid) throws IOException { 
		UserEntity user = (UserEntity)session.getAttribute("USER_SESSION");
		HashMap<String, Object> param = new HashMap<String, Object>();
		List<Integer> ststusList = new ArrayList<Integer>();
		ststusList.add(1);
		ststusList.add(4);
		param.put("status", ststusList);
		if(belongTimeStr!=null&&!belongTimeStr.equals("")){
			param.put("year", belongTimeStr.substring(0,4));
			param.put("month", belongTimeStr.substring(5,7));
		}
		//系统管理员传入特殊分局条件0
		if("admin".equals(user.getUsername())) {
			param.put("subofficeid", 0);
		}else {
			param.put("subofficeid", user.getSubofficeid());
		}
		List<Map<String, Object>> list = baseService.queryList("comle.SubofficeWrite.getSubofficewriteListData", param);
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
				if(s.getId()!= null&&s.getId()!=0){
					//修改
				}else{
					//现在默认状态已填报
					s.setStatus(1);
				}
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
	
	//分局填报提交
	@RequestMapping(value = "subofficewrite/submitSubofficewrite.json",method=RequestMethod.POST)
	public void submitSubofficewrite(String belongTimeStr, String checkIds,SubofficeWriteView list
			,HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException {
		UserEntity user = (UserEntity)session.getAttribute("USER_SESSION");
		JSONObject obj = new JSONObject();
		try {
			ArrayList<Long> ids = new ArrayList<Long>();
			if(list != null && list.getList() != null) {
				for (int i = 0; i < list.getList().size(); i++) {
					if(list.getList().get(i).getId() != null)
					ids.add(list.getList().get(i).getId());
				}
				
				if(ids.isEmpty()) {
					obj.put("msgType", 0);
					obj.put("message", "请先保存数据");
				}else {
					HashMap<String, Object> param = new HashMap<String, Object>();
					param.put("ids", ids);
					List<Map<String, Object>> checkresults = 
							baseService.queryList("comle.SubofficeWrite.subofficewritecheck", param);
					
					boolean hasError = false;
					if(checkresults != null && !checkresults.isEmpty()) {
						StringBuffer sb = new StringBuffer();
						for (int i = 0; i < checkresults.size(); i++) {
							
							if(!checkresults.get(i).get("yearrealityinvest").equals(checkresults.get(i).get("fornowsumyear"))
									|| !checkresults.get(i).get("finishinvest").equals(checkresults.get(i).get("fornowall"))) {
								sb.append("<br/>合同："+checkresults.get(i).get("contractname"));
								if(!checkresults.get(i).get("yearrealityinvest").equals(checkresults.get(i).get("fornowsumyear"))){
									sb.append("[今年累计完成："+checkresults.get(i).get("yearrealityinvest")+"]与实际数据["+
											checkresults.get(i).get("fornowsumyear")+"]不符，请重新填写");
								}
								if(!checkresults.get(i).get("finishinvest").equals(checkresults.get(i).get("fornowall"))) {
									sb.append(";[合同累计完成："+checkresults.get(i).get("finishinvest")+"]与实际数据["+
											checkresults.get(i).get("fornowall")+"]不符，请重新填写");
								}
								hasError = true;	
							}

						}
						
						if(hasError) {
							obj.put("msgType", 0);
							obj.put("message", sb.toString());
						}else {
							//TODO 请完善提交逻辑
							HashMap<String, Object> paramUpdate = new HashMap<String, Object>();
							paramUpdate.put("status", 2);//审核中
							if(belongTimeStr!=null&&!belongTimeStr.equals("")){
								paramUpdate.put("year", belongTimeStr.substring(0,4));
								paramUpdate.put("month", belongTimeStr.substring(5,7));
							}
							//系统管理员传入特殊分局条件0
							if("admin".equals(user.getUsername())) {
								paramUpdate.put("subofficeid", 0);
							}else {
								paramUpdate.put("subofficeid", user.getSubofficeid());
							}
							baseService.updateObject("comle.SubofficeWrite.subofficewriteStatusUpdate", paramUpdate);
							obj.put("msgType", 1);
						}
					}else {
						obj.put("msgType", 0);
						obj.put("message", "数据校验发生异常，请联维护人员");
					}
				}
			}else {
				obj.put("msgType", 0);
				obj.put("message", "没有数据");
			}
		} catch (Exception e) {
			e.printStackTrace();
			obj.put("msgType", 0);
		}
		resp.setContentType("text/html;charset=UTF-8");
		resp.getWriter().print(obj.toString());
		//return obj.toString();
	}
	
	//分局填报审批列表页 
	@RequestMapping(value = "/subofficewrite/subofficewriteApproveList.web",method=RequestMethod.GET)
	public String subofficewriteApproveList(HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		req.setAttribute("ts", System.currentTimeMillis());
		req.setAttribute("who", "contract");
		return "/page/suboffice/subofficewriteApproveList";
	}
	//获取分局填报列表数据
	@RequestMapping(value = "/subofficewrite/subofficewriteApproveGetData.json",method=RequestMethod.POST)
	public @ResponseBody List<Map<String, Object>> subofficewriteApproveGetData(HttpServletRequest req,HttpServletResponse resp, 
			HttpSession session, String subofficeid) throws IOException { 
		UserEntity user = (UserEntity)session.getAttribute("USER_SESSION");
		HashMap<String, Object> param = new HashMap<String, Object>();
		List<Integer> ststusList = new ArrayList<Integer>();
		ststusList.add(2);
		param.put("status", ststusList);
		param.put("subofficeid", 0);
		List<Map<String, Object>> list = baseService.queryList("comle.SubofficeWrite.getSubofficewriteListData", param);
		return list;
	}
	//分局填报审批通过or驳回
	@RequestMapping(value = "subofficewrite/submitSubofficewriteApprove.json",method=RequestMethod.POST)
	public void submitSubofficewriteApprove(String checkIds,String flag
			,HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		JSONObject obj = new JSONObject();
		try {
			HashMap<String, Object> paramUpdate = new HashMap<String, Object>();
			paramUpdate.put("status", Integer.valueOf(flag));
			List<Integer> subofficewriteList = new ArrayList<Integer>();
			for(String s : checkIds.split(",")){
				subofficewriteList.add(Integer.valueOf(s));
			}
			paramUpdate.put("subofficewriteList", subofficewriteList);
			paramUpdate.put("subofficeid", 0);
			baseService.updateObject("comle.SubofficeWrite.subofficewriteStatusUpdate", paramUpdate);
			obj.put("msgType", 1);
		} catch (Exception e) {
			e.printStackTrace();
			obj.put("msgType", 0);
		}
		resp.setContentType("text/html;charset=UTF-8");
		resp.getWriter().print(obj.toString());
		//return obj.toString();
	}
	//分局填报提交历史数据列表页 
	@RequestMapping(value = "/subofficewrite/subofficewriteSubmitHisList.web",method=RequestMethod.GET)
	public String subofficewriteSubmitHisList(HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		req.setAttribute("ts", System.currentTimeMillis());
		req.setAttribute("who", "contract");
		return "/page/suboffice/subofficewriteSubmitHisList";
	}
	//获取分局填报提交历史记录列表数据
	@RequestMapping(value = "/subofficewrite/subofficewriteSubmitHisGetData.json",method=RequestMethod.POST)
	public @ResponseBody List<Map<String, Object>> subofficewriteSubmitHisGetData(HttpServletRequest req,HttpServletResponse resp, 
			HttpSession session, String subofficeid) throws IOException { 
		UserEntity user = (UserEntity)session.getAttribute("USER_SESSION");
		HashMap<String, Object> param = new HashMap<String, Object>();
		List<Integer> ststusList = new ArrayList<Integer>();
		ststusList.add(2);
		ststusList.add(3);
		ststusList.add(4);
		param.put("status", ststusList);
		//系统管理员传入特殊分局条件0
		if("admin".equals(user.getUsername())) {
			param.put("subofficeid", 0);
		}else {
			param.put("subofficeid", user.getSubofficeid());
		}
		List<Map<String, Object>> list = baseService.queryList("comle.SubofficeWrite.getSubofficewriteListData", param);
		return list;
	}
}