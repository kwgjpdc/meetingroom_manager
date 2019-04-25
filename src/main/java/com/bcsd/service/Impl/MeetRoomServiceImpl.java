package com.bcsd.service.Impl;

import com.bcsd.dao.MeetRoomDao;
import com.bcsd.entity.MeetRoom;
import com.bcsd.service.MeetRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("meetRoomService")
public class MeetRoomServiceImpl implements MeetRoomService {

    @Autowired
    private MeetRoomDao meetRoomDao;

    public List<MeetRoom> findAll() { return meetRoomDao.findAll(); }

    public void add(MeetRoom meetRoom) {
        meetRoomDao.add( meetRoom);
    }

    public MeetRoom findOne(String id) {
        return meetRoomDao.findOne(id);
    }

    public void delete(String id) {

    }

    public void update(MeetRoom meetRoom) {

    }
}
