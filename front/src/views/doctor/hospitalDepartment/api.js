import { getRequest, postRequest, putRequest, postBodyRequest, getNoAuthRequest, postNoAuthRequest } from '@/libs/axios';

export const getHospitalDepartmentOne = (params) => {
    return getRequest('/hospitalDepartment/getOne', params)
}
export const getHospitalDepartmentList = (params) => {
    return getRequest('/hospitalDepartment/getByPage', params)
}
export const getHospitalDepartmentCount = (params) => {
    return getRequest('/hospitalDepartment/count', params)
}
export const addHospitalDepartment = (params) => {
    return postRequest('/hospitalDepartment/insert', params)
}
export const editHospitalDepartment = (params) => {
    return postRequest('/hospitalDepartment/update', params)
}
export const addOrEditHospitalDepartment = (params) => {
    return postRequest('/hospitalDepartment/insertOrUpdate', params)
}
export const deleteHospitalDepartment = (params) => {
    return postRequest('/hospitalDepartment/delByIds', params)
}