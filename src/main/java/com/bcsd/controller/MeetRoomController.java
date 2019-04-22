package com.bcsd.controller;

import com.bcsd.entity.Result;
import com.bcsd.entity.MeetRoom;
import com.bcsd.service.MeetRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/meet")
public class MeetRoomController {

    @Autowired
    private MeetRoomService meetRoomService;


    /**
     * 查询所有
     * @param
     * @return
     */
    @RequestMapping("/findAll")
    public ModelAndView findAll(){
        ModelAndView vm=new ModelAndView();
        List<MeetRoom> meetRoomList = meetRoomService.findAll();
        vm.addObject("meetRoomList",meetRoomList);
        vm.setViewName("meetRoomList");
        return vm;
    }


    @RequestMapping("/findOne")
    public ModelAndView findOne(String id){
        ModelAndView vm=new ModelAndView();
        MeetRoom meetRoom = meetRoomService.findOne(id);
        vm.addObject("meetRoom",meetRoom);
        vm.setViewName("meetRoom");
        return vm;
    }

    @RequestMapping("/add")
    public Result add(MeetRoom meetRoom){
        meetRoomService.add(meetRoom);
        return null;
    }

    @RequestMapping("/test")
    public void findAll1(){
        List<MeetRoom> all = meetRoomService.findAll();
        System.out.println(all);
    }
}
