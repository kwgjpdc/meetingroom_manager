package com.lion.echart.system.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lion.echart.base.logic.BaseService;
import com.lion.echart.system.entity.SelectOption;

import net.sf.json.JSONObject;

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
			String exportType,String qparam,String fileName){
		boolean goon = true;
		String errorMsg = "";
		
		model.addAttribute("fileName", fileName);
		
		HashMap param = new HashMap();
		param.put("exportType", exportType);
		List<SelectOption> optionpts = baseService.queryList("getTitle", param);
		
		if(optionpts == null || optionpts.isEmpty()) {
			goon = false;
			errorMsg = "没有设置对应的表头格式";
		}

		String ibitisSql = "";
		if(goon) {
			Object temp = baseService.queryObject("getSqlid", param);
			if(temp != null) {
				ibitisSql = temp.toString();
			}else {
				errorMsg = "没有设置对应的数据交本";
				goon = false;
			}
		}
		
		if(goon && qparam != null && !qparam.isEmpty()){
			JSONObject paramjson = JSONObject.fromObject(qparam);
			if(paramjson != null && !paramjson.isEmpty()){
				Iterator iterator = paramjson.keys();
				String key = null;
				param = new HashMap();
				while(iterator.hasNext()){
					key = iterator.next().toString();
					param.put(key, paramjson.get(key));
				}
			}
		}
		
		if(goon) {
			List listData = baseService.queryList(ibitisSql, param);
			int listcount = 0;
			if(listData != null && listData.size() > 0) {
				listcount = listData.size();
			}else{
				errorMsg = "没有查询到对应结果";
			}
			
			model.addAttribute("columns", optionpts);
			model.addAttribute("listData", listData);
			model.addAttribute("listcount", listcount); 
		}
		
		try {
			response.setContentType("application/octet-stream");
			fileName=new String(fileName.getBytes("utf-8"),"iso-8859-1");
			response.addHeader("Content-Disposition", "attachment; filename="+fileName);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "/business/projectInitial/proExcelXlsFun";
	}
}