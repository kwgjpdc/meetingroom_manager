package com.lion.echart.report.web;

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

import com.lion.echart.project.entity.MonthTotalEntity;

/**
 * 报表相关后台请求
 * @author lion-y
 *
 */
@Controller
public class ReportController {

	//月度统计表列表页 
	@RequestMapping(value = "/report/monthTotalList.web",method=RequestMethod.GET)
	public String monthTotalList(HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		req.setAttribute("ts", System.currentTimeMillis());
		req.setAttribute("who", "report");
		return "/page/report/monthTotalList";
	}
	
	//获取支付情况列表数据
	@RequestMapping(value = "/report/monthTotal.json",method=RequestMethod.POST)
	public @ResponseBody List<MonthTotalEntity> monthTotal(HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		//TODO 为测试数据，请改为数据库获取
		List<MonthTotalEntity> results = testdata();
		return results;
	}
	
	//测试数据构建方法
	private List<MonthTotalEntity> testdata(){
		List<MonthTotalEntity> results = new ArrayList<MonthTotalEntity>();
		for(int i = 0; i < 10; i++) {
			results.add(createOneTest());
		}
		return results;
	}
	private MonthTotalEntity createOneTest() {
		MonthTotalEntity one = new MonthTotalEntity();
		return one;
	}
}