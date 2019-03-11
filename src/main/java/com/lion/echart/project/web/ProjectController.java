package com.lion.echart.project.web;

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

import com.lion.echart.project.entity.PayforEntity;

@Controller
public class ProjectController {

	//项目支付管理列表页 
	@RequestMapping(value = "/project/payforList.web",method=RequestMethod.GET)
	public String payforList(HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		req.setAttribute("ts", System.currentTimeMillis());
		return "/page/project/payforList";
	}
	
	@RequestMapping(value = "/project/payforGetData.json",method=RequestMethod.POST)
	public @ResponseBody List<PayforEntity> payforGetData(HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws IOException { 
		List<PayforEntity> results = new ArrayList<PayforEntity>();
		results.add(new PayforEntity("工程款","","10,696.41","163,522.85","6295.08","9838.73","","186057.99"));
		results.add(new PayforEntity("监理费","","24.96","924.62","104.70","154.79","","1,104.37"));
		results.add(new PayforEntity("施工供电费","","237.07","40.08","150.00","158.42","","435.57"));
		results.add(new PayforEntity("勘察设计费","","178,785.46","20,690.34","","","","199,475.80"));
		results.add(new PayforEntity("征地拆迁安置补偿","","28,010.01","142,247.02","","","","170,257.03"));
		results.add(new PayforEntity("环境影响","","","90.00","","","","90.00"));
		results.add(new PayforEntity("耕地占用税","","180.87","1,496.57","356.06","356.06","","2,033.49"));
		results.add(new PayforEntity("水土保持补偿费","","784.81","","","","","784.81"));
		results.add(new PayforEntity("金中公司清算费用","","81,116.87","17,704.96","","","","98,821.83"));
		//results.add(new PayforEntity("印花税","","","221.90","312.86","312.86","","534.76"));
		//results.add(new PayforEntity("其他技术服务合同款","","104.62","914.18","15.50","15.50","","1,034.30"));
		//results.add(new PayforEntity("建设管理费","","58.92","1,034.05","94.13","94.13","","1,187.11"));
		//results.add(new PayforEntity("临时用地复垦保证金","","","403","","","","403.39"));
		
		return results;
	}
}