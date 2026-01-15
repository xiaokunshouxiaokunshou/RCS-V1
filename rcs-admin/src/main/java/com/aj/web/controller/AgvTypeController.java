package com.aj.web.controller;

import com.aj.web.pojo.AgvType;
import com.aj.web.pojo.Result;
import com.aj.web.services.AgvService;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/***
 *@title AgvTypeController
 *@description <TODO description class purpose>
 *@author Chuck
 *@version 1.0.0
 *@create 2026/1/14 16:09
 *@mail beier33@163.com
 **/
@RestController
@RequestMapping("/agvtype")
@Slf4j
public class AgvTypeController {
    @Autowired
    private AgvService agvService;

    /**
     * 查询所有AGV类型
     */
    @GetMapping
    public Result list(){
        log.info("查询所有AGV类型");
        List<AgvType> agvTypeList = agvService.findAll();
        return Result.success(agvTypeList);
    }

    @PostMapping
    public Result save(@RequestBody AgvType agvType)
    {
        log.info("保存AGV类型,{}",agvType);
        agvService.save(agvType);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result getById(@PathVariable Integer id)
    {
        log.info("查询id为{}的AGV类型",id);
        AgvType agvType = agvService.getById(id);
        return Result.success(agvType);
    }

    @PutMapping
    public Result update(@RequestBody AgvType agvType)
    {
        log.info("修改AGV类型,{}",agvType);
        agvService.update(agvType);
        return Result.success();
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id)
    {
        log.info("删除id为{}的AGV类型",id);
        agvService.delete(id);
        return Result.success();
    }

}
