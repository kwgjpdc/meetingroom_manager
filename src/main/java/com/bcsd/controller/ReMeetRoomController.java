package com.bcsd.controller;

import com.alibaba.fastjson.JSONObject;
import com.bcsd.entity.MeetRoom;
import com.bcsd.entity.Result;
import com.bcsd.service.MeetRoomService;
import com.bcsd.service.ReMeetRoomService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("meetroom")
public class ReMeetRoomController {

    @Autowired
    @Qualifier("reMeetRoomService")
    private ReMeetRoomService reMeetRoomService;

    /**
     * 查询所有
     * @param
     * @return
     */
    @RequestMapping("meet_management")
    public ModelAndView findAll(){
        ModelAndView vm=new ModelAndView();


        vm.setViewName("page/meet_management");
        return vm;
    }

    @RequestMapping("remmet")
    public ModelAndView remmet(){
        ModelAndView vm=new ModelAndView();
        System.out.println(12356789);

        vm.setViewName("page/localmeet");
        return vm;
    }




    @RequestMapping("remeetroom")
    public ModelAndView findRoom(){
        ModelAndView vm=new ModelAndView();
        List<MeetRoom> meetRoomBuilding = reMeetRoomService.findBuilding("ch-wh");
        List<MeetRoom> meetRoomArea = reMeetRoomService.findArea();
        vm.addObject("meetRoomArea",meetRoomArea);
        vm.addObject("meetRoomBuilding",meetRoomBuilding);
        vm.setViewName("page/home");
        return vm;
    }







    @RequestMapping(value="/meetbuilding",method= RequestMethod.POST,
            produces={"application/json;charset=utf-8"})
    @ResponseBody
    public Object meetbuilding(@RequestParam(value="key") String key){

        try {
            String result =JSONObject.toJSONString(reMeetRoomService.findBuilding(key));
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping(value="/meetfloor",method= RequestMethod.POST,
            produces={"application/json;charset=utf-8"})
    @ResponseBody
    public Object roomfloor(@RequestParam(value="area") String area,@RequestParam(value="building") String building){

        try {
            String result =JSONObject.toJSONString(reMeetRoomService.findFloor(area,building));
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }



    @RequestMapping(value="/meetroom",method= RequestMethod.POST,
            produces={"application/json;charset=utf-8"})
    @ResponseBody
    public Object meetrooom(@RequestParam(value="area") String area,@RequestParam(value="building") String building,@RequestParam(value="floor") String floor){

        try {

            String result =JSONObject.toJSONString(reMeetRoomService.findRoom(area,building,floor.trim()));

            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
