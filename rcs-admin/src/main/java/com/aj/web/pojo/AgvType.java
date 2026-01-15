package com.aj.web.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/***
 *@title AgvType
 *@description <TODO description class purpose>
 *@author Chuck
 *@version 1.0.0
 *@create 2026/1/14 15:54
 *@mail beier33@163.com
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AgvType {
    private Integer id;
    private Integer agvSeries;
    private Integer agvType;
    private Double agvL;
    private Double agvW;
    private Double agvH;
    private Integer isUse;
    private Double defaultSpeed;
    private Double maxAcceleration;
    private Double agvFH;
    private Double maxLoad;
    private Integer chargeType;
    private Double maxAngSpeed;
    private Double maxAngAcceleration;
    private Double defaultLoadSpeed;
    private Double defaultLoadAcceleration;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;

    private String agvTypeStr;
}
