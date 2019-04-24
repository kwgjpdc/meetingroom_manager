package com.bcsd.service;

import com.bcsd.entity.MeetRoom;

import java.util.List;


public interface ReMeetRoomService {

    //查询楼层
    List<MeetRoom> findFloor(String areaid,String building);
    //查询地区
   List<MeetRoom>  findArea();
    //查询地区
    List<MeetRoom> findBuilding( String area);
    //查询会议室
    List<MeetRoom> findRoom(String areaid,String building,String floor);

}
