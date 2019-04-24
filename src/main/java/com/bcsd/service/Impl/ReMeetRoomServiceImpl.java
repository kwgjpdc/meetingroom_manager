package com.bcsd.service.Impl;

import com.bcsd.dao.MeetRoomDao;
import com.bcsd.dao.ReMeetRoomDao;
import com.bcsd.entity.MeetRoom;
import com.bcsd.service.ReMeetRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("reMeetRoomService")
public class ReMeetRoomServiceImpl implements ReMeetRoomService {
    @Autowired
    private MeetRoomDao meetRoomDao;
    @Autowired
    private ReMeetRoomDao reMeetRoomDao;


    public List<MeetRoom> findFloor(String areaid, String building) {
        return reMeetRoomDao.findFloor(areaid,building);
    }

    public List<MeetRoom> findArea() {
        return reMeetRoomDao.findArea();
    }

    public List<MeetRoom> findBuilding(String area) {
        return reMeetRoomDao.findBuilding(area);
    }

    public List<MeetRoom> findRoom(String areaid, String building, String floor) {
        return reMeetRoomDao.findRoom(areaid,building,floor);
    }
}
