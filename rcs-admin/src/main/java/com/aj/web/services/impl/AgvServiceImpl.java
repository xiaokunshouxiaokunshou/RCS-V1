package com.aj.web.services.impl;

import com.aj.web.mapper.AgvTypeMapper;
import com.aj.web.pojo.AgvSeries;
import com.aj.web.pojo.AgvType;
import com.aj.web.pojo.AgvTypes;
import com.aj.web.services.AgvService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

/***
 *@title AgvServiceImpl
 *@description <TODO description class purpose>
 *@author Chuck
 *@version 1.0.0
 *@create 2026/1/14 16:09
 *@mail beier33@163.com
 **/
@Service
public class AgvServiceImpl implements AgvService {

    @Autowired
    private AgvTypeMapper agvTypeMapper;

    @Override
    public List<AgvType> findAll() {
        return agvTypeMapper.findAll();
    }

    @Override
    public List<AgvSeries> findAllSeries() {
        return agvTypeMapper.findAllSeries();
    }

    @Override
    public List<AgvTypes> findAllTypes() {
        return agvTypeMapper.findAllTypes();
    }

    @Override
    public void save(AgvType agvType) {
        agvType.setCreateTime(LocalDateTime.now());
        agvType.setUpdateTime(LocalDateTime.now());

        agvTypeMapper.save(agvType);
    }

    @Override
    public AgvType getById(Integer id) {
        return agvTypeMapper.getById(id);
    }

    @Override
    public void update(AgvType agvType) {
        agvType.setUpdateTime(LocalDateTime.now());

        agvTypeMapper.updateById(agvType);
    }

    @Override
    public void delete(Integer id) {
        agvTypeMapper.deleteById( id);
    }


}
