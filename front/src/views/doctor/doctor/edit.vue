<template>
<div>
    <Card>
        <div slot="title">
            <div class="edit-head">
                <a @click="close" class="back-title">
                    <Icon type="ios-arrow-back" />返回
                </a>
                <div class="head-name">编辑</div>
                <span></span>
                <a @click="close" class="window-close">
                    <Icon type="ios-close" size="31" class="ivu-icon-ios-close" />
                </a>
            </div>
        </div>
        <Form ref="form" :model="form" :label-width="100" :rules="formValidate" label-position="left">
            <FormItem label="医生姓名" prop="name">
                <Input v-model="form.name" clearable style="width:570px" />
            </FormItem>
            <FormItem label="医生等级" prop="level">
                <Select v-model="form.level" clearable style="width:570px">
                    <Option value="主任医师">主任医师</Option>
                    <Option value="副主任医师">副主任医师</Option>
                    <Option value="主治医师">主治医师</Option>
                    <Option value="住院医师">住院医师</Option>
                </Select>
            </FormItem>
            <FormItem label="医生手机号" prop="mobile">
                <Input v-model="form.mobile" clearable style="width:570px" />
            </FormItem>
            <FormItem label="医生照片" prop="photo">
                <upload-pic-input v-model="form.photo" style="width:570px"></upload-pic-input>
            </FormItem>
            <FormItem label="所属科室" prop="departmentId">
                <Select v-model="form.departmentId" clearable style="width:570px">
                    <Option :value="item.id" v-for="(item,index) in depList" :key="index">{{item.title}}</Option>
                </Select>
            </FormItem>
            <FormItem label="医生备注" prop="remark">
                <Input v-model="form.remark" type="textarea" :rows="10" maxlength="255" show-word-limit clearable style="width:570px" />
            </FormItem>
            <Form-item class="br">
                <Button @click="handleSubmit" :loading="submitLoading" type="primary">提交并保存</Button>
                <Button @click="handleReset">重置</Button>
                <Button type="dashed" @click="close">关闭</Button>
            </Form-item>
        </Form>
    </Card>
</div>
</template>

<script>
import {
    editDoctor,
    getDoctorDepartmentList
} from "./api.js";
import uploadPicInput from "@/views/template/upload-pic-input";
export default {
    name: "edit",
    components: {
        uploadPicInput,
    },
    props: {
        data: Object
    },
    data() {
        return {
            submitLoading: false, // 表单提交状态
            form: { // 添加或编辑表单对象初始化数据
                name: "",
                level: "",
                mobile: "",
                photo: "",
                departmentId: "",
                departmentName: "",
                remark: "",
            },
            // 表单验证规则
            formValidate: {},
            depList: []
        };
    },
    methods: {
        init() {
            this.getDoctorDepartmentListFx();
            this.handleReset();
            this.form = this.data;
        },
        getDoctorDepartmentListFx() {
            var that = this;
            getDoctorDepartmentList().then(res => {
                if (res.success) {
                    that.depList = res.result;
                }
            })
        },
        handleReset() {
            this.$refs.form.resetFields();
        },
        handleSubmit() {
            this.$refs.form.validate(valid => {
                if (valid) {
                    editDoctor(this.form).then(res => {
                        this.submitLoading = false;
                        if (res.success) {
                            this.$Message.success("操作成功");
                            this.submited();
                        }
                    });
                }
            });
        },
        close() {
            this.$emit("close", true);
        },
        submited() {
            this.$emit("submited", true);
        }
    },
    mounted() {
        this.init();
    }
};
</script>

<style lang="less">
// 建议引入通用样式 具体路径自行修改 可删除下面样式代码
// @import "../../../styles/single-common.less";
.edit-head {
    display: flex;
    align-items: center;
    justify-content: space-between;
    position: relative;

    .back-title {
        color: #515a6e;
        display: flex;
        align-items: center;
    }

    .head-name {
        display: inline-block;
        height: 20px;
        line-height: 20px;
        font-size: 16px;
        color: #17233d;
        font-weight: 500;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    .window-close {
        z-index: 1;
        font-size: 12px;
        position: absolute;
        right: 0px;
        top: -5px;
        overflow: hidden;
        cursor: pointer;

        .ivu-icon-ios-close {
            color: #999;
            transition: color .2s ease;
        }
    }

    .window-close .ivu-icon-ios-close:hover {
        color: #444;
    }
}
</style>
