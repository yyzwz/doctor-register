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
@Table(name = "a_doctor")
@TableName("a_doctor")
@ApiModel(value = "医生")
public class Doctor extends ZwzBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "医生姓名")
    private String name;

    @ApiModelProperty(value = "医生等级")
    private String level;

    @ApiModelProperty(value = "医生手机号")
    private String mobile;

    @ApiModelProperty(value = "医生照片")
    private String photo;

    @ApiModelProperty(value = "医生所属科室ID")
    private String departmentId;

    @Transient
    @TableField(exist=false)
    @ApiModelProperty(value = "医生所属科室")
    private String departmentName;

    @ApiModelProperty(value = "医生备注")
    private String remark;

    @Transient
    @TableField(exist=false)
    @ApiModelProperty(value = "号源信息")
    private Long numberStr;
}