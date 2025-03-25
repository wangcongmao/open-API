package com.yupi.yuapiclientsdk.temp;

import java.util.Date;
@Deprecated
public class DataserviceDeviceData {

    private static final long serialVersionUID = 1L;
    private String dataDeviceId;        // 设备编号
    private String dataDeviceData;        // 设备数据
    private Date dataTestDate;        // 测试时间

    public DataserviceDeviceData() {

    }



    public String getDataDeviceId() {
        return dataDeviceId;
    }

    public void setDataDeviceId(String dataDeviceId) {
        this.dataDeviceId = dataDeviceId;
    }


    public String getDataDeviceData() {
        return dataDeviceData;
    }

    public void setDataDeviceData(String dataDeviceData) {
        this.dataDeviceData = dataDeviceData;
    }


    public Date getDataTestDate() {
        return dataTestDate;
    }

    public void setDataTestDate(Date dataTestDate) {
        this.dataTestDate = dataTestDate;
    }




}