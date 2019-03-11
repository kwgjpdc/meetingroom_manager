package com.lion.echart.Suboffice.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lion.echart.contract.entity.ContractEntity;
import com.lion.echart.project.entity.PayforEntity;

/**
 * 分局填报相关跳转控制
 * @author TANGXIAN
 *
 */
@Controller
public class SubofficeWriteController {

	//分局填报管理列表页 
	@RequestMapping(value = "/subofficewrite/subofficewriteList.web",method=RequestMethod.GET)
	public String payforList(HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		req.setAttribute("ts", System.currentTimeMillis());
		req.setAttribute("who", "contract");
		return "/page/contract/contractList";
	}
	
	//获取分局填报列表数据
	@RequestMapping(value = "/subofficewrite/subofficewriteGetData.json",method=RequestMethod.POST)
	public @ResponseBody List<ContractEntity> contractGetData(HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		//TODO 为测试数据，请改为数据库获取
		List<ContractEntity> results = new ArrayList<ContractEntity>();
		//results.add(new PayforEntity("其他技术服务合同款","104.62","914.18","15.50","15.50","","1,034.30"));
		//results.add(new PayforEntity("建设管理费","58.92","1,034.05","94.13","94.13","","1,187.11"));
		//results.add(new PayforEntity("临时用地复垦保证金","","403","","","","403.39"));
		
		return results;
	}
}