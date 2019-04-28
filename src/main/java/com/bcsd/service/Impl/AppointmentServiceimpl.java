package com.bcsd.service.Impl;

import com.bcsd.dao.AppointmentMeetDao;
import com.bcsd.dao.MeetRoomDao;
import com.bcsd.dao.ReMeetRoomDao;
import com.bcsd.entity.MeetRoom;
import com.bcsd.entity.Remeet;
import com.bcsd.service.AppointmentMeetService;
import com.bcsd.service.ReMeetRoomService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("appointmentMeetService")
public class AppointmentServiceimpl implements AppointmentMeetService {

    @Autowired
    private AppointmentMeetDao appointmentMeetDao;

    //预定本地会议
    public void appointmentMeet(Remeet remeet) {
        appointmentMeetDao.appointmentMeet(remeet);
    }
    //预定视屏会议
    public void appointmentVideoMeet(Remeet remeet) {
        int num = (int)(Math.random()*1000000);
        remeet.setUri(num);
        remeet.setRequireCallId("false");
        remeet.setDefaultLayout("speakerOnly");
        remeet.setCallId(num);
        remeet.setNonMemberAccess("false");
        remeet.setCallProfile("067a6834-b86a-4264-903a-9b4148e1b83b");
        remeet.setCallLegProfile("23d4aca0-db3b-42d7-9cd1-184d4be6e198");
        System.out.println(remeet);
        appointmentMeetDao.appointmentVideoMeet(remeet);
    }
    //按用户查询会议
    public Remeet findRemeet(int userId) {
        return null;
    }

    public List<Remeet> findAll() {
        return appointmentMeetDao.findAll();
}

    //查询所有会议
    public List<Remeet> findPage(int page,int size) {
        PageHelper.startPage(page,size);
        return appointmentMeetDao.findAll();
    }


}
