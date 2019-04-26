package com.bcsd.controller;

import com.alibaba.fastjson.JSONObject;
import com.bcsd.dao.AppointmentMeetDao;
import com.bcsd.entity.HistoryMeet;
import com.bcsd.entity.MeetRoom;
import com.bcsd.entity.Remeet;
import com.bcsd.entity.Result;
import com.bcsd.service.AppointmentMeetService;
import com.bcsd.service.HistoryMeetService;
import com.bcsd.service.MeetRoomService;
import com.bcsd.service.ReMeetRoomService;

import com.bcsd.util.DateChange;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.text.ParseException;
import java.util.List;

@Controller
@RequestMapping("meetroom")
public class ReMeetRoomController {

    @Autowired
    @Qualifier("reMeetRoomService")
    private ReMeetRoomService reMeetRoomService;
    @Autowired
    private AppointmentMeetService appointmentMeetService;
    @Autowired
    private HistoryMeetService historyMeetService;

    /**
     * 查询所有
     * @param
     * @return
     */

    /**
     * 查询地区
     * @param
     * @return
     */
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
    /**
     * 查询大楼
     * @param
     * @return
     */
    @RequestMapping(value="/meetbuilding",method= RequestMethod.POST,
            produces={"application/json;charset=utf-8"})
    @ResponseBody
    public Object meetbuilding(@RequestParam(value="key") String key){
            String result =JSONObject.toJSONString(reMeetRoomService.findBuilding(key));
            return result;
    }

    /**
     * 查询楼层
     * @param
     * @return
     */
    @RequestMapping(value="/meetfloor",method= RequestMethod.POST,
            produces={"application/json;charset=utf-8"})
    @ResponseBody
    public Object roomfloor(@RequestParam(value="area") String area,@RequestParam(value="building") String building){
            String result =JSONObject.toJSONString(reMeetRoomService.findFloor(area,building));
            return result;
    }


    /**
     * 查询会议室
     * @param
     * @return
     */
    @RequestMapping(value="/meetroom",method= RequestMethod.POST,
            produces={"application/json;charset=utf-8"})
    @ResponseBody
    public Object meetrooom(@RequestParam(value="area") String area,@RequestParam(value="building") String building,@RequestParam(value="floor") String floor,
                            @RequestParam(value = "date")String date,@RequestParam(value = "time")String time,@RequestParam(value = "duration")String duration) throws ParseException {
            String datetime =date.trim()+" "+time.trim();
            System.out.println(datetime);
            String endTime= DateChange.getTime(datetime,duration);
            System.out.println(endTime);
            String result =JSONObject.toJSONString(reMeetRoomService.findRoom(area,building,floor.trim()));
            //System.out.println(result);
            return result;
    }


    /**
     * 根据id查询会议室信息
     * @param
     * @return
     */
    @RequestMapping("remmet")
    public ModelAndView remmet(@Param("id")String id){
        ModelAndView vm=new ModelAndView();
        System.out.println(id);
        MeetRoom meetRoom=reMeetRoomService.findById(id);
        vm.addObject("meetRoom",meetRoom);
        vm.setViewName("page/localmeet");
        return vm;
    }

    @RequestMapping("videoremeet")
    public ModelAndView video(@Param("id")String id){
        ModelAndView vm=new ModelAndView();
        System.out.println(id);
        MeetRoom meetRoom=reMeetRoomService.findById(id);
        vm.addObject("meetRoom",meetRoom);
        vm.setViewName("page/videomeet");
        return vm;
    }


    /**
     * 预定本地会议
     * @param
     * @return
     */
    @RequestMapping("appointmeet")
    public ModelAndView appointmmet(Remeet remeet){
        ModelAndView vm=new ModelAndView();
        System.out.println(remeet);
        //增加数据进去
        appointmentMeetService.appointmentMeet(remeet);
        List<Remeet> meets=appointmentMeetService.findAll();
        vm.addObject("meets",meets);
        vm.setViewName("page/meettable");
        return vm;
    }
    /**
     * 预定视屏会议
     * @param
     * @return
     */
    @RequestMapping("appointVideoMeet")
    public ModelAndView appointVideoMeet(Remeet remeet){
        ModelAndView vm=new ModelAndView();
        System.out.println(remeet);
        appointmentMeetService.appointmentVideoMeet(remeet);
        //增加数据进去
        List<Remeet> meets=appointmentMeetService.findAll();
        vm.addObject("meets",meets);
        vm.setViewName("page/meettable");
        return vm;
    }



    @RequestMapping("myappointmeet")
    public ModelAndView myappointmeet(){
        ModelAndView vm=new ModelAndView();
        List<Remeet> meets=appointmentMeetService.findAll();
        vm.addObject("meets",meets);
        vm.setViewName("page/meettable");
        return vm;
    }

    @RequestMapping("meet_history")
    public ModelAndView meet_history(){
        ModelAndView vm=new ModelAndView();
        List<HistoryMeet> historymeet=historyMeetService.findAll();
        vm.addObject("historymeet",historymeet);
        vm.setViewName("page/meet_history");
        return vm;
    }

}
