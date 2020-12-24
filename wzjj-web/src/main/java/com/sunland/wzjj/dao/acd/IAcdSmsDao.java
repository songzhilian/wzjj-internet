package com.sunland.wzjj.dao.acd;

import com.sunland.wzjj.common.mybatis.MyBatisRepository;
import com.sunland.wzjj.po.acd.AcdSyncSms;

/**
 * Created by xdb on 2016/5/31.
 */
@MyBatisRepository
public interface IAcdSmsDao {
    public void saveAcdSms(AcdSyncSms sms);
}
