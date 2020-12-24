package com.sunland.wzjj.dao.acd;

import com.sunland.wzjj.common.mybatis.MyBatisRepository;
import com.sunland.wzjj.dto.acd.AcdSyncSmsDto;
import com.sunland.wzjj.po.acd.AcdDutySimple;
import com.sunland.wzjj.query.acd.AcdParamInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by xdb on 2016/5/25.
 */
@MyBatisRepository
public interface IAcdDao {

    public List<AcdDutySimple> getAcdList(AcdParamInfo paramInfo);

    public Integer getAcdTotal(AcdParamInfo paramInfo);

    public AcdDutySimple getAcdInfoByLsh(@Param(value = "lsh")Long lsh);

    public AcdDutySimple getAcdInfoBySgbh(@Param(value = "sgbh")String sgbh);

    public Long getAcdLshBySgbh(@Param(value = "sgbh")String sgbh);

    public Integer getAcdCountBySgbhSjhm(@Param(value = "sgbh")String sgbh, @Param(value = "sjhm")String sjhm);


}
