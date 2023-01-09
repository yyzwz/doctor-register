import { getRequest, postRequest, putRequest, postBodyRequest, getNoAuthRequest, postNoAuthRequest } from '@/libs/axios';

export const getHospitalDepartmentList = (params) => {
    return getRequest('/hospitalDepartment/getAll', params)
}
export const getAllDoctorByDepartmentId = (params) => {
    return getRequest('/doctor/getAllByDepartmentId', params)
}
export const addOrder = (params) => {
    return postRequest('/doctorNumber/addOrder', params)
}
export const pay = (params) => {
    return postRequest('/doctorNumber/pay', params)
}
export const getAllDoctorByName = (params) => {
    return getRequest('/doctor/getAllByName', params)
}
export const addSuperOrder = (params) => {
    return postRequest('/doctorNumber/addSuperOrder', params)
}