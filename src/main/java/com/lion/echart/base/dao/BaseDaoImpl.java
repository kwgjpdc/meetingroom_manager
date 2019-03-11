package com.lion.echart.base.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * 所有dao处理请继承此类
 * @author lion
 * 20161008 17:26
 */
@Repository("baseDao")
public class BaseDaoImpl implements BaseDao{
	protected SqlSession sqlMapClient;
	
	@Autowired(required = false)
	public final void setMySqlMapClient(SqlSession sqlMapClient) {
		setSqlMapClient(sqlMapClient);
	}
	
	@Autowired
	public void setSqlMapClient(SqlSession sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}
	
	public SqlSession getSqlMapClient() {
		return sqlMapClient;
	}

	public void updateObject(String sqlid, Object object) throws Exception{
		sqlMapClient.update(sqlid, object);
	}
	
	public void insertObject(String sqlid, Object object) throws Exception{
		sqlMapClient.insert(sqlid, object);
	}

	public String getNameSpace() {
		return null;
	}

	public int delete(String sqlid, Object param) {
		return sqlMapClient.delete(sqlid, param);
	}

	public List queryList(String sqlid, Object param) {
		return sqlMapClient.selectList(sqlid, param);
	}

	public Object queryObject(String sqlid, Object param) {
		List list = sqlMapClient.selectList(sqlid, param);
		Object obj = null;
		if(list != null && list.size() == 1) {
			obj = list.get(0);
		}
		return obj;
	}

	public void updateBatchBySQL(String sqlID, Object object) throws Exception {
		// TODO Auto-generated method stub
		
	}

	public void insertBatchBySQL(String sqlID, Object object) throws Exception {
		// TODO Auto-generated method stub
		
	}

}