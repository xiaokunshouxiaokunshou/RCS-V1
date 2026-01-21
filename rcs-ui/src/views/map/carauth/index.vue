<script setup>
import {ref,onMounted} from 'vue';
import {queryAgvTypeList,queryAgvSeriesList,queryAgvTypesList} from '@/api/agvType';
import { ElMessage,ElMessageBox } from 'element-plus';


//钩子函数
onMounted(() => {
  search();
});

//查询
const agvTypeList = ref([])
const series = ref([])
const types = ref([])
const search = async () => { 
  const result = await queryAgvTypeList();
  const result3 = await queryAgvTypesList();
  const result2 = await queryAgvSeriesList();
  

  if(result.code){
    agvTypeList.value = result.data;
    series.value = result2.data;
    types.value = result3.data;

    for(let i = 0; i < agvTypeList.value.length; i++){
      agvTypeList.value[i].agvSeries = result2.data.find(item => item.series === agvTypeList.value[i].agvSeries).value;
    }

    for(let i = 0; i < agvTypeList.value.length; i++){
      agvTypeList.value[i].agvType = result3.data.find(item => item.type === agvTypeList.value[i].agvType).name;
    }
  }
}



    const tableData = [
    {
        date: '2016-05-03',
        name: 'Tom',
        address: 'No. 189, Grove St, Los Angeles',
    },
    {
        date: '2016-05-02',
        name: 'Tom',
        address: 'No. 189, Grove St, Los Angeles',
    },
    {
        date: '2016-05-04',
        name: 'Tom',
        address: 'No. 189, Grove St, Los Angeles',
    },
    {
        date: '2016-05-01',
        name: 'Tom',
        address: 'No. 189, Grove St, Los Angeles',
    },
    ]
</script>

<template>
  <div class="common-layout">
    <el-container>
      <el-aside width="200px">
       
        <el-menu>
            <el-sub-menu index="1">
                <template #title>
                    <el-icon><location /></el-icon>
                    <span>Navigator One</span>
                </template>
                <el-menu-item-group>
                    <el-menu-item index="1-1">item one</el-menu-item>
                    <el-menu-item index="1-2">item two</el-menu-item>
                </el-menu-item-group>
                
            </el-sub-menu>
            
        </el-menu>
        
      </el-aside>
      <el-container>
        <el-header>
            <div>
                <el-button type="primary">新增</el-button>
            </div>
        </el-header>
            <el-main>
                <el-table :data="agvTypeList" border style="width: 100%">
                    <el-table-column prop="agvSeries" label="系列" width="180" />
                    <el-table-column prop="agvType" label="AGV类型" width="180" />
                    <el-table-column prop="defaultSpeed" label="空载速度(m/s)" width="180" />
                    <el-table-column prop="maxAcceleration" label="空载加速度(m/s²)" width="180" />
                    <el-table-column prop="defaultLoadSpeed" label="满载速度(m/s)" width="180" />
                </el-table>
            </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<style scoped>

</style>