package com.sunland.wzjj.service.acd;

import com.sunland.wzjj.dto.acd.AcdSyncSmsDto;
import com.sunland.wzjj.po.acd.AcdDutySimple;
import com.sunland.wzjj.po.acd.AcdSyncSms;
import com.sunland.wzjj.po.acd.AcdSyncSmsCaptcha;
import com.sunland.wzjj.query.acd.AcdParamInfo;

import java.util.List;

/**
 * Created by xdb on 2016/5/25.
 */
public interface IAcdService {

    public List<AcdDutySimple> getAcdList(AcdParamInfo paramInfo)throws Exception;

    public Integer getAcdTotal(AcdParamInfo paramInfo)throws Exception;

    public AcdDutySimple getAcdInfoByLsh(Long lsh)throws Exception;

    public AcdDutySimple getAcdInfoBySgbh(String sgbh)throws Exception;

    public Long getAcdLshBySgbh(String sgbh)throws Exception;

    public boolean checkAcdBySgbhSjhm(String sgbh,String sjhm) throws Exception;

    public AcdSyncSmsCaptcha getAcdSmsCaptchaBySjhmYzm(AcdSyncSmsDto smsDto)throws Exception;

    public void saveAcdSms(AcdSyncSms sms)throws Exception;
}
