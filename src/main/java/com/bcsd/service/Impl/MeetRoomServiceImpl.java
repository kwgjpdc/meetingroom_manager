package com.bcsd.service.Impl;

import com.bcsd.dao.MeetRoomDao;
import com.bcsd.entity.MeetRoom;
import com.bcsd.entity.Result;
import com.bcsd.service.MeetRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service("meetRoomService")
public class MeetRoomServiceImpl implements MeetRoomService {

    @Autowired
    private MeetRoomDao meetRoomDao;

    public List<MeetRoom> findAll() { return meetRoomDao.findAll(); }

    public void add(MeetRoom meetRoom) throws ParseException {
        //设置roomId
        meetRoom.setRoomId(UUID.randomUUID().toString());
        meetRoom.setRoomCode("NULL");
        meetRoom.setRoomStatus("0");
        //设置最后修改时间
        meetRoom.setLastUpdateDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        //设置创建时间
        meetRoom.setCreateDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        //设置添加人
        meetRoom.setCreateUser("System");
        meetRoom.setLastUpdateUser("NULL");
        meetRoom.setMeetingSubdept("NULL");
        try {
            meetRoomDao.add(meetRoom);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public MeetRoom findOne(String id) {
        return meetRoomDao.findOne(id);
    }

    @Override
    public void delete(String id) {
        meetRoomDao.delete(id);
    }

    @Override
    public void update(MeetRoom meetRoom) {
        //设置最后修改时间
        meetRoom.setLastUpdateDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        meetRoomDao.update(meetRoom);
    }
}