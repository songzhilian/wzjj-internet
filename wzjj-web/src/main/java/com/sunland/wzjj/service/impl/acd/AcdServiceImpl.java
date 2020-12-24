package com.sunland.wzjj.service.impl.acd;

import com.sunland.frame.utils.PageManager;
import com.sunland.wzjj.dao.acd.IAcdDao;
import com.sunland.wzjj.dao.acd.IAcdSmsCaptchaDao;
import com.sunland.wzjj.dao.acd.IAcdSmsDao;
import com.sunland.wzjj.dto.acd.AcdSyncSmsDto;
import com.sunland.wzjj.po.acd.AcdDutySimple;
import com.sunland.wzjj.po.acd.AcdSyncSms;
import com.sunland.wzjj.po.acd.AcdSyncSmsCaptcha;
import com.sunland.wzjj.query.acd.AcdParamInfo;
import com.sunland.wzjj.service.acd.IAcdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by xdb on 2016/5/25.
 */
@Service
public class AcdServiceImpl implements IAcdService {

    @Autowired
    private IAcdDao acdDao;

    @Autowired
    private IAcdSmsDao smsDao;

    @Autowired
    private IAcdSmsCaptchaDao captchaDao;

    @Override
    public List<AcdDutySimple> getAcdList(AcdParamInfo paramInfo) throws Exception{
        List<AcdDutySimple> list = null;
        try {
            PageManager pageManager = new PageManager(paramInfo.getPage(), paramInfo.getRows());
            paramInfo.setPage(pageManager.getPage());
            paramInfo.setRows(pageManager.getPageSize());
            list = acdDao.getAcdList(paramInfo);
        }catch (Exception e){

        }
        return list;
    }

    @Override
    public Integer getAcdTotal(AcdParamInfo paramInfo)throws Exception {
        return acdDao.getAcdTotal(paramInfo);
    }

    @Override
    public AcdDutySimple getAcdInfoByLsh(Long lsh)throws Exception {
        return acdDao.getAcdInfoByLsh(lsh);
    }

    @Override
    public AcdDutySimple getAcdInfoBySgbh(String sgbh)throws Exception {
        return acdDao.getAcdInfoBySgbh(sgbh);
    }

    @Override
    public Long getAcdLshBySgbh(String sgbh)throws Exception {
        return acdDao.getAcdLshBySgbh(sgbh);
    }

    @Override
    public boolean checkAcdBySgbhSjhm(String sgbh, String sjhm) throws Exception{
        Integer total = acdDao.getAcdCountBySgbhSjhm(sgbh, sjhm);
        if(total != null && total.intValue() > 0){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public void saveAcdSms(AcdSyncSms sms) {
        this.smsDao.saveAcdSms(sms);
    }

    @Override
    public AcdSyncSmsCaptcha getAcdSmsCaptchaBySjhmYzm(AcdSyncSmsDto smsDto) throws Exception{
        return captchaDao.getAcdSmsCaptchaBySjhmYzm(smsDto);
    }
}
