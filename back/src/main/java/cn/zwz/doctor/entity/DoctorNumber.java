package cn.zwz.doctor.entity;

import cn.zwz.basics.baseClass.ZwzBaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author 郑为中
 */
@Data
@Entity
@DynamicInsert
@DynamicUpdate
@Table(name = "a_doctor_number")
@TableName("a_doctor_number")
@ApiModel(value = "医生号源")
public class DoctorNumber extends ZwzBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "医生ID")
    private String doctorId;

    @ApiModelProperty(value = "医生名称")
    private String doctorName;

    @ApiModelProperty(value = "科室ID")
    private String departmentId;

    @ApiModelProperty(value = "科室名称")
    private String departmentName;

    @ApiModelProperty(value = "号源日期")
    private String date;

    @ApiModelProperty(value = "是否预约")
    private boolean orderFlag;

    @ApiModelProperty(value = "预约人")
    private String orderId;

    @ApiModelProperty(value = "预约人姓名")
    private String orderName;

    @ApiModelProperty(value = "预约时间")
    private String orderTime;

    @ApiModelProperty(value = "是否支付")
    private boolean payFlag;

    @ApiModelProperty(value = "支付时间")
    private String payTime;
}