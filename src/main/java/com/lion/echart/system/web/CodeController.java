package com.lion.echart.system.web;

import java.io.IOException;
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

@Controller
@RequestMapping("systemcode")
public class CodeController {
	@Autowired
	private BaseService baseService;

	//获取财务填报款项分类列表数据
	@RequestMapping(value = "/getCodeTypeList.json",method=RequestMethod.POST)
	public @ResponseBody List<Map<String, Object>> getfinancingListData(HttpServletRequest req,
			HttpServletResponse resp, HttpSession session,String codetype) throws IOException {
		List<Map<String, Object>> list = baseService.queryList("com.system.code.getCosttypes", null);
		return list;
	}
}
