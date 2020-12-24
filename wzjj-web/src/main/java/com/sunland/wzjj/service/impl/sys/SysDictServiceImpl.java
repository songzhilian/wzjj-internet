package com.sunland.wzjj.service.impl.sys;

import com.sunland.wzjj.dao.sys.ISysDictDao;
import com.sunland.wzjj.service.sys.ISysDictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by marty on 2016/8/4.
 */
@Service
public class SysDictServiceImpl implements ISysDictService {

    @Autowired
    private ISysDictDao sysDictDao;

    @Override
    public String getSysDictValue(String dmlb, String dmz) {
        return sysDictDao.getSysDictValue(dmlb,dmz);
    }
}
