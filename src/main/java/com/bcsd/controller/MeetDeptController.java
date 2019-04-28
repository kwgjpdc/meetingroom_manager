package com.bcsd.controller;

import com.bcsd.entity.MeetDept;
import com.bcsd.service.MeetDeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author HOEP
 * @data 2019/4/23
 */
@Controller
@RequestMapping("/dept")
public class MeetDeptController {



    @Autowired
    private MeetDeptService meetDeptService;

    @RequestMapping("/findAll")
    public ModelAndView findAll(){
        ModelAndView vm=new ModelAndView();
        List<MeetDept> meetDeptList = meetDeptService.fidnAll();
        vm.addObject("meetDeptList",meetDeptList);
        vm.setViewName("page/meet_dept");
        return vm;

    }
    @RequestMapping("/findByid")
    public ModelAndView findByid(@RequestParam(value = "deptid") String deptid){

        ModelAndView mv=new ModelAndView();
        MeetDept meetDept=meetDeptService.findByid(deptid);
        mv.addObject("meetdept",meetDept);
        mv.setViewName("page/meet_manager/meet_manager_dept_update");
        return mv;
    }
    @RequestMapping("/update")
    public String update(MeetDept meetDept){

        meetDeptService.update(meetDept);

        return "forward:findAll";
    }


    @RequestMapping("/add")
    public String  add(MeetDept meetDept){
        meetDeptService.add(meetDept);
        return "redirect:findAll";

    }
    @RequestMapping("/delete")
    public String  delete(String deptid){
        meetDeptService.delect(deptid);
        return "forward:findAll";


    }
}
