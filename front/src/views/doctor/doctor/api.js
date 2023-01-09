import { getRequest, postRequest, putRequest, postBodyRequest, getNoAuthRequest, postNoAuthRequest } from '@/libs/axios';

export const getDoctorOne = (params) => {
    return getRequest('/doctor/getOne', params)
}
export const getDoctorList = (params) => {
    return getRequest('/doctor/getByPage', params)
}
export const getDoctorCount = (params) => {
    return getRequest('/doctor/count', params)
}
export const addDoctor = (params) => {
    return postRequest('/doctor/insert', params)
}
export const editDoctor = (params) => {
    return postRequest('/doctor/update', params)
}
export const addOrEditDoctor = (params) => {
    return postRequest('/doctor/insertOrUpdate', params)
}
export const deleteDoctor = (params) => {
    return postRequest('/doctor/delByIds', params)
}
export const getDoctorDepartmentList = (params) => {
    return getRequest('/hospitalDepartment/getAll', params)
}
export const fangOrder = (params) => {
    return postRequest('/doctorNumber/fangOrder', params)
}