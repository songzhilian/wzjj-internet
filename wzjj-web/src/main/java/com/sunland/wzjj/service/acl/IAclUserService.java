package com.sunland.wzjj.service.acl;

import com.sunland.wzjj.po.acl.AclUser;

/**
 * Created by xdb on 2016/5/28.
 */
public interface IAclUserService {

    public AclUser getUserInfoByYhdm(String yhdm);
}
