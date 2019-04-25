package com.bcsd.controller;

import com.bcsd.entity.Result;
import com.bcsd.entity.MeetRoom;
import com.bcsd.service.MeetRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/meet")
public class MeetRoomController {

    @Autowired
    @Qualifier("meetRoomService")
    private MeetRoomService meetRoomService;








    /**
     * 查询所有
     * @param
     * @return
     */
    @RequestMapping("meet_management")
    public ModelAndView findAll(){

        ModelAndView vm=new ModelAndView();
        List<MeetRoom> meetRoomList = meetRoomService.findAll();
        vm.addObject("meetRoomList",meetRoomList);
        vm.setViewName("page/meet_management");
        return vm;
    }

    @RequestMapping("remeetroom")
    public ModelAndView findRoom(){

        ModelAndView vm=new ModelAndView();
        List<MeetRoom> meetRoomList = meetRoomService.findAll();
        vm.addObject("meetRoomList",meetRoomList);
        vm.setViewName("page/home");
        return vm;
    }


    @RequestMapping("/findOne")
    public ModelAndView findOne(String id){
        ModelAndView vm=new ModelAndView();
        MeetRoom meetRoom = meetRoomService.findOne(id);
        vm.addObject("meetRoom",meetRoom);
        vm.setViewName("findOne");
        return vm;
    }

//    @RequestMapping("/add")
//    public Result add(MeetRoom meetRoom){
//        meetRoomService.add(meetRoom);
//        return null;
//    }

    @RequestMapping("/test")
    public void findAll1(){
        List<MeetRoom> all = meetRoomService.findAll();
        System.out.println(all);
    }
}
