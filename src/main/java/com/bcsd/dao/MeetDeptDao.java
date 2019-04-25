package com.bcsd.dao;

import com.bcsd.entity.MeetDept;

import java.util.List;

/**
 * @author HOEP
 * @data 2019/4/23
 */
public interface MeetDeptDao {
    List<MeetDept> findAll();
    MeetDept findByid(String deptId);
    void add (MeetDept meetDept);
    void update(MeetDept meetDept);
    void delete (String id);
}
