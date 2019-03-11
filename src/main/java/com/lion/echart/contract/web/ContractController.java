package com.lion.echart.contract.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lion.echart.base.logic.BaseService;
import com.lion.echart.contract.entity.ContractEntity;
import com.lion.echart.contract.logic.ContractService;
import com.lion.echart.project.entity.PayforEntity;

/**
 * 合同管理相关跳转控制
 * @author TANGXIAN
 *
 */
@Controller
public class ContractController {

	protected ContractService contractService;
	//合同管理列表页 
	@RequestMapping(value = "/contract/contractList.web",method=RequestMethod.GET)
	public String payforList(HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		req.setAttribute("ts", System.currentTimeMillis());
		req.setAttribute("who", "contract");
		return "/page/contract/contractList";
	}
	
	//获取合同列表数据
	@RequestMapping(value = "/contract/contractListGetData.json",method=RequestMethod.GET)
	public @ResponseBody List<ContractEntity> contractListGetData(HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		List<ContractEntity> results = contractService.queryList("comle.contract.getdata", null);
		return results;
	}
}