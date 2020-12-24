package com.sunland.wzjj.dao.acd;

import com.sunland.wzjj.common.mybatis.MyBatisRepository;
import com.sunland.wzjj.dto.acd.AcdSyncSmsDto;
import com.sunland.wzjj.po.acd.AcdSyncSmsCaptcha;

/**
 * Created by xdb on 2016/5/31.
 */
@MyBatisRepository
public interface IAcdSmsCaptchaDao {
    public AcdSyncSmsCaptcha getAcdSmsCaptchaBySjhmYzm(AcdSyncSmsDto smsDto);
}
