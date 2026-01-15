import request from "@/utils/request";

// 查询AGV车型列表
export const queryAgvTypeList = () => request.get('/agvtype');

export const queryAgvSeriesList = () => request.get('/agvseries');

export const queryAgvTypesList = () => request.get('/agvtypes');

export const saveAgvType = (agvType) => request.post('/agvtype', agvType);

export const queryByIdApi = (id) => request.get(`/agvtype/${id}`);

export const updateAgvType = (agvType) => request.put('/agvtype', agvType);

export const deleteAgvType = (id) => request.delete(`/agvtype/${id}`);