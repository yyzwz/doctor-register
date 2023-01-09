package cn.zwz.doctor.serviceimpl;

import cn.zwz.doctor.mapper.HospitalDepartmentMapper;
import cn.zwz.doctor.entity.HospitalDepartment;
import cn.zwz.doctor.service.IHospitalDepartmentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 科室 服务层接口实现
 * @author 郑为中
 */
@Slf4j
@Service
@Transactional
public class IHospitalDepartmentServiceImpl extends ServiceImpl<HospitalDepartmentMapper, HospitalDepartment> implements IHospitalDepartmentService {

    @Autowired
    private HospitalDepartmentMapper hospitalDepartmentMapper;
}