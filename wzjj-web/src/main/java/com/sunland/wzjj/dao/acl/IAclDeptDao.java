package com.sunland.wzjj.dao.acl;

import com.sunland.wzjj.common.mybatis.MyBatisRepository;
import com.sunland.wzjj.po.acl.AclDept;

/**
 * Created by xdb on 2016/5/28.
 */
@MyBatisRepository
public interface IAclDeptDao {
    public AclDept getDept(String bmdm);
}
