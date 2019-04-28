package com.bcsd.dao;

import com.bcsd.entity.MeetRoom;
import com.bcsd.entity.MeetUser;
import com.bcsd.entity.Remeet;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface AppointmentMeetDao {

    //根据用户Id查询用户预约的会议
    Remeet findRemeet(int userId);


    //根据用户Id查询所有预约的会议
    List<Remeet>  findAll();


    //增加预约本地会议
    void appointmentMeet(Remeet remeet);

    //增加预约视屏会议
    void appointmentVideoMeet(Remeet remeet);

    //
    void addUser(@Param("user") List<MeetUser> user);



}
