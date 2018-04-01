package cn.slkj.jzlj.model;

public class Transport {


    private String id;
    private String carId;// 车辆id
    private String carNumber;// 车牌号
    private String zNumber;// 第号
    private String czzId;// 建设单位
    private String jsUnit;// 建设单位
    private String gcName;// 工程名称
    private String site;// 施工地点
    private String approved;//核准状态
    private String avTime;//核准时间
    private String czy;//操作员

    private String groupName;
    private String czArea;// 处置场地
    private String line;// 路线
    private String vdTimeStart;// 有效期起
    private String vdTimeEend;// 有效期止
    private String managers;// 经办人
    private String entryTime;// 录入时间
    private String groupId;// 车辆ID
    private String jdGroupId;// 借调车辆ID
    private String nowTime;//点击查询的时候记录当前时间

    public String getAvTime() {
        return avTime;
    }

    public void setAvTime(String avTime) {
        this.avTime = avTime;
    }

    public String getCzy() {
        return czy;
    }

    public void setCzy(String czy) {
        this.czy = czy;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCarId() {
        return carId;
    }

    public void setCarId(String carId) {
        this.carId = carId;
    }

    public String getCarNumber() {
        return carNumber;
    }

    public void setCarNumber(String carNumber) {
        this.carNumber = carNumber;
    }

    public String getzNumber() {
        return zNumber;
    }

    public void setzNumber(String zNumber) {
        this.zNumber = zNumber;
    }

    public String getCzzId() {
        return czzId;
    }

    public void setCzzId(String czzId) {
        this.czzId = czzId;
    }

    public String getJsUnit() {
        return jsUnit;
    }

    public void setJsUnit(String jsUnit) {
        this.jsUnit = jsUnit;
    }

    public String getGcName() {
        return gcName;
    }

    public void setGcName(String gcName) {
        this.gcName = gcName;
    }

    public String getSite() {
        return site;
    }

    public void setSite(String site) {
        this.site = site;
    }

    public String getApproved() {
        return approved;
    }

    public void setApproved(String approved) {
        this.approved = approved;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public String getCzArea() {
        return czArea;
    }

    public void setCzArea(String czArea) {
        this.czArea = czArea;
    }

    public String getLine() {
        return line;
    }

    public void setLine(String line) {
        this.line = line;
    }

    public String getVdTimeStart() {
        return vdTimeStart;
    }

    public void setVdTimeStart(String vdTimeStart) {
        this.vdTimeStart = vdTimeStart;
    }

    public String getVdTimeEend() {
        return vdTimeEend;
    }

    public void setVdTimeEend(String vdTimeEend) {
        this.vdTimeEend = vdTimeEend;
    }

    public String getManagers() {
        return managers;
    }

    public void setManagers(String managers) {
        this.managers = managers;
    }

    public String getEntryTime() {
        return entryTime;
    }

    public void setEntryTime(String entryTime) {
        this.entryTime = entryTime;
    }

    public String getGroupId() {
        return groupId;
    }

    public void setGroupId(String groupId) {
        this.groupId = groupId;
    }

    public String getJdGroupId() {
        return jdGroupId;
    }

    public void setJdGroupId(String jdGroupId) {
        this.jdGroupId = jdGroupId;
    }

    public String getNowTime() { return nowTime; }

    public void setNowTime(String nowTime) {
        this.nowTime = nowTime;
    }

    @Override
    public String toString() {
        return "Transport{" +
                "id='" + id + '\'' +
                ", carId='" + carId + '\'' +
                ", carNumber='" + carNumber + '\'' +
                ", zNumber='" + zNumber + '\'' +
                ", czzId='" + czzId + '\'' +
                ", jsUnit='" + jsUnit + '\'' +
                ", gcName='" + gcName + '\'' +
                ", site='" + site + '\'' +
                ", approved='" + approved + '\'' +
                ", groupName='" + groupName + '\'' +
                ", czArea='" + czArea + '\'' +
                ", line='" + line + '\'' +
                ", vdTimeStart='" + vdTimeStart + '\'' +
                ", vdTimeEend='" + vdTimeEend + '\'' +
                ", managers='" + managers + '\'' +
                ", entryTime='" + entryTime + '\'' +
                ", groupId='" + groupId + '\'' +
                ", jdGroupId='" + jdGroupId + '\'' +
                ", nowTime='" + nowTime + '\'' +
                '}';
    }
}
