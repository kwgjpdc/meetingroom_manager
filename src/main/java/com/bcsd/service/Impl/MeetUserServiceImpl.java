package com.bcsd.service.Impl;

import com.bcsd.dao.MeetUserDao;
import com.bcsd.entity.MeetUser;
import com.bcsd.entity.MeetUserRole;
import com.bcsd.entity.User;
import com.bcsd.entity.UserInternal;
import com.bcsd.service.MeetUserService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

    /**
     * 查询内部联系人
     * @param page
     * @param size
     * @param internal
     * @param name
     * @return
     */

    public List<User> findInternal(Integer page,Integer size,Integer internal,String name) {
        //PageHelper.startPage(page,size);
        List<User> list= meetUserDao.findInternal(internal,name);
        return list;
    }

    /**
     * 查询外部联系人
     * @param page
     * @param size
     * @param internal
     * @param name
     * @return
     */

    public List<MeetUser> findExternal(Integer page,Integer size,Integer internal,String name) {
        //PageHelper.startPage(page,size);
        List<MeetUser> list= meetUserDao.findExternal(internal,name);
        return list;
    }


    public void addInternal(UserInternal internal) {
        meetUserDao.addInternal(internal);
    }

    /**
     * 删除
     * @param
     */

    @Transactional  //事务管理
    public void deleteInternal(Integer id) {
        meetUserDao.deleteInternal(id);
    }

    /**
     * 批量删除
     * @param ids
     */

    @Transactional  //事务管理
    public void deleteInternal(Integer[] ids) {
        try {
            if (ids!=null&&ids.length>0){
                for (Integer id : ids) {
                    meetUserDao.deleteInternal(id);
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }

    }
}
