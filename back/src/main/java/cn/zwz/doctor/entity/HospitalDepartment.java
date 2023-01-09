package cn.zwz.doctor.entity;

import cn.zwz.basics.baseClass.ZwzBaseEntity;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * @author 郑为中
 */
@Data
@Entity
@DynamicInsert
@DynamicUpdate
@Table(name = "a_hospital_department")
@TableName("a_hospital_department")
@ApiModel(value = "科室")
public class HospitalDepartment extends ZwzBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "科室标题")
    private String title;

    @ApiModelProperty(value = "科室介绍")
    private String remark;

    @Transient
    @TableField(exist=false)
    @ApiModelProperty(value = "科室人数")
    private Long userNumber;
}