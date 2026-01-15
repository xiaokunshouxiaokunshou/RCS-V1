-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.7.31 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- 导出  表 agvschdule.base_action 结构
CREATE TABLE IF NOT EXISTS `base_action` (
  `Id` varchar(50) NOT NULL COMMENT '主键',
  `CreatorId` varchar(255) DEFAULT NULL COMMENT '创建人Id',
  `Deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已删除',
  `ParentId` varchar(50) DEFAULT NULL COMMENT '父级Id',
  `Type` int(11) NOT NULL COMMENT '类型,菜单=0,页面=1,权限=2',
  `Name` varchar(255) DEFAULT NULL COMMENT '权限名/菜单名',
  `Url` varchar(255) DEFAULT NULL COMMENT '菜单地址',
  `NeedAction` bit(1) NOT NULL COMMENT '是否需要权限(仅页面有效)',
  `Icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `Sort` int(11) NOT NULL COMMENT '排序',
  `Value` varchar(255) DEFAULT NULL COMMENT '权限值',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统权限表';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.base_agvtypecmd 结构
CREATE TABLE IF NOT EXISTS `base_agvtypecmd` (
  `Id` varchar(255) NOT NULL COMMENT '主键',
  `TypeId` varchar(255) NOT NULL COMMENT '类型主键',
  `CmdId` varchar(255) NOT NULL COMMENT '指令主键'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='车辆类型关联指令信息';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.base_attach 结构
CREATE TABLE IF NOT EXISTS `base_attach` (
  `Id` varchar(50) NOT NULL COMMENT '主键',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreatorId` varchar(255) DEFAULT NULL COMMENT '创建人Id',
  `FileName` varchar(255) NOT NULL COMMENT '文件名',
  `FilePath` varchar(255) NOT NULL COMMENT '文件路径',
  `IconPath` varchar(255) NOT NULL COMMENT 'Icon',
  `Size` varchar(255) NOT NULL COMMENT '文件大小',
  `Deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文件附件';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.base_config 结构
CREATE TABLE IF NOT EXISTS `base_config` (
  `Id` varchar(50) NOT NULL COMMENT '主键',
  `ParaCode` varchar(255) NOT NULL COMMENT '参数编码',
  `ParaGroup` int(11) NOT NULL COMMENT '参数分类',
  `ParaValueType` int(11) NOT NULL COMMENT '值类型',
  `ParaValue` varchar(255) NOT NULL COMMENT '值',
  `ParaDefalutValue` varchar(255) NOT NULL COMMENT '默认值',
  `ParaUnit` varchar(255) DEFAULT NULL COMMENT '单位',
  `ParaRange` varchar(255) DEFAULT NULL COMMENT '范围',
  `Remark` varchar(255) DEFAULT NULL COMMENT '参数说明',
  `Disable` tinyint(1) DEFAULT NULL COMMENT '弃用',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统配置';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.base_log 结构
CREATE TABLE IF NOT EXISTS `base_log` (
  `LongDate` datetime DEFAULT NULL COMMENT '创建时间',
  `Level` varchar(10) DEFAULT NULL COMMENT '日志级别',
  `Message` longtext COMMENT '日志内容',
  `Exception` longtext COMMENT '异常信息',
  `Logger` varchar(200) DEFAULT NULL COMMENT '发送者',
  `LogContent` longtext COMMENT '日志内容',
  `Id` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统日志表';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.base_role 结构
CREATE TABLE IF NOT EXISTS `base_role` (
  `Id` varchar(50) NOT NULL COMMENT '主键',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreatorId` varchar(255) DEFAULT NULL COMMENT '创建人Id',
  `Deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已删除',
  `RoleName` varchar(255) NOT NULL COMMENT '角色名',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统角色表';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.base_roleaction 结构
CREATE TABLE IF NOT EXISTS `base_roleaction` (
  `Id` varchar(50) NOT NULL COMMENT '主键',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreatorId` varchar(255) DEFAULT NULL COMMENT '创建人Id',
  `Deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已删除',
  `RoleId` varchar(255) NOT NULL COMMENT '用户Id',
  `ActionId` varchar(255) NOT NULL COMMENT '权限Id',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色权限表';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.base_user 结构
CREATE TABLE IF NOT EXISTS `base_user` (
  `Id` varchar(50) NOT NULL COMMENT '主键',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreatorId` varchar(255) DEFAULT NULL COMMENT '创建人Id',
  `Deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已删除',
  `UserName` varchar(255) NOT NULL COMMENT '用户名',
  `Password` varchar(255) NOT NULL COMMENT '密码',
  `RealName` varchar(255) NOT NULL COMMENT '姓名',
  `Sex` int(11) NOT NULL COMMENT '性别',
  `Phone` varchar(255) NOT NULL COMMENT '手机号',
  `Email` varchar(255) NOT NULL COMMENT '邮箱',
  `RoleID` varchar(255) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统用户表';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.base_userlog 结构
CREATE TABLE IF NOT EXISTS `base_userlog` (
  `Id` varchar(50) NOT NULL COMMENT '自然主键',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreatorId` varchar(50) DEFAULT NULL COMMENT '创建人Id',
  `CreatorRealName` varchar(50) DEFAULT NULL COMMENT '创建人姓名',
  `LogType` varchar(50) DEFAULT NULL COMMENT '日志类型',
  `LogContent` longtext COMMENT '日志内容',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统日志表';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.base_version 结构
CREATE TABLE IF NOT EXISTS `base_version` (
  `Id` varchar(50) NOT NULL,
  `VersionCode` varchar(255) NOT NULL COMMENT '版本号',
  `VersionDetails` longtext COMMENT '版本详情',
  `CreateTime` datetime DEFAULT NULL,
  `CreatorId` varchar(255) DEFAULT NULL,
  `Deleted` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统用户表';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_agv 结构
CREATE TABLE IF NOT EXISTS `cus_agv` (
  `Id` varchar(255) NOT NULL COMMENT '主键',
  `mapGroupID` varchar(255) NOT NULL COMMENT '车辆集群ID',
  `AgvType` int(11) NOT NULL COMMENT '车型',
  `Name` varchar(255) NOT NULL COMMENT '名称',
  `comMode` int(11) NOT NULL COMMENT '通讯类型',
  `comAddress` varchar(255) NOT NULL COMMENT '通讯地址(IP:Port)',
  `machineCode` varchar(255) NOT NULL COMMENT '设备编码',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `NavigateMode` int(11) NOT NULL COMMENT '导航方式   0',
  `ControllerType` int(11) NOT NULL COMMENT '控制器类型',
  `IsUse` tinyint(1) NOT NULL COMMENT '是否启用',
  `ControllerVersion` varchar(255) NOT NULL COMMENT '控制器版本',
  `agvColor` varchar(255) DEFAULT NULL COMMENT '车辆颜色',
  `OfflineCode` varchar(255) DEFAULT NULL COMMENT '下线位置记录',
  `SerialNum` int(11) NOT NULL COMMENT '序号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='AGV类型';

-- 导出  表 rcsv1.cus_agv 结构
CREATE TABLE IF NOT EXISTS `cus_agvtype` (
  `Id` varchar(255) NOT NULL COMMENT '主键',
  `AgvSeries` int(11) NOT NULL COMMENT '系列',  
  `AgvType` int(11) NOT NULL COMMENT '车型',
  `AgvL` double NOT NULL COMMENT '车长，单位mm',
  `AgvW` double NOT NULL COMMENT '车宽，单位mm',
  `AgvH` double NOT NULL COMMENT '车高，单位mm',
  `IsUse` tinyint(1) NOT NULL COMMENT '是否启用',
  `DefaultSpeed` double NOT NULL COMMENT '默认速度(mm/s)',
  `MaxAcceleration` double NOT NULL COMMENT '最大加速度(mm/s²)',
  `AgvFH` double NOT NULL COMMENT '车离地间隙，单位mm',
  `MaxLoad` double NOT NULL COMMENT '最大载重，单位kg',
  `chargeType` int(2) NOT NULL COMMENT '充电类型',
  `MaxAngSpeed` double NOT NULL COMMENT '最大旋转速度(°/s)',
  `MaxAngAcceleration` double NOT NULL COMMENT '最大旋转角加速度(°/s)',  
  `DefaultLoadSpeed` double NOT NULL COMMENT '默认满载速度(mm/s)',
  `DefaultLoadAcceleration` double NOT NULL COMMENT '默认满载加速度(mm/s²)',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `UpdateTime` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='AGV类型';

-- 导出  表 rcsv1.cus_agvseries 结构
CREATE TABLE IF NOT EXISTS `cus_agvseries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `series` int(11) unsigned DEFAULT NULL,
  `value` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='agv系列';

-- 导出  表 rcsv1.cus_agvtypes 结构
CREATE TABLE IF NOT EXISTS `cus_agvtypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `seriesid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='agv类型';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_agvheartconfig 结构
CREATE TABLE IF NOT EXISTS `cus_agvheartconfig` (
  `Id` varchar(255) NOT NULL COMMENT '主键',
  `ConfigCode` varchar(255) NOT NULL COMMENT '配置名称',
  `ConfigValue` varchar(255) NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='心跳配置';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_agv_chargeinfo 结构
CREATE TABLE IF NOT EXISTS `cus_agv_chargeinfo` (
  `Id` varchar(255) NOT NULL COMMENT '主键',
  `mapCode` varchar(255) NOT NULL COMMENT '地图编码',
  `taskCode` varchar(255) NOT NULL COMMENT '任务编码',
  `agvCode` varchar(255) NOT NULL COMMENT '车辆编码',
  `startTime` datetime DEFAULT NULL COMMENT '开始时间',
  `endTime` datetime DEFAULT NULL COMMENT '结束时间',
  `startBatteryLevel` double DEFAULT NULL COMMENT '起始电量',
  `endBatteryLevel` double DEFAULT NULL COMMENT '结束电量',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='AGV充电信息';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_agv_heatmap 结构
CREATE TABLE IF NOT EXISTS `cus_agv_heatmap` (
  `Id` varchar(255) NOT NULL COMMENT '主键',
  `mapCode` varchar(255) NOT NULL COMMENT '地图编码',
  `pointCode` varchar(255) NOT NULL COMMENT '点编码',
  `Count` int(11) NOT NULL COMMENT '经过次数',
  `agvCode` varchar(255) NOT NULL COMMENT 'agv编码',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='点经过次数';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_agv_heatmappoint 结构
CREATE TABLE IF NOT EXISTS `cus_agv_heatmappoint` (
  `Id` varchar(255) NOT NULL COMMENT '主键',
  `mapCode` varchar(255) NOT NULL COMMENT '地图编码',
  `currentPCode` varchar(255) NOT NULL COMMENT '点编码',
  `agvCode` varchar(255) NOT NULL COMMENT '车辆编码',
  `CreateTime` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='车辆点位统计';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_agv_odometer 结构
CREATE TABLE IF NOT EXISTS `cus_agv_odometer` (
  `Id` varchar(255) NOT NULL COMMENT '主键',
  `mapCode` varchar(255) NOT NULL COMMENT '地图编码',
  `taskCode` varchar(255) NOT NULL COMMENT '任务编码',
  `agvCode` varchar(255) NOT NULL COMMENT '车辆编码',
  `distance` double NOT NULL COMMENT '移动距离 米',
  `startPCode` varchar(255) NOT NULL COMMENT '起始点编码',
  `endPCode` varchar(255) NOT NULL COMMENT '目的点编码',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='AGV里程计';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_alarm 结构
CREATE TABLE IF NOT EXISTS `cus_alarm` (
  `Id` varchar(50) NOT NULL COMMENT '主键',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreatorId` varchar(255) DEFAULT NULL COMMENT '创建人Id',
  `Deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已删除',
  `state` int(11) NOT NULL COMMENT '状态（0：告警中 1：已处理）',
  `EndTime` datetime DEFAULT NULL COMMENT '告警结束时间',
  `templateCode` varchar(255) NOT NULL COMMENT '模板Code',
  `originCode` varchar(255) DEFAULT NULL COMMENT '告警来源标识',
  `mapCode` varchar(255) DEFAULT NULL COMMENT '地图Code',
  `XCoordinate` double DEFAULT NULL COMMENT '告警位置X',
  `YCoordinate` double DEFAULT NULL COMMENT '告警位置Y',
  `Remark` longtext COMMENT '详情',
  `StoreyName` varchar(255) DEFAULT NULL COMMENT '告警所在楼层',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='告警信息';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_alarmtemplate 结构
CREATE TABLE IF NOT EXISTS `cus_alarmtemplate` (
  `Id` varchar(50) NOT NULL COMMENT '主键',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreatorId` varchar(255) DEFAULT NULL,
  `Deleted` bit(1) NOT NULL,
  `typeID` varchar(255) NOT NULL COMMENT '告警主类型',
  `code` varchar(255) NOT NULL COMMENT '编号',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `category` int(11) NOT NULL COMMENT '分类 （0：故障告警 1：日志告警 2：普通告警）',
  `remark` varchar(255) DEFAULT NULL COMMENT '描述',
  `treatment` varchar(255) DEFAULT NULL COMMENT '处理方式',
  `errorCode` int(11) DEFAULT NULL COMMENT '故障类型',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='告警模板信息';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_alarmtype 结构
CREATE TABLE IF NOT EXISTS `cus_alarmtype` (
  `Id` varchar(50) NOT NULL COMMENT '主键',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreatorId` varchar(255) DEFAULT NULL,
  `Deleted` bit(1) NOT NULL,
  `model` int(11) NOT NULL COMMENT '告警模块 0:设备 1:服务器',
  `code` varchar(255) NOT NULL COMMENT '编号',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='告警主类型';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_autodoor 结构
CREATE TABLE IF NOT EXISTS `cus_autodoor` (
  `Id` varchar(255) NOT NULL COMMENT '主键',
  `Code` varchar(255) NOT NULL COMMENT '编号',
  `IP` varchar(255) NOT NULL COMMENT 'IP',
  `Port` int(11) NOT NULL COMMENT '端口',
  `Name` varchar(255) NOT NULL COMMENT '名称',
  `Type` int(11) NOT NULL COMMENT '自动门类型',
  `IsEnable` bit(1) NOT NULL COMMENT '是否启用',
  `MapId` varchar(255) NOT NULL COMMENT '地图ID',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `OpenDoorComIndex` int(11) NOT NULL COMMENT '开门信号引脚序号',
  `DoorOpenStateComIndex` int(11) NOT NULL COMMENT '自动门开启状态引脚',
  `StationNO` tinyint(4) NOT NULL COMMENT '站号',
  `IsCheckOpenState` tinyint(1) NOT NULL COMMENT '开门到位检测',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='自动门';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_caller 结构
CREATE TABLE IF NOT EXISTS `cus_caller` (
  `Id` varchar(255) NOT NULL COMMENT '主键',
  `Code` varchar(255) NOT NULL COMMENT '编号',
  `IP` varchar(255) NOT NULL COMMENT 'IP',
  `Port` int(11) NOT NULL COMMENT '端口',
  `Name` varchar(255) NOT NULL COMMENT '名称',
  `Btn1TaskPara` longtext COMMENT '按钮1任务参数',
  `Btn2TaskPara` longtext COMMENT '按钮2任务参数',
  `Btn3TaskPara` longtext COMMENT '按钮3任务参数',
  `Btn4TaskPara` longtext COMMENT '按钮4任务参数',
  `IsEnable` bit(1) NOT NULL COMMENT '是否启用',
  `GroupId` varchar(255) NOT NULL COMMENT '分组ID',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='呼叫器';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_callergroup 结构
CREATE TABLE IF NOT EXISTS `cus_callergroup` (
  `Id` varchar(255) NOT NULL COMMENT '主键',
  `Code` varchar(255) NOT NULL COMMENT '编号',
  `Name` varchar(255) NOT NULL COMMENT '名称',
  `Type` int(11) NOT NULL COMMENT '呼叫器类型',
  `Btn1TaskCode` varchar(255) NOT NULL COMMENT '按钮1任务',
  `Btn2TaskCode` varchar(255) NOT NULL COMMENT '按钮2任务',
  `Btn3TaskCode` varchar(255) NOT NULL COMMENT '按钮3任务',
  `Btn4TaskCode` varchar(255) NOT NULL COMMENT '按钮4任务',
  `TaskAgvGroup` varchar(255) DEFAULT NULL COMMENT '车辆分组',
  `MapId` varchar(255) NOT NULL COMMENT '地图ID',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `Btn1TaskType` int(11) NOT NULL COMMENT '按钮1任务类型',
  `Btn2TaskType` int(11) NOT NULL COMMENT '按钮2任务类型',
  `Btn3TaskType` int(11) NOT NULL COMMENT '按钮3任务类型',
  `Btn4TaskType` int(11) NOT NULL COMMENT '按钮4任务类型',
  `TaskAgvCode` varchar(255) DEFAULT NULL COMMENT '车辆编码',
  `Version` int(11) NOT NULL COMMENT '兼容旧数据',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='呼叫器分组';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_callergroupinfo 结构
CREATE TABLE IF NOT EXISTS `cus_callergroupinfo` (
  `Id` varchar(255) NOT NULL COMMENT '主键',
  `BtnTaskType` int(11) NOT NULL COMMENT '按钮任务类型',
  `BtnTaskCode` varchar(255) NOT NULL COMMENT '任务Code',
  `BtnCallerTaskName` varchar(255) NOT NULL COMMENT '移动端按钮任务名称',
  `GroupId` varchar(255) NOT NULL COMMENT '分组ID',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='呼叫器分组详情';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_callerinfo 结构
CREATE TABLE IF NOT EXISTS `cus_callerinfo` (
  `Id` varchar(255) NOT NULL COMMENT '主键',
  `CallerId` varchar(255) NOT NULL COMMENT '呼叫器Id',
  `CallerGroupInfoId` varchar(255) NOT NULL COMMENT '呼叫器分组任务Id',
  `BtnTaskCode` varchar(255) NOT NULL COMMENT '按钮任务',
  `BtnTaskPara` longtext COMMENT '呼叫器任务参数',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='呼叫器详细信息';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_container 结构
CREATE TABLE IF NOT EXISTS `cus_container` (
  `Id` varchar(50) NOT NULL COMMENT '主键',
  `Code` varchar(255) NOT NULL COMMENT '编码',
  `ContainerType` varchar(255) NOT NULL COMMENT '容器类型',
  `Length` decimal(13,3) DEFAULT NULL COMMENT '长',
  `Width` decimal(13,3) DEFAULT NULL COMMENT '宽',
  `Height` decimal(13,3) DEFAULT NULL COMMENT '高',
  `IsEnabled` int(1) DEFAULT NULL COMMENT '是否可用 1可用0禁用',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreatorId` varchar(255) DEFAULT NULL COMMENT '创建人Id',
  `Deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='容器表';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_devicemap 结构
CREATE TABLE IF NOT EXISTS `cus_devicemap` (
  `Id` varchar(255) NOT NULL COMMENT '主键',
  `DeviceMapCode` varchar(255) NOT NULL COMMENT 'Device地图code',
  `DeviceMapPath` varchar(255) NOT NULL COMMENT '地图路径',
  `Type` varchar(255) NOT NULL COMMENT 'Device地图x坐标',
  `Remark` varchar(255) NOT NULL COMMENT 'Device地图y坐标',
  `Size` varchar(255) DEFAULT NULL COMMENT '地图大小',
  `Url` varchar(255) NOT NULL COMMENT '地图地址',
  `Width` double NOT NULL COMMENT '图片宽度',
  `Height` double NOT NULL COMMENT '图片高度',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='DeviceMap信息';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_devicepointmap 结构
CREATE TABLE IF NOT EXISTS `cus_devicepointmap` (
  `Id` varchar(255) NOT NULL COMMENT '主键',
  `StoreyId` varchar(255) NOT NULL COMMENT '楼层ID',
  `X` double NOT NULL COMMENT 'X',
  `Y` double NOT NULL COMMENT 'Y',
  `Width` double NOT NULL COMMENT '宽',
  `Height` double NOT NULL COMMENT '高',
  `ImageUrl` varchar(255) NOT NULL COMMENT '图片路径',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Cus_DevicePointMap信息';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_homeconfig 结构
CREATE TABLE IF NOT EXISTS `cus_homeconfig` (
  `Id` int(11) NOT NULL,
  `Ext1` varchar(255) DEFAULT NULL,
  `Ext2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='首页配置';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_homeconfigitem 结构
CREATE TABLE IF NOT EXISTS `cus_homeconfigitem` (
  `Id` varchar(255) NOT NULL,
  `HomeConfigId` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='配置项';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_lift 结构
CREATE TABLE IF NOT EXISTS `cus_lift` (
  `Id` varchar(255) NOT NULL COMMENT '主键',
  `LiftNumber` varchar(255) NOT NULL COMMENT '电梯编号',
  `IP` varchar(255) NOT NULL COMMENT 'IP',
  `Port` int(11) NOT NULL COMMENT '端口',
  `Name` varchar(255) NOT NULL COMMENT '电梯名称',
  `IsAcrossFloors` bit(1) DEFAULT NULL COMMENT '是否跨越楼层',
  `IsEnable` bit(1) NOT NULL COMMENT '是否启用',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `LiftType` int(11) NOT NULL COMMENT '电梯类型',
  `ComMode` int(11) NOT NULL COMMENT '通讯类型',
  `MapId` varchar(255) NOT NULL COMMENT '是否启用',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='电梯';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_liftinfo 结构
CREATE TABLE IF NOT EXISTS `cus_liftinfo` (
  `Id` varchar(255) NOT NULL COMMENT 'Id',
  `LiftId` varchar(255) NOT NULL COMMENT '关联电梯编号',
  `StroeyId` varchar(255) NOT NULL COMMENT '楼层Id',
  `StoreyIsEnable` bit(1) NOT NULL COMMENT '楼层是否可用',
  `LiftCode` varchar(255) NOT NULL COMMENT '电梯点',
  `OpenCode` varchar(255) NOT NULL COMMENT '开门点',
  `CloseCode` varchar(255) NOT NULL COMMENT '关门点',
  `StroeyNum` int(11) NOT NULL COMMENT '楼层编号和电梯楼层关系一致',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='电梯详情';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_map 结构
CREATE TABLE IF NOT EXISTS `cus_map` (
  `Id` varchar(50) NOT NULL COMMENT '主键',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreatorId` varchar(255) DEFAULT NULL COMMENT '创建人Id',
  `Deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已删除',
  `Code` varchar(255) NOT NULL COMMENT '编码',
  `Name` varchar(255) NOT NULL COMMENT '地图名称',
  `Slam` varchar(255) DEFAULT NULL COMMENT 'Slam相关',
  `pointsInfo` longtext COMMENT '点信息',
  `linesInfo` longtext COMMENT '线信息',
  `rowNum` int(11) NOT NULL COMMENT '行数',
  `columnNum` int(11) NOT NULL COMMENT '列数',
  `lengthPerGrid` double NOT NULL COMMENT '每格长度',
  `widthPerGrid` double NOT NULL COMMENT '每格宽度',
  `MaxTaskCatchNum` int(11) NOT NULL COMMENT '最大任务缓存数',
  `NavigateMode` int(11) NOT NULL COMMENT '地图导航类型',
  `DelayMapRun` int(11) NOT NULL COMMENT '车辆未全部上线时地图延时启动时间 单位ms,默认值20000,值为0时，不自动启动',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='地图表';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_mapagvgroup 结构
CREATE TABLE IF NOT EXISTS `cus_mapagvgroup` (
  `Id` varchar(255) NOT NULL COMMENT '主键',
  `Name` varchar(255) NOT NULL COMMENT '分区名称',
  `Code` varchar(255) NOT NULL COMMENT '编码',
  `MaxTaskCatchNum` int(11) NOT NULL COMMENT '最大任务缓存数,最小值为1\n            可以认为这就是每种车型的任务缓存数量，不然每种车型在设置一遍非常麻烦',
  `MapId` varchar(255) NOT NULL COMMENT '地图Id',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='地图车辆集群';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_mapagvgroupchargeconfig 结构
CREATE TABLE IF NOT EXISTS `cus_mapagvgroupchargeconfig` (
  `Id` varchar(255) NOT NULL,
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `MinNeedChargeElectricity` double NOT NULL COMMENT '最低充电剩余电量  电量低于该阙值，AGV 必须去充电点充电',
  `MaxNeedChargeElectricity` double NOT NULL COMMENT '空闲充电剩余电量   空闲情况中，AGV 电量低于该阙值去充电此数值大于参数 1',
  `MaxNeedChargeFreeAGVPercent` int(11) NOT NULL COMMENT '车辆空闲比 空闲状态判定条件，AGV 整体空闲率大于此数值，定义为空闲状态',
  `MinChargeElectricity` double NOT NULL COMMENT '最低充电电量，AGV 最低充电电量阙值，当繁忙状态时车辆冲电到此阙值，即结束充由',
  `WaitTaskNumber` int(11) NOT NULL COMMENT '当等待开始的任务数量大于这一数值的时候才会执行最少充电电量的策略',
  `AgvType` int(11) NOT NULL COMMENT 'agv车型',
  `groupID` varchar(255) NOT NULL COMMENT '集群ID',
  `MaxChargeElectricity` double NOT NULL COMMENT '充电结束电量 正常情况下 AGV 充电到此阙值即结束充电(一般设置 100%)',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='地图集群-充电策略配置';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_mapagvtype 结构
CREATE TABLE IF NOT EXISTS `cus_mapagvtype` (
  `Id` varchar(255) NOT NULL COMMENT '主键',
  `AgvTypeCode` int(11) NOT NULL COMMENT 'AGV车型',
  `AgvTypeName` varchar(255) NOT NULL COMMENT 'AGV车型名称',
  `DefaultSpeed` double NOT NULL COMMENT '默认速度(mm/s)',
  `DefaultAcceleration` double NOT NULL COMMENT '默认加速度(mm/s²)',
  `DefaultAngSpeed` double NOT NULL COMMENT '默认旋转速度(°/s)',
  `DefaultAngAccSpeed` double NOT NULL COMMENT '默认旋转角加速度(°/s²)',
  `MapId` varchar(255) NOT NULL COMMENT '地图Id',
  `DefaultLostDuration` int(11) NOT NULL COMMENT '默认失联延时(s)',
  `DefaultBreakDuration` int(11) NOT NULL COMMENT '默认掉线延时(s)',
  `DefaultProDistanceL` double NOT NULL COMMENT '默认保护距离 (车长)，单位mm',
  `DefaultProDistanceW` double NOT NULL COMMENT '默认保护距离 (车宽)，单位mm',
  `DefaultLoadSpeed` double NOT NULL COMMENT '默认满载速度(mm/s)',
  `DefaultLoadAcceleration` double NOT NULL COMMENT '默认满载加速度(mm/s²)',
  `CheckCrossDINo` varchar(255) DEFAULT NULL COMMENT '通行按钮DI序号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='地图准入车型';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_maparea 结构
CREATE TABLE IF NOT EXISTS `cus_maparea` (
  `Id` varchar(255) NOT NULL COMMENT 'Id',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `code` varchar(255) NOT NULL COMMENT '编码',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `mapID` varchar(255) NOT NULL COMMENT '地图ID',
  `BGColor` varchar(255) NOT NULL COMMENT '区域颜色',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='地图-区域';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_mapareadescriptors 结构
CREATE TABLE IF NOT EXISTS `cus_mapareadescriptors` (
  `Id` varchar(255) NOT NULL COMMENT '主键',
  `RegionalText` varchar(255) NOT NULL COMMENT '区域名称',
  `StoreyId` varchar(255) NOT NULL COMMENT '楼层id',
  `Width` double NOT NULL COMMENT '宽',
  `Height` double NOT NULL COMMENT '高',
  `X` double NOT NULL COMMENT 'X坐标',
  `Y` double NOT NULL COMMENT 'Y坐标',
  `Color` varchar(255) NOT NULL COMMENT '颜色',
  `FontSize` double NOT NULL COMMENT '字体尺寸',
  `FontWeight` double NOT NULL COMMENT '字体粗细',
  `LevelText` varchar(255) NOT NULL COMMENT '水平',
  `VerticalText` varchar(255) NOT NULL COMMENT '垂直',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='地图区域描述';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_mapareapoint 结构
CREATE TABLE IF NOT EXISTS `cus_mapareapoint` (
  `Id` varchar(255) NOT NULL COMMENT 'Id',
  `code` varchar(255) NOT NULL COMMENT '点编码',
  `areaId` varchar(255) NOT NULL COMMENT '区域ID',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='区域-路径点';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_mapareastrategy 结构
CREATE TABLE IF NOT EXISTS `cus_mapareastrategy` (
  `Id` varchar(255) NOT NULL COMMENT 'Id',
  `StrategyType` int(11) NOT NULL COMMENT '策略类型',
  `Content` varchar(255) NOT NULL COMMENT '策略内容',
  `areaId` varchar(255) NOT NULL COMMENT '区域ID',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='区域-策略';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_mapchargeconfig 结构
CREATE TABLE IF NOT EXISTS `cus_mapchargeconfig` (
  `Id` varchar(255) NOT NULL,
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `MinNeedChargeElectricity` double NOT NULL COMMENT '最低充电剩余电量  电量低于该阙值，AGV 必须去充电点充电',
  `MaxNeedChargeElectricity` double NOT NULL COMMENT '空闲充电剩余电量   空闲情况中，AGV 电量低于该阙值去充电此数值大于参数 1',
  `MaxNeedChargeFreeAGVPercent` int(11) NOT NULL COMMENT '车辆空闲比 空闲状态判定条件，AGV 整体空闲率大于此数值，定义为空闲状态',
  `MinChargeElectricity` double NOT NULL COMMENT '最低充电电量 AGV 最低充电电量阙值，当繁忙状态时车辆冲电到此阙值，即结束充由',
  `WaitTaskNumber` int(11) NOT NULL COMMENT '当等待开始的任务数量大于这一数值的时候才会执行最少充电电量的策略',
  `AgvType` int(11) NOT NULL COMMENT 'agv车型',
  `mapID` varchar(255) NOT NULL COMMENT '地图ID',
  `MaxChargeElectricity` double NOT NULL COMMENT '充电结束电量 正常情况下 AGV 充电到此阙值即结束充电(一般设置 100%)',
  `EnableStartTime` datetime DEFAULT NULL COMMENT '允许充电起始时间',
  `EnableEndTime` datetime DEFAULT NULL COMMENT '允许充电结束时间',
  `FullChargePeriod` int(11) NOT NULL COMMENT '满充周期',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='地图-充电策略配置';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_mapchargestation 结构
CREATE TABLE IF NOT EXISTS `cus_mapchargestation` (
  `Id` varchar(255) NOT NULL,
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `Code` varchar(255) NOT NULL COMMENT '设备编码',
  `Name` varchar(255) NOT NULL COMMENT '名称',
  `IP` varchar(255) NOT NULL COMMENT 'IP',
  `Port` varchar(255) NOT NULL COMMENT '端口',
  `ChargePoint` varchar(255) NOT NULL COMMENT '地图充电点',
  `Remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `MapID` varchar(255) NOT NULL COMMENT '地图ID',
  `Type` int(11) NOT NULL COMMENT '类型',
  `IsConnectedToRcs` tinyint(1) NOT NULL COMMENT '是否与rcs交互 true是',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='地图-充电桩';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_mapconfig 结构
CREATE TABLE IF NOT EXISTS `cus_mapconfig` (
  `Id` varchar(255) NOT NULL,
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `MaxAssigningTaskNumber` int(11) NOT NULL COMMENT '同时可处理的最大任务请求数 范围0~20',
  `MaxTaskNumberInOneThread` int(11) NOT NULL COMMENT '在一个任务管理线程中，可以处理的最大任务数量 范围0~20',
  `FinishTaskWaitTime` int(11) NOT NULL COMMENT '任务完成后等带重新调度的时间 ，超过这个时间没有任务，就使用空闲任务调用 到等待位置 单位毫秒',
  `AGVOffLineAutoClear` bit(1) NOT NULL COMMENT 'AGV下线后自动清除位置',
  `OffLineAutoClearTime` int(11) NOT NULL COMMENT 'AGV下线后自动清除位置延时时间 单位s',
  `MaxPointBufferCount` longtext COMMENT '针对不同的车型 ，配置不同的最大点缓冲数量  最大10',
  `mapID` varchar(255) NOT NULL COMMENT '地图ID',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='地图-配置';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_maplineinfo 结构
CREATE TABLE IF NOT EXISTS `cus_maplineinfo` (
  `Id` varchar(255) NOT NULL COMMENT '主键',
  `startId` varchar(255) NOT NULL COMMENT '起点',
  `endId` varchar(255) NOT NULL COMMENT '终点',
  `lineId` varchar(255) DEFAULT NULL,
  `startPos` varchar(255) DEFAULT NULL COMMENT '起点坐标信息',
  `endPos` varchar(255) DEFAULT NULL COMMENT '终点坐标信息',
  `storeyId` varchar(255) NOT NULL,
  `Direction` int(11) DEFAULT NULL COMMENT '行驶方向',
  `JackAngle` double DEFAULT NULL COMMENT '托盘角度',
  `Pointofstroke1Id` varchar(255) NOT NULL COMMENT '起点',
  `Pointofstroke2Id` varchar(255) NOT NULL COMMENT '终点',
  `Pointofstroke1` varchar(255) DEFAULT NULL COMMENT '锚点信息',
  `Pointofstroke2` varchar(255) DEFAULT NULL COMMENT '锚点信息',
  `LineType` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='地图点信息';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_maplocation 结构
CREATE TABLE IF NOT EXISTS `cus_maplocation` (
  `Id` varchar(50) NOT NULL,
  `LocationNo` varchar(255) NOT NULL COMMENT '库位编码',
  `Status` int(11) NOT NULL COMMENT '占用状态',
  `PointId` varchar(255) NOT NULL COMMENT '点 主键',
  `Row` int(11) NOT NULL COMMENT '排',
  `Bay` int(11) NOT NULL COMMENT '列',
  `Level` int(11) NOT NULL COMMENT '层',
  `Depth` int(11) NOT NULL COMMENT '深度',
  `CreateTime` datetime DEFAULT NULL,
  `CreatorId` varchar(255) DEFAULT NULL,
  `Deleted` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='库位';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_mappath 结构
CREATE TABLE IF NOT EXISTS `cus_mappath` (
  `Id` varchar(255) NOT NULL COMMENT '主键',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `code` varchar(255) NOT NULL COMMENT '编码',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `mapID` varchar(255) NOT NULL COMMENT '地图ID',
  `BGColor` varchar(255) DEFAULT NULL COMMENT '线路颜色',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='地图-路径';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_mappathpoint 结构
CREATE TABLE IF NOT EXISTS `cus_mappathpoint` (
  `Id` varchar(255) NOT NULL COMMENT '点Id',
  `code` varchar(255) NOT NULL COMMENT '点编码',
  `posX` double NOT NULL COMMENT 'X',
  `posY` double NOT NULL COMMENT 'Y',
  `order` int(11) NOT NULL COMMENT '顺序',
  `pathId` varchar(255) NOT NULL COMMENT '路径ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='地图-路径点';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_mappointinfo 结构
CREATE TABLE IF NOT EXISTS `cus_mappointinfo` (
  `Id` varchar(255) NOT NULL COMMENT '点ID 自动生成',
  `code` varchar(255) NOT NULL COMMENT '编号,这个应该可以自定义字符串',
  `type` int(11) NOT NULL COMMENT '类型',
  `QRCode` varchar(255) NOT NULL COMMENT '二维码编号 ,对于激光地图虚拟二维码编码 实现统一  这个只用于与AGV小车交互的位置更新',
  `Xpos` double NOT NULL COMMENT 'X坐标',
  `Ypos` double NOT NULL COMMENT 'Y坐标',
  `accessModels` varchar(255) NOT NULL COMMENT '准入车型',
  `isStay` bit(1) NOT NULL COMMENT '暂住属性',
  `isBodyRotation` tinyint(1) NOT NULL COMMENT '允许旋转',
  `angularCorrection` double NOT NULL COMMENT '角度修正',
  `XbiasCorrection` double NOT NULL COMMENT 'X偏差修正',
  `YbiasCorrection` double NOT NULL COMMENT 'Y偏差修正',
  `pointDirection` double NOT NULL COMMENT '点方向',
  `whetherOnline` bit(1) NOT NULL COMMENT '是否允许上线',
  `isSyncCoordinate` bit(1) NOT NULL COMMENT '二维码是否同步坐标',
  `itemType` varchar(255) NOT NULL COMMENT '点类型',
  `IsSpeed` bit(1) DEFAULT NULL COMMENT '是否限速',
  `MaxSpeed` double DEFAULT NULL COMMENT '最大速度',
  `MaxAcceleration` double DEFAULT NULL COMMENT '最大加速度',
  `ProtectDistance` int(11) DEFAULT NULL COMMENT '前雷达防护',
  `pointId` varchar(255) NOT NULL COMMENT '点ID',
  `storeyId` varchar(255) NOT NULL COMMENT '楼层ID',
  `PeripheralCode` varchar(255) DEFAULT NULL COMMENT '外设Code',
  `ProtectDistanceAfter` int(11) DEFAULT NULL COMMENT '后雷达防护',
  `MillimeterWave1` double DEFAULT NULL COMMENT '毫米波雷达1',
  `MillimeterWave2` double DEFAULT NULL COMMENT '毫米波雷达2',
  `MillimeterWave3` double DEFAULT NULL COMMENT '毫米波雷达3',
  `MillimeterWave4` double DEFAULT NULL COMMENT '毫米波雷达4',
  `NavigatType` int(11) DEFAULT NULL COMMENT '导航方式 0:默认导航，1:二维码导航，2:激光导航',
  `Xpos2` double NOT NULL COMMENT 'X坐标(混导)',
  `Ypos2` double NOT NULL COMMENT 'Y坐标(混导)',
  `IsSwitchMap` bit(1) NOT NULL COMMENT '是否切换地图',
  `IsMixing` bit(1) NOT NULL COMMENT '是否启用混合导航',
  `Recognize` int(11) NOT NULL COMMENT '料腿识别模式  0不开启识别  1取货放货都识别  2取货识别，放货不识别',
  `WaitTime` int(11) NOT NULL COMMENT '等待延时(S)',
  `TrayDirectional` bit(1) DEFAULT NULL COMMENT '顶升定向',
  `MaxLoadSpeed` double DEFAULT NULL COMMENT '最大负载速度',
  `MaxLoadAcceleration` double DEFAULT NULL COMMENT '最大负载加速度',
  `ConfigurationModelRotate` varchar(255) DEFAULT NULL COMMENT '不可旋转车型',
  `AgvGroupCode` varchar(255) DEFAULT NULL COMMENT '集群编码',
  `AgvCode` varchar(255) DEFAULT NULL COMMENT '车辆编码',
  `IsCheckCross` tinyint(1) DEFAULT NULL COMMENT '启用通行验证',
  `ApptCharge` varchar(255) DEFAULT NULL COMMENT '20241225预约充电车辆',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='地图点信息';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_mappublictmcarea 结构
CREATE TABLE IF NOT EXISTS `cus_mappublictmcarea` (
  `Id` varchar(255) NOT NULL COMMENT 'Id',
  `Code` varchar(255) NOT NULL COMMENT '编码',
  `Name` varchar(255) NOT NULL COMMENT '名称',
  `MapID` varchar(255) NOT NULL COMMENT '地图ID',
  `BGColor` varchar(255) NOT NULL COMMENT '区域颜色',
  `IsEnable` tinyint(1) NOT NULL COMMENT '是否启用',
  `Remark` varchar(255) NOT NULL COMMENT '备注',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `SystemId` varchar(255) NOT NULL COMMENT '第三方对接系统ID',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='240927公共交管区域';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_mappublictmcareapoint 结构
CREATE TABLE IF NOT EXISTS `cus_mappublictmcareapoint` (
  `Id` varchar(255) NOT NULL COMMENT 'Id',
  `Code` varchar(255) NOT NULL COMMENT '点编码',
  `TMCAreaId` varchar(255) NOT NULL COMMENT '区域ID',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='240927地图公共交管区域点';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_mappublictmcsystem 结构
CREATE TABLE IF NOT EXISTS `cus_mappublictmcsystem` (
  `Id` varchar(255) NOT NULL COMMENT 'Id',
  `Code` varchar(255) NOT NULL COMMENT '标识码',
  `Name` varchar(255) NOT NULL COMMENT '名称',
  `LCmdParam` int(11) NOT NULL COMMENT '请求目标系统类型：1、本地系统，2、指定外接系统',
  `BasePath` varchar(255) DEFAULT NULL COMMENT '外接系统地址',
  `RequestInPath` varchar(255) DEFAULT NULL COMMENT '请求进入区域地址',
  `RequestInValue` longtext COMMENT '请求进入参数',
  `ReturnInValue` longtext COMMENT '请求进入返回参数',
  `RequestOutPath` varchar(255) DEFAULT NULL COMMENT '请求释放区域地址',
  `RequestOutValue` longtext COMMENT '请求释放参数',
  `ReturnOutValue` longtext COMMENT '请求释放返回参数',
  `IsInvocate` tinyint(1) NOT NULL COMMENT '是否被需要调用',
  `InvRequestValue` longtext COMMENT '外部调用请求参数',
  `InvReturnValue` longtext COMMENT '外部调用返回参数',
  `MapID` varchar(255) NOT NULL COMMENT '地图ID',
  `IsEnable` tinyint(1) NOT NULL COMMENT '是否启用',
  `Remark` varchar(255) NOT NULL COMMENT '备注',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='公共交管对接系统';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_mapstorey 结构
CREATE TABLE IF NOT EXISTS `cus_mapstorey` (
  `Id` varchar(255) NOT NULL COMMENT '主键',
  `StoreyName` varchar(255) NOT NULL COMMENT '楼层名称',
  `MapId` varchar(255) NOT NULL COMMENT '地图ID',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `StoreyNum` int(11) DEFAULT NULL COMMENT '楼层数字',
  `SlamId` varchar(255) DEFAULT NULL COMMENT 'Slam地图',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='地图对应楼层信息';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_mapswitching 结构
CREATE TABLE IF NOT EXISTS `cus_mapswitching` (
  `Id` varchar(255) NOT NULL COMMENT '主键',
  `Code` varchar(255) NOT NULL COMMENT '切换区域编码',
  `Name` varchar(255) NOT NULL COMMENT '切换区域名称',
  `MapId` varchar(255) NOT NULL COMMENT '地图ID',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='地图切换点集合';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_mapswitchingpoint 结构
CREATE TABLE IF NOT EXISTS `cus_mapswitchingpoint` (
  `Id` varchar(255) NOT NULL COMMENT '主键',
  `Code` varchar(255) NOT NULL COMMENT '地图点',
  `StoreyId` varchar(255) NOT NULL COMMENT '点所在楼层id',
  `SwitchingId` varchar(255) NOT NULL COMMENT '切换区域ID',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='地图切换点集合';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_mobile 结构
CREATE TABLE IF NOT EXISTS `cus_mobile` (
  `Id` varchar(255) NOT NULL COMMENT '主键',
  `Code` varchar(255) NOT NULL COMMENT '编号',
  `Name` varchar(255) NOT NULL COMMENT '名称',
  `IsEnable` tinyint(1) NOT NULL COMMENT '是否启用',
  `GroupId` varchar(255) NOT NULL COMMENT '分组ID',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='移动端';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_mobilegroup 结构
CREATE TABLE IF NOT EXISTS `cus_mobilegroup` (
  `Id` varchar(255) NOT NULL COMMENT '主键',
  `Code` varchar(255) NOT NULL COMMENT '编号',
  `Name` varchar(255) NOT NULL COMMENT '名称',
  `TaskAgvGroup` varchar(255) DEFAULT NULL COMMENT '车辆分组',
  `MapId` varchar(255) NOT NULL COMMENT '地图ID',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `TaskAgvCode` varchar(255) DEFAULT NULL COMMENT '车辆分组',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='移动端分组';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_mobilegroupinfo 结构
CREATE TABLE IF NOT EXISTS `cus_mobilegroupinfo` (
  `Id` varchar(255) NOT NULL COMMENT '主键',
  `BtnTaskType` int(11) NOT NULL COMMENT '按钮任务类型',
  `BtnTaskCode` varchar(255) NOT NULL COMMENT '任务Code',
  `GroupId` varchar(255) NOT NULL COMMENT '分组ID',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `BtnMobileTaskName` varchar(255) NOT NULL COMMENT '移动端按钮任务名称',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='移动端分组详情';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_mobileinfo 结构
CREATE TABLE IF NOT EXISTS `cus_mobileinfo` (
  `Id` varchar(255) NOT NULL COMMENT '主键',
  `MobileId` varchar(255) NOT NULL COMMENT '移动端Id',
  `BtnTaskPara` longtext COMMENT '移动端任务参数',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `BtnTaskCode` varchar(255) NOT NULL COMMENT '按钮任务',
  `MobileGroupInfoId` varchar(255) NOT NULL COMMENT '移动端分组任务Id',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='移动端详情';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_slammap 结构
CREATE TABLE IF NOT EXISTS `cus_slammap` (
  `Id` varchar(255) NOT NULL COMMENT '主键',
  `SlamMapCode` varchar(255) NOT NULL COMMENT 'slam地图code',
  `SlamMapPath` varchar(255) NOT NULL COMMENT '地图路径',
  `X` double NOT NULL COMMENT 'Slam地图x坐标',
  `Y` double NOT NULL COMMENT 'Slam地图y坐标',
  `Size` varchar(255) DEFAULT NULL COMMENT '地图大小',
  `url` varchar(255) NOT NULL COMMENT '地图地址',
  `Width` int(11) NOT NULL COMMENT '图片宽度',
  `Height` int(11) NOT NULL COMMENT '图片高度',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `SlamMapAngel` double NOT NULL COMMENT 'Slam地图角度',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='slammap信息';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_thirdsysteminfo 结构
CREATE TABLE IF NOT EXISTS `cus_thirdsysteminfo` (
  `Id` varchar(50) NOT NULL COMMENT '主键',
  `Name` varchar(255) NOT NULL COMMENT '系统名称',
  `Code` varchar(255) NOT NULL COMMENT '标识码',
  `IsEnable` bit(1) NOT NULL COMMENT '是否启用',
  `Remark` varchar(255) NOT NULL COMMENT '备注',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreatorId` varchar(255) DEFAULT NULL COMMENT '创建人Id',
  `Deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已删除',
  `ComType` int(11) NOT NULL COMMENT '通信类型 0:WebAPI 1:TCP   2 modbustcp',
  `BasePath` varchar(255) DEFAULT NULL COMMENT '外接系统地址',
  `GetInfoPath` varchar(255) DEFAULT NULL COMMENT '推送信息方法',
  `CanGetStateInfo` bit(1) NOT NULL COMMENT '是否接收状态信息',
  `GetStateInfoPath` varchar(255) DEFAULT NULL COMMENT '状态接收方法',
  `GetStateInfoTimeSpan` double DEFAULT NULL COMMENT '状态接收间隔',
  `Ip` varchar(255) DEFAULT NULL COMMENT 'IP地址',
  `Port` int(11) DEFAULT NULL COMMENT '端口号',
  `StationNum` int(11) DEFAULT NULL COMMENT '站号',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='第三方系统信息';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_trafficlights 结构
CREATE TABLE IF NOT EXISTS `cus_trafficlights` (
  `Id` varchar(255) NOT NULL COMMENT '主键',
  `Code` varchar(255) NOT NULL COMMENT '编号',
  `IP` varchar(255) NOT NULL COMMENT 'IP',
  `Port` int(11) NOT NULL COMMENT '端口',
  `Name` varchar(255) NOT NULL COMMENT '名称',
  `IsEnable` tinyint(1) NOT NULL COMMENT '是否启用',
  `MapId` varchar(255) NOT NULL COMMENT '地图ID',
  `RedComIndex` int(11) NOT NULL COMMENT '红灯引脚序号',
  `GreenComIndex` int(11) NOT NULL COMMENT '绿灯引脚',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='交通信号灯';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_warehouse 结构
CREATE TABLE IF NOT EXISTS `cus_warehouse` (
  `Id` varchar(50) NOT NULL COMMENT '主键',
  `Code` varchar(255) NOT NULL COMMENT '编码',
  `Name` varchar(255) NOT NULL COMMENT '名称',
  `IsEnabled` int(1) DEFAULT NULL COMMENT '是否可用 1可用0禁用',
  `MapId` varchar(255) NOT NULL COMMENT '地图Id',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreatorId` varchar(255) DEFAULT NULL COMMENT '创建人Id',
  `Deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='仓库表';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_warehousearea 结构
CREATE TABLE IF NOT EXISTS `cus_warehousearea` (
  `Id` varchar(50) NOT NULL COMMENT '主键',
  `Code` varchar(255) NOT NULL COMMENT '编码',
  `WarehouseId` varchar(255) NOT NULL COMMENT '仓库编码',
  `Name` varchar(255) NOT NULL COMMENT '名称',
  `ContainerType` varchar(255) NOT NULL COMMENT '容器类型',
  `IsEnabled` int(1) DEFAULT NULL COMMENT '是否可用 1可用0禁用',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreatorId` varchar(255) DEFAULT NULL COMMENT '创建人Id',
  `Deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已删除',
  `TaskAgvGroup` varchar(255) NOT NULL COMMENT '车辆集群编码',
  `TaskAgvCode` varchar(255) NOT NULL COMMENT '车辆编码',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='仓库表';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.cus_warehouselocation 结构
CREATE TABLE IF NOT EXISTS `cus_warehouselocation` (
  `Id` varchar(50) NOT NULL COMMENT '主键',
  `Code` varchar(255) NOT NULL COMMENT '编码',
  `WarehouseAreaId` varchar(255) NOT NULL COMMENT '库区编码',
  `MapStoreyId` varchar(255) DEFAULT NULL COMMENT '地图层编码',
  `Status` int(1) DEFAULT NULL COMMENT '占用状态',
  `PointCode` varchar(255) DEFAULT NULL COMMENT '点 编码',
  `ContainerCode` varchar(255) DEFAULT NULL COMMENT '容器 编码',
  `Row` int(3) DEFAULT NULL COMMENT '排',
  `Bay` int(3) DEFAULT NULL COMMENT '列',
  `Level` int(3) DEFAULT NULL COMMENT '层',
  `IsEnabled` int(1) DEFAULT NULL COMMENT '是否可用 1可用0禁用',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreatorId` varchar(255) DEFAULT NULL COMMENT '创建人Id',
  `Deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已删除',
  `CallerId` varchar(255) DEFAULT NULL COMMENT '呼叫器配置',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='库位';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.wf_cmdblock 结构
CREATE TABLE IF NOT EXISTS `wf_cmdblock` (
  `Id` varchar(50) NOT NULL COMMENT '主键',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreatorId` varchar(255) DEFAULT NULL COMMENT '创建人Id',
  `Deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已删除',
  `code` varchar(255) NOT NULL COMMENT '编码',
  `name` varchar(255) NOT NULL COMMENT '块名称',
  `accessModel` int(11) NOT NULL COMMENT '车型',
  `blockInfo` varchar(255) NOT NULL COMMENT '指令块',
  `lineInfo` varchar(255) NOT NULL COMMENT '指令线',
  `variableInfo` varchar(255) NOT NULL COMMENT '变量',
  `mapID` varchar(255) NOT NULL COMMENT '地图ID',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='指令块';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.wf_task 结构
CREATE TABLE IF NOT EXISTS `wf_task` (
  `TaskCode` varchar(50) NOT NULL COMMENT '编码',
  `MapCode` varchar(255) DEFAULT NULL COMMENT '地图编码',
  `TempCode` varchar(255) DEFAULT NULL COMMENT '任务模板标识',
  `AgvCode` varchar(255) DEFAULT NULL COMMENT '车辆ID',
  `VariableInfo` longtext COMMENT '变量信息',
  `Priority` int(11) DEFAULT NULL COMMENT '优先级',
  `ReceiveCode` varchar(255) DEFAULT NULL COMMENT '请求单号',
  `ClientToken` varchar(255) DEFAULT NULL COMMENT '客户端编号，如 PDA，WMS 等',
  `TaskState` int(11) NOT NULL COMMENT '任务状态',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `BeginTime` datetime DEFAULT NULL COMMENT '任务开始时间',
  `EndTime` datetime DEFAULT NULL COMMENT '任务结束时间',
  `AgvGroupCode` varchar(255) DEFAULT NULL COMMENT 'AGV群组，用于重启地图时任务恢复，获取当前任务应分配AGV的群组',
  PRIMARY KEY (`TaskCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='任务';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.wf_taskold 结构
CREATE TABLE IF NOT EXISTS `wf_taskold` (
  `TaskCode` varchar(50) NOT NULL COMMENT '编码',
  `MapCode` varchar(255) DEFAULT NULL COMMENT '地图编码',
  `TempCode` varchar(255) DEFAULT NULL COMMENT '任务模板标识',
  `AgvCode` varchar(255) DEFAULT NULL COMMENT '车辆ID',
  `VariableInfo` longtext COMMENT '变量信息',
  `Priority` int(11) DEFAULT NULL COMMENT '优先级',
  `ReceiveCode` varchar(255) DEFAULT NULL COMMENT '请求单号',
  `ClientToken` varchar(255) DEFAULT NULL COMMENT '客户端编号，如 PDA，WMS 等',
  `TaskState` int(11) NOT NULL COMMENT '任务状态',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `BeginTime` datetime DEFAULT NULL COMMENT '任务开始时间',
  `EndTime` datetime DEFAULT NULL COMMENT '任务结束时间',
  `AgvGroupCode` varchar(255) DEFAULT NULL COMMENT 'AGV群组，用于重启地图时任务恢复，获取当前任务应分配AGV的群组',
  PRIMARY KEY (`TaskCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='历史数据';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.wf_taskstep 结构
CREATE TABLE IF NOT EXISTS `wf_taskstep` (
  `Id` varchar(255) NOT NULL COMMENT '主键',
  `TaskID` varchar(255) NOT NULL COMMENT '任务ID',
  `MapCode` varchar(255) NOT NULL COMMENT '地图code',
  `StepID` varchar(255) NOT NULL COMMENT '子节点ID',
  `StepName` varchar(255) NOT NULL COMMENT '子节点名称',
  `StepState` int(11) NOT NULL COMMENT '当前节点状态',
  `Variables` longtext COMMENT '表达式',
  `BeginTime` datetime DEFAULT NULL COMMENT '任务开始时间',
  `EndTime` datetime DEFAULT NULL COMMENT '任务结束时间',
  `TaskStepNum` int(11) NOT NULL COMMENT '任务步骤序号',
  `IsLoading` tinyint(1) NOT NULL COMMENT '用于停运地图时任务恢复是否携带货架',
  `AgvAngle` double NOT NULL COMMENT '用于停运地图时任务恢复车头角度',
  `RotationAngle` double NOT NULL COMMENT '用于停运地图时任务恢复转盘角度',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='任务步骤';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.wf_taskstepold 结构
CREATE TABLE IF NOT EXISTS `wf_taskstepold` (
  `Id` varchar(255) NOT NULL COMMENT '主键',
  `MapCode` varchar(255) NOT NULL COMMENT '地图code',
  `TaskID` varchar(255) NOT NULL COMMENT '任务ID',
  `StepID` varchar(255) NOT NULL COMMENT '子节点ID',
  `StepName` varchar(255) NOT NULL COMMENT '子节点名称',
  `StepState` int(11) NOT NULL COMMENT '当前节点状态',
  `Variables` longtext COMMENT '表达式',
  `BeginTime` datetime DEFAULT NULL COMMENT '任务开始时间',
  `EndTime` datetime DEFAULT NULL COMMENT '任务结束时间',
  `TaskStepNum` int(11) NOT NULL COMMENT '任务步骤序号',
  `IsLoading` tinyint(1) NOT NULL COMMENT '用于停运地图时任务恢复是否携带货架',
  `AgvAngle` double NOT NULL COMMENT '用于停运地图时任务恢复车头角度',
  `RotationAngle` double NOT NULL COMMENT '用于停运地图时任务恢复转盘角度',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='历史数据';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.wf_tasktemp 结构
CREATE TABLE IF NOT EXISTS `wf_tasktemp` (
  `Id` varchar(50) NOT NULL COMMENT '主键',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreatorId` varchar(255) DEFAULT NULL COMMENT '创建人Id',
  `Deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已删除',
  `code` varchar(255) NOT NULL COMMENT '编码',
  `name` varchar(255) NOT NULL COMMENT '任务名称',
  `accessModel` int(11) NOT NULL COMMENT '任务车型',
  `blockInfo` longtext COMMENT '指令信息',
  `lineInfo` longtext COMMENT '指令线',
  `variableInfo` longtext COMMENT '变量信息',
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  `mapID` varchar(50) NOT NULL COMMENT '地图ID',
  `IsPushStateInfo` bit(1) NOT NULL COMMENT '是否推送外接系统',
  `PushTargetType` int(11) NOT NULL COMMENT '推送信息目标  0:任务源系统   1:指定外接系统',
  `ThirdSysCode` varchar(255) DEFAULT NULL COMMENT '外接系统标识',
  `StateInfoConfig` longtext COMMENT '状态信息结构配置',
  `ProAreaL` double NOT NULL COMMENT '负载保护区域长度 mm',
  `ProAreaW` double NOT NULL COMMENT '负载保护区域宽度 mm',
  `IsToParking` bit(1) DEFAULT NULL COMMENT '是否返回停车点',
  `MaxTaskCount` int(11) NOT NULL COMMENT '任务最大允许创建的数量，默认为0不限制。',
  `PushErrorState` tinyint(1) NOT NULL COMMENT '仅推送异常',
  `MaxSpeed` double NOT NULL COMMENT '最大速度',
  `MaxLoadSpeed` double NOT NULL COMMENT '最大载货速度',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='任务模板';

-- 数据导出被取消选择。

-- 导出  表 agvschdule.wf_tasktempsysvariable 结构
CREATE TABLE IF NOT EXISTS `wf_tasktempsysvariable` (
  `Id` varchar(255) NOT NULL COMMENT '主键',
  `Remark` varchar(255) DEFAULT NULL COMMENT '描述',
  `Code` varchar(255) NOT NULL COMMENT '变量名',
  `Type` int(11) NOT NULL COMMENT '值类型 int double string bool intArray doubleArray stringArray point',
  `Value` varchar(255) DEFAULT NULL COMMENT '值',
  `MapID` varchar(50) NOT NULL COMMENT '地图ID',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统变量';

-- 数据导出被取消选择。

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
