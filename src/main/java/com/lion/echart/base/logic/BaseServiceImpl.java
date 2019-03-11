package com.lion.echart.base.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.lion.echart.base.dao.BaseDao;

public class BaseServiceImpl implements BaseService{

	@Autowired
	protected BaseDao baseDao;
	
	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	public void updateObject(String sqlid, Object object) throws Exception{
		baseDao.updateObject(sqlid, object);
	}
	
	public void insertObject(String sqlid, Object object) throws Exception{
		baseDao.insertObject(sqlid, object);
	}
	
	public int delete(String sqlid, Object param) {
		return baseDao.delete(sqlid, param);
	}

	public List queryList(String sqlid, Object param) {
		return baseDao.queryList(sqlid, param);
	}

	public Object queryObject(String sqlid, Object param) {
		return baseDao.queryObject(sqlid, param);
	}

	public void updateBatchBySQL(String sqlID, Object object) throws Exception {
		// TODO Auto-generated method stub
		
	}

	public void insertBatchBySQL(String sqlID, Object object) throws Exception {
		// TODO Auto-generated method stub
		
	}

}