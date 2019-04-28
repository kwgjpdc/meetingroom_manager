package com.bcsd.controller;

import com.alibaba.fastjson.JSONObject;
import com.bcsd.dao.AppointmentMeetDao;
import com.bcsd.entity.*;
import com.bcsd.service.*;

import com.bcsd.util.DateChange;
import com.github.pagehelper.PageInfo;
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

    @Autowired
    private MeetUserService meetUserService;

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
     * 按地区大楼楼层日期查询会议室
     * @param
     * @return
     */
    @RequestMapping(value="/meetroom",method= RequestMethod.POST,
            produces={"application/json;charset=utf-8"})
    @ResponseBody
    public Object meetrooom(@RequestParam(value="area") String area,@RequestParam(value="building") String building,@RequestParam(value="floor") String floor,
                            @RequestParam(value = "date")String date,@RequestParam(value = "time")String time,@RequestParam(value = "duration")String duration) throws ParseException {
            //到时候放到service层
            String datetime =date.trim()+" "+time.trim();
            String endTime= DateChange.getTime(datetime,duration);
            List<Appointment_Meeting> roomId=reMeetRoomService.findByDate(datetime,endTime);
            String roomid="(";
            int i =1;
            for (Appointment_Meeting id:roomId){
                System.out.println(roomId.size());
                if(i==roomId.size()) {
                    System.out.println(id.getMeetRoomId());
                    roomid = roomid + id.getMeetRoomId();
                }else {
                    roomid = roomid + id.getMeetRoomId()+",";
                }
                i++;
            }
                roomid=roomid+")";
            String result =JSONObject.toJSONString(reMeetRoomService.findRoom(area,building,floor.trim(),roomid));

            return result;
    }


    /**
     * 根据id查询会议室信息
     * @param
     * @return
     */
    @RequestMapping("remmet")
    public ModelAndView remmet(@Param("id")String id,@RequestParam(value = "date")String date,@RequestParam(value = "time")String time,
                               @RequestParam(value = "duration")String duration){
        String datetime =date.trim()+" "+time.trim();
        ModelAndView vm=new ModelAndView();
        MeetRoom meetRoom=reMeetRoomService.findById(id);
        vm.addObject("datetime",datetime);
        vm.addObject("duration",duration);
        vm.addObject("meetRoom",meetRoom);
        vm.setViewName("page/localmeet");
        return vm;
    }

    @RequestMapping("videoremeet")
    public ModelAndView video(@Param("id")String id,@RequestParam(value = "date")String date,@RequestParam(value = "time")String time,
                              @RequestParam(value = "duration")String duration){
        String datetime =date.trim()+" "+time.trim();
        ModelAndView vm=new ModelAndView();
        MeetRoom meetRoom=reMeetRoomService.findById(id);
        vm.addObject("datetime",datetime);
        vm.addObject("duration",duration);
        vm.addObject("meetRoom",meetRoom);
        vm.setViewName("page/videomeet");
        return vm;
    }

    @RequestMapping("findInternal")
    public ModelAndView findInternal(Integer page, Integer size, Integer internal, String name){
        if (page == null || page == 0) {
            page = 1;
        }
        if (size == null || size == 0) {
            size = 5;
        }
        if (internal == null || internal != 1) {
            internal = 0;
        }
        if (name == null) {
            name = "";
        }
        ModelAndView vm = new ModelAndView();
        List<User> list = meetUserService.findInternal(page, size, 0, name);
        //PageInfo pageInfo = new PageInfo<>(list);
        vm.addObject("Internal", list);
//        if (isExternal==1){
//            List<User> list = meetUserService.findExternal(page, size, isExternal, name);
//            pageInfo = new PageInfo<>(list);
//            vm.addObject("External",pageInfo);
//        }
        //vm.setViewName(PREFIX + "/linkman1");
        return vm;
//        ObjectMapper mapper = new ObjectMapper();
//        String s = mapper.writeValueAsString(pageInfo);
//        request.setAttribute("internal",pageInfo);
//        request.getRequestDispatcher("page/user/linkman1.jsp").forward(request,response);
//        response.sendRedirect("page/user/linkman1.jsp");
        //return "linkman1.jsp";
    }


    /**
     * 预定本地会议
     * @param
     * @return
     */
    @RequestMapping("appointmeet")
    public ModelAndView appointmmet(Remeet remeet){
        ModelAndView vm=new ModelAndView();
        //增加数据进去
        appointmentMeetService.appointmentMeet(remeet);
        List<Remeet> meets=appointmentMeetService.findPage(1,10);
        vm.addObject("meets",meets);
        PageInfo pageInfo = new PageInfo<Remeet>(meets);
        vm.addObject("pageInfo",pageInfo);
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
        //增加数据进去
        appointmentMeetService.appointmentVideoMeet(remeet);

        List<Remeet> meets=appointmentMeetService.findPage(1,10);
        vm.addObject("meets",meets);
        PageInfo pageInfo = new PageInfo<Remeet>(meets);
        vm.addObject("pageInfo",pageInfo);
        vm.setViewName("page/meettable");
        return vm;
    }



    @RequestMapping("myappointmeet")
    public ModelAndView myappointmeet(Integer page,Integer size){
        if(page==null||page==0){
            page=1;
        }
        if(size==null||size==0){
            size=10;
        }
        ModelAndView vm=new ModelAndView();
        List<Remeet> meets=appointmentMeetService.findPage(page,size);
        PageInfo pageInfo = new PageInfo<Remeet>(meets);
        vm.addObject("pageInfo",pageInfo);
        vm.setViewName("page/meettable");
        return vm;
    }
//分页查询历史会议
    @RequestMapping("meet_history")
    public ModelAndView meet_history(Integer page,Integer size){
        if(page==null||page==0){
            page=1;
        }
        if(size==null||size==0){
            size=10;
        }
        ModelAndView vm=new ModelAndView();
        List<HistoryMeet> historymeets=historyMeetService.findAll(page,size);
        PageInfo pageInfo = new PageInfo<HistoryMeet>(historymeets);
        vm.addObject("pageInfo",pageInfo);
        vm.setViewName("page/meet_history");
        return vm;
    }

}
