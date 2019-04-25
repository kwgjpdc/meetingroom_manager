package com.bcsd.dao;

import com.bcsd.entity.MeetUser;
import com.bcsd.entity.MeetUserRole;

import java.util.List;

/**
 * @author HOEP
 * @data 2019/4/24
 */
public interface MeetUserDao {
    List<MeetUser> findAll();
    void add(MeetUser meetUser);
    void addid(MeetUserRole meetUserRole);
    MeetUser findByid(String Id);
    void update(MeetUser meetUser);
    void delete(String id);


}
