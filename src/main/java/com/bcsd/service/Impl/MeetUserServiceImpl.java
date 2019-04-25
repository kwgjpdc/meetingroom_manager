package com.bcsd.service.Impl;

import com.bcsd.dao.MeetUserDao;
import com.bcsd.entity.MeetUser;
import com.bcsd.entity.MeetUserRole;
import com.bcsd.service.MeetUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author HOEP
 * @data 2019/4/24
 */
@Service("meetUserService")
public class MeetUserServiceImpl implements MeetUserService {
    @Autowired
    private MeetUserDao meetUserDao;
    public List<MeetUser> findAll() {
        List<MeetUser> all = meetUserDao.findAll();
        return all;
    }

    public void add(MeetUser meetUser) {
     meetUserDao.add(meetUser);
    }

    public void addid(MeetUserRole meetUserRole) {
        meetUserDao.addid(meetUserRole);
    }

    public MeetUser findByid(String Id) {
        return null;
    }

    public void update(MeetUser meetUser) {

    }

    public void delete(String id) {

    }
}
