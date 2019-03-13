package com.lion.echart.contract.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import com.lion.echart.contract.entity.ContractEntity;
import com.lion.echart.contract.logic.ContractService;
import com.lion.echart.project.entity.PayforEntity;

import net.sf.json.JSONObject;

/**
 * 合同管理相关跳转控制
 * @author TANGXIAN
 *
 */
@Controller
public class ContractController {
	@Autowired
	private BaseService baseService;
	
	protected ContractService contractService;
	//合同签订管理列表页 
	@RequestMapping(value = "/contract/contractSignedList.web",method=RequestMethod.GET)
	public String contractSignedList(HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		req.setAttribute("ts", System.currentTimeMillis());
		req.setAttribute("who", "contract");
		return "/page/contract/contractSignedList";
	}
	
	//获取合同签订列表数据
	@RequestMapping(value = "/contract/contractSignedListGetData.json",method=RequestMethod.POST)
	public @ResponseBody List<Map<String, Object>> contractSignedListGetData(HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		List<Map<String, Object>> list = baseService.queryList("comle.contract.getcontractSignedListData", null);
		return list;
	}
	
	//合同签订添加页 
	@RequestMapping(value = "/contract/contractSignedAdd.web",method=RequestMethod.GET)
	public String contractSignedAdd(HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		req.setAttribute("ts", System.currentTimeMillis());
		req.setAttribute("who", "contract");
		return "/page/contract/contractSignedAdd";
	}
	
	//合同签订保存
	@RequestMapping(value = "/contract/contractSignedSave.json",method=RequestMethod.POST)
	public @ResponseBody String contractSignedSave(String contractName,String contractNum,Double amount,String durationTime,String signTime,String contractPartyB,String remark,Integer subofficeId,HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		SimpleDateFormat si = new SimpleDateFormat("yyyy-MM-dd");
		JSONObject obj = new JSONObject();
		try {
			ContractEntity contract = new ContractEntity(contractName, contractNum, amount, durationTime, si.parse(signTime), contractPartyB, remark, 0, 9, "false", "admin", new Date(), subofficeId);
			baseService.insertObject("comle.contract.insertContractSigned", contract);
			obj.put("flag", 1);
		} catch (Exception e) {
			e.printStackTrace();
			obj.put("flag", 0);
		}
		return obj.toString();
	}
	
	//合同执行管理列表页 
	@RequestMapping(value = "/contract/contractExecuteList.web",method=RequestMethod.GET)
	public String contractExecuteList(HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		req.setAttribute("ts", System.currentTimeMillis());
		req.setAttribute("who", "contract");
		return "/page/contract/contractExecuteList";
	}
	
	//获取合同执行列表数据
	@RequestMapping(value = "/contract/contractExecuteListGetData.json",method=RequestMethod.POST)
	public @ResponseBody List<Map<String, Object>> contractExecuteListGetData(HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		List<Map<String, Object>> list = baseService.queryList("comle.contract.getcontractExecuteListData", null);
		return list;
	}
}