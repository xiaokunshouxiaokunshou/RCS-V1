package com.aj.web.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/***
 *@title AgvSeries
 *@description <TODO description class purpose>
 *@author Chuck
 *@version 1.0.0
 *@create 2026/1/14 19:24
 *@mail beier33@163.com
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AgvSeries {
    private Integer id;
    private Integer series;
    private String value;
}
