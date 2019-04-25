package com.bcsd.service;

import com.bcsd.entity.MeetUser;
import com.bcsd.entity.MeetUserRole;

import java.util.List;

/**
 * @author HOEP
 * @data 2019/4/24
 */
public interface MeetUserService {
    List<MeetUser> findAll();
    void add(MeetUser meetUser);
    void addid(MeetUserRole meetUserRole);
    MeetUser findByid(String Id);
    void update(MeetUser meetUser);
    void delete(String id);
}
