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
	public @ResponseBody List<Map<String, Object>> subofficewriteGetData(HttpServletRequest req,HttpServletResponse resp, 
			HttpSession session, String subofficeid) throws IOException { 
		UserEntity user = (UserEntity)session.getAttribute("USER_SESSION");
		HashMap<String, Object> param = new HashMap<String, Object>();
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
	public void submitSubofficewrite(SubofficeWriteView list
			,HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
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
							//baseService.insertOupdates("comle.SubofficeWrite.submitSubofficewrite", list.getList());
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
}