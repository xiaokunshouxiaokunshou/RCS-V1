package com.aj.web.controller;

import com.aj.web.pojo.AgvSeries;
import com.aj.web.pojo.AgvType;
import com.aj.web.pojo.Result;
import com.aj.web.services.AgvService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/***
 *@title AgvSeriesController
 *@description <TODO description class purpose>
 *@author Chuck
 *@version 1.0.0
 *@create 2026/1/14 20:50
 *@mail beier33@163.com
 **/
@RestController
@RequestMapping("/agvseries")
public class AgvSeriesController {

    @Autowired
    private AgvService agvService;
    /**
     * 查询所有AGV类型
     */
    @GetMapping
    public Result list(){
        List<AgvSeries> agvSeriesList = agvService.findAllSeries();
        return Result.success(agvSeriesList);
    }
}
