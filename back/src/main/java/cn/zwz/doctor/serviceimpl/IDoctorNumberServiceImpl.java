package cn.zwz.doctor.serviceimpl;

import cn.zwz.doctor.mapper.DoctorNumberMapper;
import cn.zwz.doctor.entity.DoctorNumber;
import cn.zwz.doctor.service.IDoctorNumberService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 医生号源 服务层接口实现
 * @author 郑为中
 */
@Slf4j
@Service
@Transactional
public class IDoctorNumberServiceImpl extends ServiceImpl<DoctorNumberMapper, DoctorNumber> implements IDoctorNumberService {

    @Autowired
    private DoctorNumberMapper doctorNumberMapper;
}