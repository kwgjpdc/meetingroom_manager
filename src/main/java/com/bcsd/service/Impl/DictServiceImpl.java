package com.bcsd.service.Impl;

import com.bcsd.dao.DictDao;
import com.bcsd.entity.Dict;
import com.bcsd.service.DictService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;

@Service("dictService")
public class DictServiceImpl implements DictService {

    @Autowired
    private DictDao dictDao;


    public List<Dict> findAll() {
        return dictDao.findAll();
    }

    public void add(Dict dict) {
        dictDao.add(dict);
    }

    public Dict findOne(int id) {
        return dictDao.findOne(id);
    }

    public void delete(int id) {
        dictDao.delete(id);
    }

    public void update(Dict dict) {
        dictDao.update(dict);
    }

    public Page<Map<String, Object>> list(Page page,String condition) {
        if (page.getPageSize()==0){
            page.setPageNum(1);
        }
        if (page.getPageSize()==0){
            page.setPageSize(10);
        }
       return dictDao.list(page, condition);
    }

    /**
     * 分页查询
     * @param pageNum
     * @param pageSize
     * @return
     */
    public List<Dict> findPage(int pageNum, int pageSize,String name) {
        PageHelper.startPage(pageNum,pageSize);//分页
        return dictDao.findAll(name);
    }

    public List<Dict> findByPid(Integer page, Integer size, Integer pid) {
        PageHelper.startPage(page,size);//分页

        return dictDao.findByPid(page,size,pid);
    }
}
