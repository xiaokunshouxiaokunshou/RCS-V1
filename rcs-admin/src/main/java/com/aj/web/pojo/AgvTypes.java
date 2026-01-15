package com.aj.web.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/***
 *@title AgvTypes
 *@description <TODO description class purpose>
 *@author Chuck
 *@version 1.0.0
 *@create 2026/1/14 21:16
 *@mail beier33@163.com
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AgvTypes {
    private Integer id;
    private Integer type;
    private String name;
}
