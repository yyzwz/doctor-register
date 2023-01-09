package cn.zwz.doctor.controller;

import cn.hutool.core.date.DateUtil;
import cn.zwz.basics.utils.PageUtil;
import cn.zwz.basics.utils.ResultUtil;
import cn.zwz.basics.baseVo.PageVo;
import cn.zwz.basics.baseVo.Result;
import cn.zwz.basics.utils.SecurityUtil;
import cn.zwz.data.entity.User;
import cn.zwz.data.utils.ZwzNullUtils;
import cn.zwz.doctor.entity.Doctor;
import cn.zwz.doctor.entity.DoctorNumber;
import cn.zwz.doctor.entity.HospitalDepartment;
import cn.zwz.doctor.service.IDoctorNumberService;
import cn.hutool.core.util.StrUtil;
import cn.zwz.doctor.service.IDoctorService;
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
@Api(tags = "医生号源管理接口")
@RequestMapping("/zwz/doctorNumber")
@Transactional
public class DoctorNumberController {

    @Autowired
    private IDoctorNumberService iDoctorNumberService;

    @Autowired
    private SecurityUtil securityUtil;

    @Autowired
    private IDoctorService iDoctorService;

    @Autowired
    private IHospitalDepartmentService iHospitalDepartmentService;

    @RequestMapping(value = "/fangOrder", method = RequestMethod.POST)
    @ApiOperation(value = "发放号源")
    public Result<Object> fangOrder(@RequestParam String doctorId,@RequestParam String date,@RequestParam Integer number){
        Doctor doctor = iDoctorService.getById(doctorId);
        if(doctor == null) {
            return ResultUtil.error("医生不存在");
        }
        HospitalDepartment hd = iHospitalDepartmentService.getById(doctor.getDepartmentId());
        if(hd == null) {
            return ResultUtil.error("科室不存在");
        }
        for(int i = 0; i < number; i ++) {
            DoctorNumber vo = new DoctorNumber();
            vo.setDoctorId(doctor.getId());
            vo.setDoctorName(doctor.getName());
            vo.setDepartmentId(hd.getId());
            vo.setDepartmentName(hd.getTitle());
            vo.setDate(date);
            vo.setOrderFlag(false);
            vo.setOrderId("");
            vo.setOrderName("");
            vo.setOrderTime("");
            vo.setPayFlag(false);
            vo.setPayTime("");
            iDoctorNumberService.saveOrUpdate(vo);
        }
        return ResultUtil.success();
    }

    @RequestMapping(value = "/addOrder", method = RequestMethod.POST)
    @ApiOperation(value = "预约号源")
    public Result<Object> addOrder(@RequestParam String doctorId){
        QueryWrapper<DoctorNumber> qw = new QueryWrapper<>();
        qw.eq("doctor_id",doctorId);
        qw.eq("date", DateUtil.today());
        List<DoctorNumber> numberList = iDoctorNumberService.list(qw);
        if(numberList.size() < 1) {
            return ResultUtil.error("您手速慢啦，号源没有了");
        }
        User currUser = securityUtil.getCurrUser();
        DoctorNumber dn = numberList.get(0);
        dn.setOrderFlag(true);
        dn.setOrderId(currUser.getId());
        dn.setOrderName(currUser.getNickname());
        dn.setOrderTime(DateUtil.now());
        iDoctorNumberService.saveOrUpdate(dn);
        return ResultUtil.success();
    }

    @RequestMapping(value = "/addSuperOrder", method = RequestMethod.POST)
    @ApiOperation(value = "预约特约号源")
    public Result<Object> addSuperOrder(@RequestParam String doctorId){
        Doctor doctor = iDoctorService.getById(doctorId);
        if(doctor == null) {
            return ResultUtil.error("医生不存在");
        }
        User currUser = securityUtil.getCurrUser();
        DoctorNumber dn = new DoctorNumber();
        dn.setDoctorId(doctor.getId());
        dn.setDoctorName(doctor.getName());
        dn.setDepartmentId(doctor.getDepartmentId());
        dn.setDepartmentName(doctor.getDepartmentName());
        dn.setDate(DateUtil.today());
        dn.setOrderFlag(true);
        dn.setOrderId(currUser.getId());
        dn.setOrderName(currUser.getNickname());
        dn.setOrderTime(DateUtil.now());
        dn.setPayFlag(false);
        dn.setPayTime("");
        iDoctorNumberService.saveOrUpdate(dn);
        return ResultUtil.success();
    }

    @RequestMapping(value = "/pay", method = RequestMethod.POST)
    @ApiOperation(value = "支付号源费用")
    public Result<Object> pay(@RequestParam String id){
        DoctorNumber dn = iDoctorNumberService.getById(id);
        if(dn == null) {
            return ResultUtil.error("号源不存在");
        }
        if(dn.isPayFlag()) {
            return ResultUtil.error("已支付，无需重复支付");
        }
        dn.setPayFlag(true);
        dn.setPayTime(DateUtil.now());
        iDoctorNumberService.saveOrUpdate(dn);
        return ResultUtil.success();
    }

    @RequestMapping(value = "/quXiaoOrder", method = RequestMethod.POST)
    @ApiOperation(value = "支付号源费用")
    public Result<Object> quXiaoOrder(@RequestParam String id){
        DoctorNumber dn = iDoctorNumberService.getById(id);
        if(dn == null) {
            return ResultUtil.error("号源不存在");
        }
        if(!dn.isOrderFlag()) {
            return ResultUtil.error("号源未被预约，无需取消");
        }
        dn.setOrderId("");
        dn.setOrderTime("");
        dn.setOrderName("");
        dn.setOrderFlag(false);
        iDoctorNumberService.saveOrUpdate(dn);
        return ResultUtil.success();
    }

    @RequestMapping(value = "/getOne", method = RequestMethod.GET)
    @ApiOperation(value = "查询单条医生号源")
    public Result<DoctorNumber> get(@RequestParam String id){
        return new ResultUtil<DoctorNumber>().setData(iDoctorNumberService.getById(id));
    }

    @RequestMapping(value = "/count", method = RequestMethod.GET)
    @ApiOperation(value = "查询全部医生号源个数")
    public Result<Long> getCount(){
        return new ResultUtil<Long>().setData(iDoctorNumberService.count());
    }

    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    @ApiOperation(value = "查询全部医生号源")
    public Result<List<DoctorNumber>> getAll(){
        return new ResultUtil<List<DoctorNumber>>().setData(iDoctorNumberService.list());
    }

    @RequestMapping(value = "/getByPage", method = RequestMethod.GET)
    @ApiOperation(value = "查询医生号源")
    public Result<IPage<DoctorNumber>> getByPage(@ModelAttribute DoctorNumber doctorNumber ,@ModelAttribute PageVo page){
        QueryWrapper<DoctorNumber> qw = new QueryWrapper<>();
        if(!ZwzNullUtils.isNull(doctorNumber.getDoctorName())) {
            qw.inSql("id","select id form a_doctor_number where doctor_id in (select id from a_doctor where name like '%" + doctorNumber.getDoctorName() + "%')");
        }
        if(!ZwzNullUtils.isNull(doctorNumber.getDate())) {
            qw.eq("date",doctorNumber.getDate());
        }
        qw.eq("order_id",securityUtil.getCurrUser().getId());
        IPage<DoctorNumber> data = iDoctorNumberService.page(PageUtil.initMpPage(page),qw);
        return new ResultUtil<IPage<DoctorNumber>>().setData(data);
    }

    @RequestMapping(value = "/insertOrUpdate", method = RequestMethod.POST)
    @ApiOperation(value = "增改医生号源")
    public Result<DoctorNumber> saveOrUpdate(DoctorNumber doctorNumber){
        if(iDoctorNumberService.saveOrUpdate(doctorNumber)){
            return new ResultUtil<DoctorNumber>().setData(doctorNumber);
        }
        return ResultUtil.error();
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    @ApiOperation(value = "新增医生号源")
    public Result<DoctorNumber> insert(DoctorNumber doctorNumber){
        iDoctorNumberService.saveOrUpdate(doctorNumber);
        return new ResultUtil<DoctorNumber>().setData(doctorNumber);
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ApiOperation(value = "编辑医生号源")
    public Result<DoctorNumber> update(DoctorNumber doctorNumber){
        iDoctorNumberService.saveOrUpdate(doctorNumber);
        return new ResultUtil<DoctorNumber>().setData(doctorNumber);
    }

    @RequestMapping(value = "/delByIds", method = RequestMethod.POST)
    @ApiOperation(value = "删除医生号源")
    public Result<Object> delByIds(@RequestParam String[] ids){
        for(String id : ids){
            iDoctorNumberService.removeById(id);
        }
        return ResultUtil.success();
    }
}
