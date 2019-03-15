package com.lion.echart.system.web;

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

import com.lion.echart.Suboffice.entity.SubofficeWriteEntity;
import com.lion.echart.base.logic.BaseService;
import com.lion.echart.project.entity.MonthTotalEntity;
import com.lion.echart.project.entity.PayforEntity;
import com.lion.echart.system.entity.RoleEntity;
import com.lion.echart.system.entity.UserEntity;

import net.sf.json.JSONObject;

/**
 * 角色信息相关跳转控制
 * @author TANGXIAN
 *
 */
@Controller
public class RoleController {
	@Autowired
	private BaseService baseService;
	//角色信息列表页 
	@RequestMapping(value = "/role/roleList.web",method=RequestMethod.GET)
	public String roleList(HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		req.setAttribute("ts", System.currentTimeMillis());
		req.setAttribute("who", "contract");
		return "/page/system/roleList";
	}
	
	//角色信息列表数据
	@RequestMapping(value = "/role/roleGetData.json",method=RequestMethod.POST)
	public @ResponseBody List<Map<String, Object>> roleGetData(HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		List<Map<String, Object>> list = baseService.queryList("comle.role.getRoleListData", null);
		return list;
	}
	
	//角色信息添加列表页 
	@RequestMapping(value = "/role/roleAdd.web",method=RequestMethod.GET)
	public String roleAdd(HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		req.setAttribute("ts", System.currentTimeMillis());
		req.setAttribute("who", "contract");
		return "/page/system/roleAdd";
	}
	
	//角色添加保存
	@RequestMapping(value = "/role/roleSave.json",method=RequestMethod.POST)
	public @ResponseBody String roleSave(String rolename,HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		SimpleDateFormat si = new SimpleDateFormat("yyyy-MM-dd");
		JSONObject obj = new JSONObject();
		try {
			RoleEntity role = new RoleEntity(rolename, new Date(), "", 0, 1, "0", "1", new Date());
			baseService.insertObject("comle.role.insertRole", role);
			obj.put("msgType", 1);
		} catch (Exception e) {
			e.printStackTrace();
			obj.put("msgType", 0);
		}
		return obj.toString();
	}
}