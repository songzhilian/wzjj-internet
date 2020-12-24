package com.sunland.wzjj.dao.acl;

import com.sunland.wzjj.common.mybatis.MyBatisRepository;
import com.sunland.wzjj.po.acl.AclUser;

/**
 * Created by xdb on 2016/5/28.
 */
@MyBatisRepository
public interface IAclUserDao {

    public AclUser getUserInfoByYhdm(String yhdm);



}
