package com.bcsd.service;

import com.bcsd.entity.MeetRoom;
import org.springframework.stereotype.Service;


import java.util.List;


public interface MeetRoomService {
    List<MeetRoom> findAll();

    void add(MeetRoom meetRoom);

    MeetRoom findOne(String id);


}
