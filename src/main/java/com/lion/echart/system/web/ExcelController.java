package com.lion.echart.system.web;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lion.echart.base.logic.BaseService;

@Controller
public class ExcelController {
	
	@Autowired
	private BaseService baseService;

	/**
	 * 跳转至，导出字段动态拼接方法的页面
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/excel/toExcelXlsExecute.web",method=RequestMethod.POST)
	public String proExcelXlsExecute(HttpServletRequest request,HttpServletResponse response,Model model,
			String dcdytype,String qparam){
		boolean goon = true;
		String message = "";
		model.addAttribute("msgType", 1); 

		Enumeration paramkey = request.getParameterNames();
		HashMap<String, Object> param = new HashMap<String, Object>();
		HashMap<String, Object> titlemap = new HashMap<String, Object>();
		
		String keyname = "";
		while(paramkey.hasMoreElements()) {
			keyname = paramkey.nextElement().toString();
			param.put(keyname, request.getParameter(keyname));
			titlemap.put(keyname, URLDecoder.decode(request.getParameter(keyname)));
		}
		String filename =  titlemap.get("filename").toString();
		model.addAttribute("filename", filename);
		param.put("istitleortail",1);
		List<HashMap<String,Object>> titles = baseService.queryList("com.system.eap.getTitle", param);
		if(titles == null || titles.isEmpty()) {
			goon = false;
			message = "没有设置对应的表头格式";
		}
		
		param.put("istitleortail",2);
		List<HashMap<String,Object>> tails = baseService.queryList("com.system.eap.getTitle", param);
		model.addAttribute("tails", tails);
		
		List<HashMap<String,Object>> propertys = baseService.queryList("com.system.eap.getSqlproerty", param);
		if(propertys == null || propertys.isEmpty()) {
			goon = false;
			message = "没有设置对应的取值属性";
		}
		
		List<HashMap<String,Object>> ibitisSqls = baseService.queryList("com.system.eap.getSqlid", param);
		String ibitisSql = "";
		String ibitisTitleSql = "";
		if(ibitisSqls == null || ibitisSqls.isEmpty()) {
			goon = false;
			message = "没有设置对应的取值逻辑";
		}else {
			for (int i = 0; i < ibitisSqls.size(); i++) {
				if(ibitisSqls.get(i).get("sqlid") != null) {
					if("1".equals(ibitisSqls.get(i).get("sqltype"))){
						ibitisSql = ibitisSqls.get(i).get("sqlid").toString();
					}else {
						ibitisTitleSql = ibitisSqls.get(i).get("sqlid").toString();
					}
				}
			}
		}
		
		if(goon) {
			List listData = baseService.queryList(ibitisSql, param);
			int listcount = 0;
			if(listData != null && listData.size() > 0) {
				listcount = listData.size();
			}else{
				message = "没有查询到对应结果";
				goon = false;
			}

			model.addAttribute("propertys", propertys);
			model.addAttribute("titles", titles);
			model.addAttribute("listData", listData);
			model.addAttribute("listcount", listcount); 
		}
		model.addAttribute("titlemap", titlemap);
		
		try {
			if(!goon) {
				model.addAttribute("msgType", 0); 
			}
			model.addAttribute("message", message); 
			
			response.setContentType("application/octet-stream");
			filename=new String(filename.getBytes("utf-8"),"iso-8859-1");
			response.addHeader("Content-Disposition", "attachment; filename="+filename+".xls");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "/page/base/excelBase";
	}
}