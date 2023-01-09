package cn.zwz.doctor.controller;

import cn.zwz.basics.utils.PageUtil;
import cn.zwz.basics.utils.ResultUtil;
import cn.zwz.basics.baseVo.PageVo;
import cn.zwz.basics.baseVo.Result;
import cn.zwz.data.utils.ZwzNullUtils;
import cn.zwz.doctor.entity.Doctor;
import cn.zwz.doctor.entity.HospitalDepartment;
import cn.zwz.doctor.service.IDoctorService;
import cn.zwz.doctor.service.IHospitalDepartmentService;
import cn.hutool.core.util.StrUtil;
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
@Api(tags = "科室管理接口")
@RequestMapping("/zwz/hospitalDepartment")
@Transactional
public class HospitalDepartmentController {

    @Autowired
    private IHospitalDepartmentService iHospitalDepartmentService;

    @Autowired
    private IDoctorService iDoctorService;

    @RequestMapping(value = "/getOne", method = RequestMethod.GET)
    @ApiOperation(value = "查询单条科室")
    public Result<HospitalDepartment> get(@RequestParam String id){
        return new ResultUtil<HospitalDepartment>().setData(iHospitalDepartmentService.getById(id));
    }

    @RequestMapping(value = "/count", method = RequestMethod.GET)
    @ApiOperation(value = "查询全部科室个数")
    public Result<Long> getCount(){
        return new ResultUtil<Long>().setData(iHospitalDepartmentService.count());
    }

    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    @ApiOperation(value = "查询全部科室")
    public Result<List<HospitalDepartment>> getAll(){
        return new ResultUtil<List<HospitalDepartment>>().setData(iHospitalDepartmentService.list());
    }

    @RequestMapping(value = "/getByPage", method = RequestMethod.GET)
    @ApiOperation(value = "查询科室")
    public Result<IPage<HospitalDepartment>> getByPage(@ModelAttribute HospitalDepartment hospitalDepartment ,@ModelAttribute PageVo page){
        QueryWrapper<HospitalDepartment> qw = new QueryWrapper<>();
        if(!ZwzNullUtils.isNull(hospitalDepartment.getTitle())) {
            qw.like("title",hospitalDepartment.getTitle());
        }
        IPage<HospitalDepartment> data = iHospitalDepartmentService.page(PageUtil.initMpPage(page),qw);
        for (HospitalDepartment hd : data.getRecords()) {
            QueryWrapper<Doctor> doQw = new QueryWrapper<>();
            doQw.eq("department_id",hd.getId());
            hd.setUserNumber(iDoctorService.count(doQw));
        }
        return new ResultUtil<IPage<HospitalDepartment>>().setData(data);
    }

    @RequestMapping(value = "/insertOrUpdate", method = RequestMethod.POST)
    @ApiOperation(value = "增改科室")
    public Result<HospitalDepartment> saveOrUpdate(HospitalDepartment hospitalDepartment){
        if(iHospitalDepartmentService.saveOrUpdate(hospitalDepartment)){
            return new ResultUtil<HospitalDepartment>().setData(hospitalDepartment);
        }
        return ResultUtil.error();
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    @ApiOperation(value = "新增科室")
    public Result<HospitalDepartment> insert(HospitalDepartment hospitalDepartment){
        iHospitalDepartmentService.saveOrUpdate(hospitalDepartment);
        return new ResultUtil<HospitalDepartment>().setData(hospitalDepartment);
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ApiOperation(value = "编辑科室")
    public Result<HospitalDepartment> update(HospitalDepartment hospitalDepartment){
        iHospitalDepartmentService.saveOrUpdate(hospitalDepartment);
        return new ResultUtil<HospitalDepartment>().setData(hospitalDepartment);
    }

    @RequestMapping(value = "/delByIds", method = RequestMethod.POST)
    @ApiOperation(value = "删除科室")
    public Result<Object> delByIds(@RequestParam String[] ids){
        for(String id : ids){
            iHospitalDepartmentService.removeById(id);
        }
        return ResultUtil.success();
    }
}
