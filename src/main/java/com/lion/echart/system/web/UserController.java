package com.lion.echart.system.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
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
import com.lion.echart.base.logic.BaseService;
import com.lion.echart.contract.entity.ContractEntity;
import com.lion.echart.project.entity.MonthTotalEntity;
import com.lion.echart.project.entity.PayforEntity;
import com.lion.echart.system.entity.UserEntity;
import com.lion.echart.system.entity.UserRoleEntity;

import net.sf.json.JSONObject;

/**
 * 用户信息相关跳转控制
 * @author TANGXIAN
 *
 */
@Controller
public class UserController {
	@Autowired
	private BaseService baseService;
	//用户信息列表页 
	@RequestMapping(value = "/user/userList.web",method=RequestMethod.GET)
	public String userList(HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		req.setAttribute("ts", System.currentTimeMillis());
		req.setAttribute("who", "contract");
		return "/page/system/userList";
	}
	
	//用户信息列表数据
	@RequestMapping(value = "/user/userGetData.json",method=RequestMethod.POST)
	public @ResponseBody List<Map<String, Object>> userGetData(HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		List<Map<String, Object>> list = baseService.queryList("comle.user.getUserListData", null);
		return list;
	}
	
	//用户信息添加列表页 
	@RequestMapping(value = "/user/userAdd.web",method=RequestMethod.GET)
	public String userAdd(HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		req.setAttribute("ts", System.currentTimeMillis());
		req.setAttribute("who", "contract");
		return "/page/system/userAdd";
	}
	
	//用户添加保存
	@RequestMapping(value = "/user/userSave.json",method=RequestMethod.POST)
	public @ResponseBody String userSave(String username,String realname,String sex,String email,String password,HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		SimpleDateFormat si = new SimpleDateFormat("yyyy-MM-dd");
		JSONObject obj = new JSONObject();
		try {
			UserEntity user = new UserEntity(username, realname, password, sex, email, new Date(), "", 0, 1, "0", "1", new Date());
			baseService.insertObject("comle.user.insertUser", user);
			obj.put("msgType", 1);
		} catch (Exception e) {
			e.printStackTrace();
			obj.put("msgType", 0);
		}
		return obj.toString();
	}
	
	//用户角色分配列表页 
	@RequestMapping(value = "/user/userRoleAssign.web",method=RequestMethod.GET)
	public String userRoleAssign(String userid,HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		Map<String, Object> searchmap = new HashMap<String, Object>();
		searchmap.put("userid", userid);
		List<Map<String, Object>> list = baseService.queryList("comle.user.getUserRoleListData", searchmap);
		String roleListStr = "";
		for(Map<String, Object> map : list){
			roleListStr+=map.get("roleid")+",";
		}
		if(list.size()>0){
			roleListStr=roleListStr.substring(0,roleListStr.length()-1);
		}
		req.setAttribute("ts", System.currentTimeMillis());
		req.setAttribute("who", "contract");
		req.setAttribute("userid", userid);
		req.setAttribute("roleListStr", roleListStr);
		return "/page/system/userRoleAssign";
	}
	//用户角色分配添加保存
	@RequestMapping(value = "/user/userRoleSave.json",method=RequestMethod.POST)
	public @ResponseBody String userRoleSave(String userid,String roleidArrStr,HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		SimpleDateFormat si = new SimpleDateFormat("yyyy-MM-dd");
		JSONObject obj = new JSONObject();
		try {
			//先删除用户角色表，然后添加
			//del
			Map<String, Object> delmap = new HashMap<String, Object>();
			delmap.put("userid", userid);
			baseService.delete("comle.user.deleteUserRole", delmap);
			//insert
			String roleidArr[] = roleidArrStr.split(",");
			for(String roleid : roleidArr){
				UserRoleEntity userRole = new UserRoleEntity(Long.valueOf(userid), Long.valueOf(roleid));
				baseService.insertObject("comle.user.insertUserRole", userRole);
			}
			obj.put("msgType", 1);
		} catch (Exception e) {
			e.printStackTrace();
			obj.put("msgType", 0);
		}
		return obj.toString();
	}
}