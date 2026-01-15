<script setup>

</script>

<template>
  <div class="common-layout">
    <el-container>
      <el-header class="header">
        <span class="title">AGV调度系统</span>
        <span class="right_tool">
          <a href="">
            <el-icon><EditPen /></el-icon> 修改密码 &nbsp;&nbsp;&nbsp; |  &nbsp;&nbsp;&nbsp;
          </a>
          <a href="">
            <el-icon><SwitchButton /></el-icon> 退出登录
          </a>
        </span>
      </el-header>
      
      <el-container>
        <el-aside width="200px" class="aside">
          <!-- 左侧菜单 -->
          <el-menu router>
            <!-- 首页菜单 -->
             <el-menu-item index="/index">
              <el-icon><Promotion /></el-icon> 首页
             </el-menu-item>

             <!-- 地图配置 -->
             <el-sub-menu index="/map">
              <template #title>
                <el-icon><MapLocation /></el-icon> 地图配置                
              </template>
                <el-menu-item index="">地图信息</el-menu-item>
                <el-menu-item index="">准入车型配置</el-menu-item>
                <el-menu-item index="">地图运行配置</el-menu-item>
                <el-menu-item index="">车辆集群配置</el-menu-item>
                <el-menu-item index="">充电桩配置</el-menu-item>
                <el-menu-item index="">任务模板配置</el-menu-item>
                <el-menu-item index="">SLAM地图管理</el-menu-item>
                <el-menu-item index="">任务运行信息</el-menu-item>
                <el-menu-item index="">设备点位管理</el-menu-item>
                <el-menu-item index="">公共交管区管理</el-menu-item>
            </el-sub-menu>
            
            <!-- AGV类型 -->
             <el-menu-item index="/agv">
              <el-icon><Van /></el-icon> AGV类型
             </el-menu-item>

             <!-- 外设配置 -->
             <el-sub-menu index="/tdevice">
              <template #title>
                <el-icon><Switch /></el-icon> 外设配置                
              </template>
                <el-menu-item index="">设备监控</el-menu-item>
                <el-menu-item index="">电梯配置</el-menu-item>
                <el-menu-item index="">自动门配置</el-menu-item>
                <el-menu-item index="">呼叫器配置</el-menu-item>
                <el-menu-item index="">移动端配置</el-menu-item>
                <el-menu-item index="">交通信号灯配置</el-menu-item>
            </el-sub-menu>

            <!-- 系统配置 -->
             <el-sub-menu index="/sys">
              <template #title>
                <el-icon><ElementPlus /></el-icon> 系统配置                
              </template>
                <el-menu-item index="">告警模板</el-menu-item>
                <el-menu-item index="">告警信息</el-menu-item>
                <el-menu-item index="">系统参数</el-menu-item>
                <el-menu-item index="">外接系统</el-menu-item>
            </el-sub-menu>

             <!-- 权限配置 -->
             <el-sub-menu index="/user">
              <template #title>
                <el-icon><UserFilled /></el-icon> 权限配置                
              </template>
                <el-menu-item index="">角色信息</el-menu-item>
                <el-menu-item index="">用户管理</el-menu-item>
            </el-sub-menu>
            </el-menu>
          </el-aside>
          <el-container>
          <el-main>
            <router-view></router-view>
          </el-main>
          
        </el-container>
      </el-container>
    </el-container>
  </div>
</template>

<style scoped>
.header {
  background-image: linear-gradient(to right, #00547d, #007fa4, #00aaa0, #00d072, #a8eb12);
}

.title {
  color: white;
  font-size: 40px;
  font-family: 楷体;
  line-height: 60px;
  font-weight: bolder;
}

.right_tool{
  float: right;
  line-height: 60px;
}

a {
  color: white;
  text-decoration: none;
}

.aside {
  width: 220px;
  border-right: 1px solid #ccc;
  height: 730px;
}
</style>