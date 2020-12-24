package com.sunland.wzjj.dao.acd;

import com.sunland.wzjj.common.mybatis.MyBatisRepository;
import com.sunland.wzjj.po.acd.AcdDutySimpleHuman;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by xdb on 2016/5/26.
 */
@MyBatisRepository
public interface IAcdHumanDao {

    List<AcdDutySimpleHuman> getAcdHumanListByLsh(@Param(value = "lsh")Long lsh);
}
