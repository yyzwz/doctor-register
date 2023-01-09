import { getRequest, postRequest, putRequest, postBodyRequest, getNoAuthRequest, postNoAuthRequest } from '@/libs/axios';

export const getDoctorNumberOne = (params) => {
    return getRequest('/doctorNumber/getOne', params)
}
export const getDoctorNumberList = (params) => {
    return getRequest('/doctorNumber/getByPage', params)
}
export const getDoctorNumberCount = (params) => {
    return getRequest('/doctorNumber/count', params)
}
export const addDoctorNumber = (params) => {
    return postRequest('/doctorNumber/insert', params)
}
export const editDoctorNumber = (params) => {
    return postRequest('/doctorNumber/update', params)
}
export const addOrEditDoctorNumber = (params) => {
    return postRequest('/doctorNumber/insertOrUpdate', params)
}
export const deleteDoctorNumber = (params) => {
    return postRequest('/doctorNumber/delByIds', params)
}
export const pay = (params) => {
    return postRequest('/doctorNumber/pay', params)
}
export const quXiaoOrder = (params) => {
    return postRequest('/doctorNumber/quXiaoOrder', params)
}