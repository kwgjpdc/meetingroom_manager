package com.bcsd.controller;

import com.bcsd.entity.MeetUser;
import com.bcsd.entity.MeetUserRole;
import com.bcsd.service.Impl.MeetUserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.UUID;

/**
 * @author HOEP
 * @data 2019/4/24
 */
@Controller
@RequestMapping("/user")
public class MeetUserController {
    @Autowired
    private MeetUserServiceImpl meetUserService;
    @RequestMapping("/findAll")
    public ModelAndView findAll(){
        ModelAndView mv=new ModelAndView();
        List<MeetUser> all = meetUserService.findAll();
        mv.addObject("meetuserlist",all);
        mv.setViewName("page/meet_user");
        return mv;

    }
    @RequestMapping("/add")
    public String add(MeetUser meetUser){
//        String uuid = String.valueOf(UUID.randomUUID());
//        String[] split = uuid.split("-");
//        meetUser.setId(split[2]);
        meetUserService.add(meetUser);
        MeetUserRole meetUserRole =new MeetUserRole();
//        meetUserRole.setRoleid(meetUser.getRolename());
//        meetUserRole.setId(split[1]);
//        meetUserRole.setUserid(meetUser.getId());
        meetUserService.addid(meetUserRole);
        return "forward:findAll";
    }

}
