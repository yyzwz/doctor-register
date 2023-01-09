package cn.zwz.doctor.controller;

import cn.hutool.core.date.DateUtil;
import cn.zwz.basics.utils.PageUtil;
import cn.zwz.basics.utils.ResultUtil;
import cn.zwz.basics.baseVo.PageVo;
import cn.zwz.basics.baseVo.Result;
import cn.zwz.data.utils.ZwzNullUtils;
import cn.zwz.doctor.entity.Doctor;
import cn.zwz.doctor.entity.DoctorNumber;
import cn.zwz.doctor.entity.HospitalDepartment;
import cn.zwz.doctor.service.IDoctorNumberService;
import cn.zwz.doctor.service.IDoctorService;
import cn.hutool.core.util.StrUtil;
import cn.zwz.doctor.service.IHospitalDepartmentService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author 郑为中
 */
@Slf4j
@RestController
@Api(tags = "医生管理接口")
@RequestMapping("/zwz/doctor")
@Transactional
public class DoctorController {

    @Autowired
    private IDoctorService iDoctorService;

    @Autowired
    private IHospitalDepartmentService iHospitalDepartmentService;

    @Autowired
    private IDoctorNumberService iDoctorNumberService;

    @RequestMapping(value = "/getOne", method = RequestMethod.GET)
    @ApiOperation(value = "查询单条医生")
    public Result<Doctor> get(@RequestParam String id){
        return new ResultUtil<Doctor>().setData(iDoctorService.getById(id));
    }

    @RequestMapping(value = "/count", method = RequestMethod.GET)
    @ApiOperation(value = "查询全部医生个数")
    public Result<Long> getCount(){
        return new ResultUtil<Long>().setData(iDoctorService.count());
    }

    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    @ApiOperation(value = "查询全部医生")
    public Result<List<Doctor>> getAll(){
        return new ResultUtil<List<Doctor>>().setData(iDoctorService.list());
    }

    @RequestMapping(value = "/getAllByDepartmentId", method = RequestMethod.GET)
    @ApiOperation(value = "用户查询全部医生")
    public Result<List<Doctor>> getAllByDepartmentId(@RequestParam String departmentId){
        QueryWrapper<Doctor> qw = new QueryWrapper<>();
        qw.eq("department_id",departmentId);
        List<Doctor> doctorList = iDoctorService.list(qw);
        for (Doctor doctor : doctorList) {
            QueryWrapper<DoctorNumber> numberQw = new QueryWrapper<>();
            numberQw.eq("doctor_id",doctor.getId());
            numberQw.eq("date", DateUtil.today());
            numberQw.eq("order_flag",false);
            long count = iDoctorNumberService.count(numberQw);
            doctor.setNumberStr(count);
        }
        return new ResultUtil<List<Doctor>>().setData(doctorList);
    }

    @RequestMapping(value = "/getAllByName", method = RequestMethod.GET)
    @ApiOperation(value = "用户查询全部医生")
    public Result<List<Doctor>> getAllByName(@RequestParam String name){
        QueryWrapper<Doctor> qw = new QueryWrapper<>();
        qw.eq("name",name);
        List<Doctor> doctorList = iDoctorService.list(qw);
        return new ResultUtil<List<Doctor>>().setData(doctorList);
    }

    @RequestMapping(value = "/getByPage", method = RequestMethod.GET)
    @ApiOperation(value = "查询医生")
    public Result<IPage<Doctor>> getByPage(@ModelAttribute Doctor doctor,@ModelAttribute PageVo page){
        QueryWrapper<Doctor> qw = new QueryWrapper<>();
        if(!ZwzNullUtils.isNull(doctor.getName())) {
            qw.like("name",doctor.getName());
        }
        if(!ZwzNullUtils.isNull(doctor.getDepartmentId())) {
            qw.eq("department_id",doctor.getDepartmentId());
        }
        if(!ZwzNullUtils.isNull(doctor.getLevel())) {
            qw.eq("level",doctor.getLevel());
        }
        IPage<Doctor> data = iDoctorService.page(PageUtil.initMpPage(page),qw);
        for (Doctor doct : data.getRecords()) {
            if(!ZwzNullUtils.isNull(doct.getDepartmentId())) {
                HospitalDepartment hd = iHospitalDepartmentService.getById(doct.getDepartmentId());
                if(hd != null) {
                    doct.setDepartmentName(hd.getTitle());
                } else {
                    doct.setDepartmentName("无");
                }
            } else {
                doct.setDepartmentName("未填写");
            }
        }
        return new ResultUtil<IPage<Doctor>>().setData(data);
    }

    @RequestMapping(value = "/insertOrUpdate", method = RequestMethod.POST)
    @ApiOperation(value = "增改医生")
    public Result<Doctor> saveOrUpdate(Doctor doctor){
        if(iDoctorService.saveOrUpdate(doctor)){
            return new ResultUtil<Doctor>().setData(doctor);
        }
        return ResultUtil.error();
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    @ApiOperation(value = "新增医生")
    public Result<Doctor> insert(Doctor doctor){
        if(ZwzNullUtils.isNull(doctor.getDepartmentId())) {
            return ResultUtil.error("科室不能为空");
        }
        HospitalDepartment hd = iHospitalDepartmentService.getById(doctor.getDepartmentId());
        if(hd == null) {
            return ResultUtil.error("科室不存在");
        }
        iDoctorService.saveOrUpdate(doctor);
        return new ResultUtil<Doctor>().setData(doctor);
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ApiOperation(value = "编辑医生")
    public Result<Doctor> update(Doctor doctor){
        if(ZwzNullUtils.isNull(doctor.getDepartmentId())) {
            return ResultUtil.error("科室不能为空");
        }
        HospitalDepartment hd = iHospitalDepartmentService.getById(doctor.getDepartmentId());
        if(hd == null) {
            return ResultUtil.error("科室不存在");
        }
        iDoctorService.saveOrUpdate(doctor);
        return new ResultUtil<Doctor>().setData(doctor);
    }

    @RequestMapping(value = "/delByIds", method = RequestMethod.POST)
    @ApiOperation(value = "删除医生")
    public Result<Object> delByIds(@RequestParam String[] ids){
        for(String id : ids){
            iDoctorService.removeById(id);
        }
        return ResultUtil.success();
    }
}
