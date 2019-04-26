package com.bcsd.controller;

import com.bcsd.entity.MeetRoom;
import com.bcsd.service.MeetRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import java.util.List;

@Controller
@RequestMapping("/meet")
public class MeetRoomController {

    private String PREFIX = "page/meet_management";

    @Autowired
    @Qualifier("meetRoomService")
    private MeetRoomService meetRoomService;


    /**
     * 查询所有会议室
     * @param
     * @return
     */
    @RequestMapping("/findAll")
    public ModelAndView findAll(){
        System.out.println("查询所有会议室");
        ModelAndView vm=new ModelAndView();
        List<MeetRoom> meetRoomList = meetRoomService.findAll();
        vm.addObject("meetRoomList",meetRoomList);
        vm.setViewName(PREFIX);
        return vm;
    }


    /**
     * 查询会议室信息
     * @param
     * @return
     */
    @RequestMapping("/findOne")
    public ModelAndView findOne(@RequestParam(value="roomId") String roomId){
        ModelAndView vm=new ModelAndView();
        MeetRoom meetRoom = meetRoomService.findOne(roomId);
        vm.addObject("meetRoom",meetRoom);
        vm.setViewName(PREFIX+"/meet_manager_update");
        return vm;
    }

    /**
     * 添加会议室
     * @param meetRoom
     * @return
     * @throws Exception
     */
    @RequestMapping("/add")
    public String add(MeetRoom meetRoom) throws Exception {
        //ModelAndView vm=new ModelAndView();
        meetRoomService.add(meetRoom);
        //vm.addObject("addInfo","success");
        System.out.println("添加成功!");
        return "redirect:findAll";
    }

    @RequestMapping("/update")
    public String update(MeetRoom meetRoom){
        meetRoomService.update(meetRoom);
        return "redirect:findAll";
    }

    /**
     * 删除会议室
     * @param roomId
     * @return
     */
    @RequestMapping("/delete")
    public String Method(@RequestParam(value="roomId") String roomId){
       // System.out.println(roomId);
        ModelAndView vm=new ModelAndView();
        meetRoomService.delete(roomId);
      /*  vm.addObject("deleteInfo","success");
        System.out.println("删除成功!");
        vm.setViewName("page/meet_management");*/
        return "redirect:findAll";
    }
}
