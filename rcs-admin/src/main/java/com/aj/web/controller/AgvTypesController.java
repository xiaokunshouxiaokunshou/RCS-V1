package com.aj.web.controller;

import com.aj.web.pojo.AgvSeries;
import com.aj.web.pojo.AgvType;
import com.aj.web.pojo.AgvTypes;
import com.aj.web.pojo.Result;
import com.aj.web.services.AgvService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/***
 *@title AgvTypesController
 *@description <TODO description class purpose>
 *@author Chuck
 *@version 1.0.0
 *@create 2026/1/14 21:15
 *@mail beier33@163.com
 **/
@RestController
@RequestMapping("/agvtypes")
public class AgvTypesController {

    @Autowired
    private AgvService agvService;
    /**
     * 查询所有AGV类型
     */
    @GetMapping
    public Result list(){

        List<AgvTypes> agvTypeList = agvService.findAllTypes();
        return Result.success(agvTypeList);
    }
}
