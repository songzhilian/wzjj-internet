package com.sunland.wzjj.service.impl.admin;

import com.sunland.wzjj.dao.admin.ISysUserDao;
import com.sunland.wzjj.po.admin.SysUser;
import com.sunland.wzjj.service.admin.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by xdb on 2016/6/1.
 */
@Service
public class SysUserServiceImpl implements ISysUserService {

    @Autowired
    private ISysUserDao sysUserDao;

    @Override
    public SysUser getUserInfoByYhdm(String yhdm) {
        return sysUserDao.getUserInfoByYhdm(yhdm);
    }
}
