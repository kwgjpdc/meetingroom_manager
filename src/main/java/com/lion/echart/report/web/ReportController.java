package com.lion.echart.report.web;

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
import com.lion.echart.project.entity.MonthTotalEntity;

/**
 * 报表相关后台请求
 * @author lion-y
 *
 */
@Controller
public class ReportController {

	@Autowired
	private BaseService baseService;
	
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
		List<MonthTotalEntity> results = testdata();
		return results;
	}
	
	//测试数据构建方法
	private List<MonthTotalEntity> testdata(){
		List<MonthTotalEntity> results = new ArrayList<MonthTotalEntity>();
		String[] one1 = {"丽江分局","336,012.25","","994.15","1,711.71","26,261.63","22,507.22","65,429.8"};
		results.add(createOneTest(one1));
		String[] one2 = {"大理分局","585,037.14","","1,122.55","4,325.74","57,152.92","25,263.06","88,908.68"};
		results.add(createOneTest(one2));
		String[] one3 = {"雄楚分局","192,527.00","","1,010.00","4,049.00","30,621.00","16,481.82","32,094.42"};
		results.add(createOneTest(one3));
		String[] one4 = {"昆明分局","19,265.05","","325.38","1,188.58","12,086.86","8,644.66","7,084.74"};
		results.add(createOneTest(one4));
		String[] one5 = {"玉溪分局","","","","","","",""};
		results.add(createOneTest(one5));
		String[] one6 = {"红河分局","","","","","","",""};
		results.add(createOneTest(one6));
		String[] one7 = {"合计","1,132,841.44","0.00","3,452.08","11,275.03","126,122.41","72,896.74","193,517.64"};
		results.add(createOneTest(one7));
		return results;
	}
	private MonthTotalEntity createOneTest(String[] datas) {
		MonthTotalEntity one = new MonthTotalEntity();
		one.setDepartStr(datas[0]);

		one.setContractTotalStr(datas[1]);//合同总金额
		one.setThisYearPlanStr(datas[2]);//本年计划完成投资
		one.setThisMonthInvestStr(datas[3]);//当月完成投资
		one.setThisYtmTotalStr(datas[4]);//本年至当月实际完成投资
		one.setInvestTotalStr(datas[5]);//开工以来累计完成投资
		one.setBalanceTotalStr(datas[6]);//累计结算工程款
		one.setPayforTotalStr(datas[7]);//累计支付情况
		
		return one;
	}
}