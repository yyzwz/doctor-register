<template>
<div class="search">
    <Card v-show="currView=='img'">
        <Row>
            <Col span="24">
            <img src="../../../assets/message.png" style="width: 100%;" :height="tableHeight" />
            </Col>
        </Row>
        <Row>
            <i-switch @on-change="changeSwitch" /> 我已阅读疫情健康提示和挂号须知
        </Row>
    </Card>
    <Card v-show="currView=='index'">
        <Row>
            <Col v-for="(item, index) in data" :key="index" style="display:inline-block" @click.native="selectOneRoom(item)">
            <Card class="card-main">
                <Row class="img-box">
                    <img src="../../../assets/icon/roomStatus1.png" class="row-img" />
                </Row>
                <Row style="display:flex;flexDirection:column;alignItems:center">
                    <div class="roomNumber">
                        <span class="row-p yellow">{{ item.title }}</span>
                    </div>
                </Row>
                <div class="tips">
                    {{ item.remark }}
                </div>
                <div class="tips">
                    <Button @click="selectOneRoom(item)" type="info" size="small" icon="ios-create-outline" ghost>选择</Button>
                </div>
            </Card>
            </Col>
        </Row>
    </Card>
    <Card v-show="currView=='doctor'">
        <Row>
            <Button type="success" @click="currView='index'">返回</Button>
        </Row>
        <Row>
            <Col v-for="(item, index) in doctorList" :key="index" style="display:inline-block">
            <Card class="card-main">
                <Row class="img-box">
                    <img :src="item.photo" class="row-img" />
                </Row>
                <Row style="display:flex;flexDirection:column;alignItems:center">
                    <div class="roomNumber">
                        <span class="row-p yellow">{{ item.name }} 【{{item.level}}】</span>
                    </div>
                </Row>
                <div class="tips">
                    {{ item.remark }}
                </div>
                <div class="tips" v-show="item.numberStr > 0">
                    剩余{{ item.numberStr }}个号源
                </div>
                <div class="tips" v-show="item.numberStr < 1">
                    请次日预约
                </div>
                <div class="tips">
                    <Button @click="addOrderFx(item)" type="info" size="small" icon="ios-create-outline" :disabled="item.numberStr<1" ghost>预约</Button>
                </div>
            </Card>
            </Col>
        </Row>
    </Card>
</div>
</template>

<script>
import {
    getHospitalDepartmentList,
    getAllDoctorByDepartmentId,
    addOrder
} from "./api.js";
export default {
    name: "single-window",
    components: {},
    data() {
        return {
            currView: "img",
            data: [],
            mySelectRow: {
                id: ""
            },
            doctorList: [],
            tableHeight: 500
        };
    },
    methods: {
        init() {
            this.getDataList();
        },
        changeSwitch(e) {
            if(e) {
                this.currView = "index";
            }
        },
        addOrderFx(e) {
            var that = this;
            addOrder({
                doctorId: e.id
            }).then(res => {
                if (res.success) {
                    this.$Message.success("预约成功");
                    that.currView = "index";
                    that.getDataList();
                }
            });
        },
        selectOneRoom(e) {
            this.currView = "doctor";
            this.mySelectRow = e;
            this.getAllDoctorByDepartmentIdFx();
        },
        getAllDoctorByDepartmentIdFx() {
            var that = this;
            getAllDoctorByDepartmentId({
                departmentId: that.mySelectRow.id
            }).then(res => {
                if (res.success) {
                    that.doctorList = res.result;
                }
            })
        },
        getDataList() {
            this.loading = true;
            getHospitalDepartmentList().then(res => {
                this.loading = false;
                if (res.success) {
                    this.data = res.result;
                }
            });
        },
    },
    mounted() {
        this.init();
        this.tableHeight = Number(window.innerHeight - 273);
    },
};
</script>

<style lang="less">
.search {
    .operation {
        margin-bottom: 2vh;
    }

    .select-count {
        font-weight: 600;
        color: #40a9ff;
    }

    .select-clear {
        margin-left: 10px;
    }

    .page {
        margin-top: 2vh;
    }

    .drop-down {
        margin-left: 5px;
    }
}

.filter-panel {
    width: 166px;
    min-height: 120px;
    height: 200px;
    position: absolute;
    background-color: white;
    z-index: 9999;
    margin-left: 1px;
    overflow-y: scroll;
    border: 1px solid blue;
    top: 35px;
    right: 10px;
}

.openSearch {
    position: absolute;
    right: 240px;
}

.openTip {
    position: absolute;
    right: 130px;
}

.showFilterPanelFlag {
    position: static !important;
    right: 10px;
    margin-right: 10px;
}

.ivu-table td {
    height: 38px !important;
}

.ivu-table-cell-with-expand {
    height: 38px !important;
    line-height: 38px !important;
}

.ivu-table .rowClassNmaeColor td {
    background-color: #b0b3b6 !important;
    color: #ffffff !important;
    font-size: 12px;
}

card-main {
    display: flex;
    flex-direction: column;
    margin: 5px;
    width: 200px;
    height: 340px;
}

.img-box {
    width: 100%;
    display: flex;
    justify-content: center;
}

.row-img {
    width: 150px;
    height: 150px;
    margin: 0 auto;
}

.row-p {
    font-size: 18px;
    font-weight: 500;
    color: #000;
}

.roomNumber {
    display: flex;
}

.tips {
    margin-top: 2px;
    padding-top: 2px;
    border-top: 1px dashed rgb(243, 144, 30);
    text-align: center;
    font-size: 16px;
}

.roomNumberText {
    width: 130px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    margin-top: 5%;

    p {
        margin-top: 10%;
    }

    span {
        margin-top: 10%;
    }
}

.roomTitleName {
    display: flex;
    align-items: center;
    justify-content: space-between;
}
</style>
