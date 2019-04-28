package com.bcsd.dao;

import com.bcsd.entity.MeetUser;
import com.bcsd.entity.MeetUserRole;
import com.bcsd.entity.User;
import com.bcsd.entity.UserInternal;

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


    /*查询联系人*/
    List<User> findInternal(Integer internal, String name);

    List<MeetUser> findExternal(Integer internal, String name);

    void addInternal(UserInternal internal);

    void deleteInternal(Integer id);


}
