package com.aj.web.mapper;

import com.aj.web.pojo.AgvSeries;
import com.aj.web.pojo.AgvType;
import com.aj.web.pojo.AgvTypes;
import org.apache.ibatis.annotations.*;

import java.util.List;

/***
 *@title AgvTypeMapper
 *@description <TODO description class purpose>
 *@author Chuck
 *@version 1.0.0
 *@create 2026/1/14 16:04
 *@mail beier33@163.com
 **/
@Mapper
public interface AgvTypeMapper {

    /***
     * 查询所有AGV
     */
    @Select("SELECT * FROM cus_agvType order by UpdateTime desc")
    List<AgvType> findAll();

    /**
     * 查询所有AGV系列
     */
    @Select("SELECT * FROM cus_agvseries")
    List<AgvSeries> findAllSeries();

    /**
     * 查询所有AGV类型
     */
    @Select("SELECT * FROM cus_agvtypes")
    List<AgvTypes> findAllTypes();

    /**
     * 保存AGV类型
     */
    @Options(useGeneratedKeys = true, keyProperty = "id")
    @Insert("insert into cus_agvtype(AgvSeries,AgvType,AgvL,AgvW,AgvH,IsUse,DefaultSpeed,MaxAcceleration,AgvFH,MaxLoad," +
            "chargeType,MaxAngSpeed,MaxAngAcceleration,DefaultLoadSpeed,DefaultLoadAcceleration,CreateTime,UpdateTime)" +
            " values (#{agvSeries},#{agvType},#{agvL},#{agvW},#{agvH},#{isUse},#{defaultSpeed},#{maxAcceleration}," +
            "#{agvFH},#{maxLoad},#{chargeType},#{maxAngSpeed},#{maxAngAcceleration},#{defaultLoadSpeed},#{defaultLoadAcceleration},#{createTime},#{updateTime})")
    void save(AgvType agvType);

    /**
     * 根据ID查询AGV
     */
    @Select("SELECT * FROM cus_agvtype where id = #{id}")
    AgvType getById(Integer id);

    /**
     * 更新AGV
     */
    @Update("UPDATE cus_agvtype SET AgvSeries=#{agvSeries},AgvType=#{agvType},AgvL=#{agvL},AgvW=#{agvW},AgvH=#{agvH}," +
            "IsUse=#{isUse},DefaultSpeed=#{defaultSpeed},MaxAcceleration=#{maxAcceleration},AgvFH=#{agvFH},MaxLoad=#{maxLoad}," +
            "chargeType=#{chargeType},MaxAngSpeed=#{maxAngSpeed},MaxAngAcceleration=#{maxAngAcceleration}," +
            "DefaultLoadSpeed=#{defaultLoadSpeed},DefaultLoadAcceleration=#{defaultLoadAcceleration},UpdateTime=#{updateTime} " +
            "WHERE id = #{id}")
    void updateById(AgvType agvType);

    /**
     * 根据ID删除AGV
     */
    @Delete("DELETE FROM cus_agvtype WHERE id = #{id}")
    void deleteById(Integer id);
}
