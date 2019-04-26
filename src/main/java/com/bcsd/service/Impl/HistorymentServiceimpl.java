package com.bcsd.service.Impl;

import com.bcsd.dao.AppointmentMeetDao;
import com.bcsd.dao.HistoryMeetDao;
import com.bcsd.entity.HistoryMeet;
import com.bcsd.entity.Remeet;
import com.bcsd.service.AppointmentMeetService;
import com.bcsd.service.HistoryMeetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("historyMeetService")
public class HistorymentServiceimpl implements HistoryMeetService {

    @Autowired
    private HistoryMeetDao historyMeetDao;


    public List<HistoryMeet> findAll() {
        return historyMeetDao.findAll();
    }

    public List<HistoryMeet> findByUserId(int UserId) {
        return null;
    }
}
