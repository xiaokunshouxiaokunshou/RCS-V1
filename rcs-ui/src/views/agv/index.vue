<script setup>
import {ref,onMounted} from 'vue';
import {queryAgvTypeList,queryAgvSeriesList,queryAgvTypesList,saveAgvType,queryByIdApi,updateAgvType,deleteAgvType} from '@/api/agvType';
import { ElMessage,ElMessageBox } from 'element-plus';


//钩子函数
onMounted(() => {
  search();
});
//查询
const agvTypeList = ref([])
const search = async () => { 
  const result = await queryAgvTypeList();
  const result2 = await queryAgvSeriesList();
  const result3 = await queryAgvTypesList();

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

//dialog对话框
const dialogFormVisible = ref(false);
const formTitle = ref('');
const seriesValue = ref('')
const series = ref([])
const typesValue = ref('')
const types = ref([])
const agvType = ref({
  agvL:'',
  agvW:'',
  agvH:'',
  defaultSpeed:'',
  maxAcceleration:'',
  agvFH:'',
  maxLoad:'',  
  maxAngSpeed:'',
  maxAngAcceleration:'',
  defaultLoadSpeed:'',
  defaultLoadAcceleration:'',
  chargeType:'',
  agvSeries:'',
  agvType:'',
  isUse:''
});

const chargeValue = ref('')

const charge = ref([
  { value: '1', label: '自动充电' },
  { value: '2', label: '手动充电' }
]);
//新增车型
const addAgvType = async () => { 
  formTitle.value = '新增车型';

  const result = await queryAgvSeriesList();
  if(result.code){
     series.value = result.data.map(item => ({
      value: item.series,
      label: item.value 
    }));
  }

  const result2 = await queryAgvTypesList();
  if(result2.code){
     types.value = result2.data.map(item => ({
      value: item.type,
      label: item.name 
    }));
  }

  dialogFormVisible.value = true;
}


//保存车型
const save = async () => { 
  agvType.value.isUse = 1;
  let result ;

  if(agvType.value.id){
    
    const result2 = await queryAgvSeriesList();
    const result3 = await queryAgvTypesList();
    if(result2.code && result3.code){    
      agvType.value.agvSeries = result2.data.find(item => item.value === agvType.value.agvSeries).series;
      agvType.value.agvType = result3.data.find(item => item.name === agvType.value.agvType).type;
    }

    result = await updateAgvType(agvType.value);
  }
  else{
    result = await saveAgvType(agvType.value);
  }


  if(result.code){
    ElMessage.success('保存成功');
    dialogFormVisible.value = false;
    search();
  }
  else{
    ElMessage.error(result.msg);
  }
}

//编辑
const edit = async (id) => { 
  formTitle.value = '编辑车型';
  const result = await queryByIdApi(id);
  const result2 = await queryAgvSeriesList();
  const result3 = await queryAgvTypesList();

  if(result.code){    
    agvType.value = result.data;
    series.value = result2.data;
    types.value = result3.data;

    agvType.value.agvSeries = result2.data.find(item => item.series === agvType.value.agvSeries).value;
    agvType.value.agvType = result3.data.find(item => item.type === agvType.value.agvType).name;
    
    types.value = result3.data.map(item => ({
      value: item.type,
      label: item.name 
    }));
    dialogFormVisible.value = true;
  }
}

const delById = async (id) => { 
  ElMessageBox.confirm('您确认删除该类型AGV吗?','提示',
    { confirmButtonText: '确认',cancelButtonText: '取消',type: 'warning'}
  ).then(async () => { //确认
    const result = await deleteAgvType(id);
    if(result.code){
      ElMessage.success('删除成功');
      search();
    }else{
      ElMessage.error(result.msg);
    }
  }).catch(() => { //取消
    ElMessage.info('您已取消删除');
  })
  
}

</script>

<template>
  <h1>AGV类型</h1>
  <div class="container">
    <el-button type="primary" @click="addAgvType">+ 新增车型</el-button>
  </div>
  <div class="container">
    <el-table :data="agvTypeList" style="width: 100%">
      <el-table-column type="index" label="序号" width="100" align="center" />
      <el-table-column prop="agvSeries" label="系列" width="120" align="center" />
      <el-table-column prop="agvType" label="车型" width="120" align="center" />
      <el-table-column prop="agvL" label="长度(mm)" width="120" align="center" />
      <el-table-column prop="agvW" label="宽度(mm)" width="120" align="center" />
      <el-table-column prop="agvH" label="高度(mm)" width="120" align="center" />
      <el-table-column prop="isUse" label="是否启用" width="120" align="center" />
      <el-table-column label="操作" min-width="120" align="center">
        <template #default="scope">
          <!-- <el-button link type="warning" size="small" @click="detail(scope.row.id)">
            <el-icon><Reading /></el-icon>详情
          </el-button> -->
          <el-button link type="primary" size="small" @click="edit(scope.row.id)" ><el-icon><EditPen /></el-icon> 编辑</el-button>
          <el-button link type="danger" size="small" @click="delById(scope.row.id)"><el-icon><Delete /></el-icon>删除</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>

  <el-dialog v-model="dialogFormVisible" :title="formTitle" width="800">
    <el-form :model="form">
      <el-descriptions
        class="margin-top"
        :column="2"
        :size="size"
        border
      >
    
      <el-descriptions-item>
        <template #label>
          <div class="cell-item" align="center">
            系列
          </div>
        </template>
        <el-select v-model="agvType.agvSeries" placeholder="Select" style="width: 240px">
          <el-option
            v-for="item in series"
            :key="item.value"
            :label="item.label"
            :value="item.value"
          />
        </el-select>
       
      </el-descriptions-item>
      <el-descriptions-item>
        <template #label>
          <div class="cell-item">
            车型
          </div>
        </template>
        <el-select v-model="agvType.agvType" placeholder="Select" style="width: 240px">
          <el-option
            v-for="item1 in types"
            :key="item1.value"
            :label="item1.label"
            :value="item1.value"
          />
        </el-select>

      </el-descriptions-item>
      <el-descriptions-item>
        <template #label>
          <div class="cell-item">
            长度(mm)
          </div>
        </template>
        <el-input v-model="agvType.agvL" placeholder="请输入长度"></el-input>
      </el-descriptions-item>

      <el-descriptions-item>
        <template #label>
          <div class="cell-item">
            宽度(mm)
          </div>
        </template>
        <el-input v-model="agvType.agvW" placeholder="请输入宽度"></el-input>
      </el-descriptions-item>

      <el-descriptions-item>
        <template #label>
          <div class="cell-item">
            高度(mm)
          </div>
        </template>
        <el-input v-model="agvType.agvH" placeholder="请输入高度"></el-input>
      </el-descriptions-item>

      <el-descriptions-item>
        <template #label>
          <div class="cell-item">
            最大速度(m/s)
          </div>
        </template>
        <el-input v-model="agvType.defaultSpeed" placeholder="请输入最大速度"></el-input>
      </el-descriptions-item>

      <el-descriptions-item>
        <template #label>
          <div class="cell-item">
            最大加速度(m/s²)
          </div>
        </template>
        
        <el-input v-model="agvType.maxAcceleration" placeholder="请输入最大加速度"></el-input>
      </el-descriptions-item>
          
      <el-descriptions-item>
        <template #label>
          <div class="cell-item">
            车体离地间隙(mm)
          </div>
        </template>
        <el-input v-model="agvType.agvFH" placeholder="请输入车体离地间隙"></el-input>
      </el-descriptions-item>

      <el-descriptions-item>
        <template #label>
          <div class="cell-item">
            最大载重量(kg)
          </div>
        </template>
        <el-input v-model="agvType.maxLoad" placeholder="请输入最大载重量"></el-input>
      </el-descriptions-item>

      <el-descriptions-item>
        <template #label>
          <div class="cell-item">
            充电类型
          </div>
        </template>
        <el-select v-model="agvType.chargeType" placeholder="Select" style="width: 240px">
          <el-option
            v-for="item in charge"
            :key="item.value"
            :label="item.label"
            :value="item.value"
          />
        </el-select>

      </el-descriptions-item>

      <el-descriptions-item>
        <template #label>
          <div class="cell-item">
            最大旋转速度(°/s)
          </div>
        </template>
        <el-input v-model="agvType.maxAngSpeed" placeholder="请输入最大旋转速度"></el-input>
      </el-descriptions-item>

      <el-descriptions-item>
        <template #label>
          <div class="cell-item">
            最大旋转角加速度(°/s²)
          </div>
        </template>
        <el-input v-model="agvType.maxAngAcceleration" placeholder="请输入最大旋转角加速度"></el-input>
      </el-descriptions-item>

      <el-descriptions-item>
        <template #label>
          <div class="cell-item">
            满载速度(m/s)
          </div>
        </template>
        <el-input v-model="agvType.defaultLoadSpeed" placeholder="请输入满载速度"></el-input>
      </el-descriptions-item>

      <el-descriptions-item>
        <template #label>
          <div class="cell-item">
            满载加速度(m/s²)
          </div>
        </template>
        <el-input v-model="agvType.defaultLoadAcceleration" placeholder="请输入满载加速度"></el-input>
      </el-descriptions-item>

      <!-- <el-descriptions-item>
        <template #label>
          <div class="cell-item">
            <el-icon :style="iconStyle">
              <tickets />
            </el-icon>
            Remarks
          </div>
        </template>
        <el-tag size="small">School</el-tag>
      </el-descriptions-item> -->
     
    </el-descriptions>
    </el-form>
    <template #footer>
      <div class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取消</el-button>
        <el-button type="primary" @click="save">
          确认
        </el-button>
      </div>
    </template>
  </el-dialog>
  
</template>

<style scoped>
.container{
  margin: 15px 0px;
}
</style>