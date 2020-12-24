package com.sunland.wzjj.dao.admin;

import com.sunland.wzjj.common.mybatis.MyBatisRepository;
import com.sunland.wzjj.po.admin.SysUser;

/**
 * Created by xdb on 2016/6/1.
 */
@MyBatisRepository
public interface ISysUserDao {

    public SysUser getUserInfoByYhdm(String yhdm);
}
