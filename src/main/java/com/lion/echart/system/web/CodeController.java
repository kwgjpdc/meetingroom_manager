package com.lion.echart.system.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lion.echart.base.logic.BaseService;

@Controller
@RequestMapping("systemcode")
public class CodeController {
	@Autowired
	private BaseService baseService;

	
}
