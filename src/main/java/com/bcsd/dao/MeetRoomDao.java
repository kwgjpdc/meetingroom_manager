package com.bcsd.dao;

import com.bcsd.entity.MeetRoom;
import org.springframework.stereotype.Repository;

import java.util.List;


public interface MeetRoomDao {

    List<MeetRoom> findAll();

    void add(MeetRoom meetRoom);

    MeetRoom findOne(String id);

    void delete(String id);

    void update(MeetRoom meetRoom);
}
