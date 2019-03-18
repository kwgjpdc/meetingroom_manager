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
import com.lion.echart.project.entity.MonthTotalEntity;
import com.lion.echart.project.entity.PayforEntity;
import com.lion.echart.system.entity.MenuEntity;
import com.lion.echart.system.entity.UserEntity;

import net.sf.json.JSONObject;

/**
 * 菜单信息相关跳转控制
 * @author TANGXIAN
 *
 */
@Controller
public class MenuController {
	@Autowired
	private BaseService baseService;
	//菜单信息列表页 
	@RequestMapping(value = "/menu/menuList.web",method=RequestMethod.GET)
	public String menuList(HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		req.setAttribute("ts", System.currentTimeMillis());
		req.setAttribute("who", "contract");
		return "/page/system/menuList";
	}
	
	//菜单信息列表数据
	@RequestMapping(value = "/menu/menuGetData.json",method=RequestMethod.POST)
	public @ResponseBody List<Map<String, Object>> menuGetData(HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		List<Map<String, Object>> list = baseService.queryList("comle.menu.getMenuListData", null);
		return list;
	}
	//父级菜单信息列表数据
	@RequestMapping(value = "/menu/menuParentGetData.json",method=RequestMethod.POST)
	public @ResponseBody List<Map<String, Object>> menuParentGetData(HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		List<Map<String, Object>> list = baseService.queryList("comle.menu.getMenuParentListData", null);
		return list;
	}
	//菜单信息添加列表页 
	@RequestMapping(value = "/menu/menuAdd.web",method=RequestMethod.GET)
	public String menuAdd(HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		req.setAttribute("ts", System.currentTimeMillis());
		req.setAttribute("who", "contract");
		return "/page/system/menuAdd";
	}
	
	//菜单添加保存
	@RequestMapping(value = "/menu/menuSave.json",method=RequestMethod.POST)
	public @ResponseBody String userSave(String menuname,String url,Integer ismenu,Long pid,Integer priority,HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		SimpleDateFormat si = new SimpleDateFormat("yyyy-MM-dd");
		JSONObject obj = new JSONObject();
		try {
			if(ismenu==1){
				pid=(long) 0;
			}
			MenuEntity menu = new MenuEntity(menuname, url, ismenu, pid, new Date(), "", priority, 1, "0", "1", new Date());
			baseService.insertObject("comle.menu.insertMenu", menu);
			obj.put("msgType", 1);
		} catch (Exception e) {
			e.printStackTrace();
			obj.put("msgType", 0);
		}
		return obj.toString();
	}
	//通过userid菜单信息列表数据
	@RequestMapping(value = "/menu/menuGetDataByUserId.json",method=RequestMethod.POST)
	public @ResponseBody List<Map<String, Object>> menuGetDataByUserId(String userid, HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		Map<String, Object> searchmap = new HashMap<String, Object>();
		searchmap.put("userid", userid);
		List<Map<String, Object>> list = baseService.queryList("comle.menu.getMenuListDataByUserId", searchmap);
		return list;
	}
}