package com.bcsd.entity;

/**
 * @author HOEP
 * @data 2019/4/25
 */
public class MeetUserRole {
    private String id;
    private String userid;
    private String roleid;

    @Override
    public String toString() {
        return "MeetUserRole{" +
                "id='" + id + '\'' +
                ", userid='" + userid + '\'' +
                ", roleid='" + roleid + '\'' +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getRoleid() {
        return roleid;
    }

    public void setRoleid(String roleid) {
        this.roleid = roleid;
    }
}
