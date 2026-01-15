package com.aj.web.services;

import com.aj.web.pojo.AgvSeries;
import com.aj.web.pojo.AgvType;
import com.aj.web.pojo.AgvTypes;

import java.util.List;

/***
 *@title AGVService
 *@description <TODO description class purpose>
 *@author Chuck
 *@version 1.0.0
 *@create 2026/1/14 15:53
 *@mail beier33@163.com
 **/
public interface AgvService {
    /**
     * 查询所有AGV类型
     */
    List<AgvType> findAll();

    List<AgvSeries> findAllSeries();

    List<AgvTypes> findAllTypes();

    void save(AgvType agvType);

    AgvType getById(Integer id);

    void update(AgvType agvType);

    void delete(Integer id);
}
