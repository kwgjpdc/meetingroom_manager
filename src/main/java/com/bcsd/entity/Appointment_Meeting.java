package com.bcsd.entity;

import java.io.Serializable;

public class Appointment_Meeting implements Serializable {
    private Integer id;
    private String name;
    private Integer url;
    private String requirecallid;
    private String defaultlayout;
    private Integer callid;
    private String nonmemberaccess;
    private String callProfile;
    private String callLegprofile;

    public Appointment_Meeting() {
        super();
    }
    public Appointment_Meeting(String name, Integer url, String requirecallid, String defaultlayout, Integer callid,
                               String nonmemberaccess, String callProfile, String callLegprofile) {
        super();
        this.name = name;
        this.url = url;
        this.requirecallid = requirecallid;
        this.defaultlayout = defaultlayout;
        this.callid = callid;
        this.nonmemberaccess = nonmemberaccess;
        this.callProfile = callProfile;
        this.callLegprofile = callLegprofile;
    }
    public Appointment_Meeting(Integer id, String name, Integer url, String requirecallid, String defaultlayout,
                               Integer callid, String nonmemberaccess, String callProfile, String callLegprofile) {
        super();
        this.id = id;
        this.name = name;
        this.url = url;
        this.requirecallid = requirecallid;
        this.defaultlayout = defaultlayout;
        this.callid = callid;
        this.nonmemberaccess = nonmemberaccess;
        this.callProfile = callProfile;
        this.callLegprofile = callLegprofile;
    }
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public Integer getUrl() {
        return url;
    }
    public void setUrl(Integer url) {
        this.url = url;
    }
    public String getRequirecallid() {
        return requirecallid;
    }
    public void setRequirecallid(String requirecallid) {
        this.requirecallid = requirecallid;
    }
    public String getDefaultlayout() {
        return defaultlayout;
    }
    public void setDefaultlayout(String defaultlayout) {
        this.defaultlayout = defaultlayout;
    }
    public Integer getCallid() {
        return callid;
    }
    public void setCallid(Integer callid) {
        this.callid = callid;
    }
    public String getNonmemberaccess() {
        return nonmemberaccess;
    }
    public void setNonmemberaccess(String nonmemberaccess) {
        this.nonmemberaccess = nonmemberaccess;
    }
    public String getCallProfile() {
        return callProfile;
    }
    public void setCallProfile(String callProfile) {
        this.callProfile = callProfile;
    }
    public String getCallLegprofile() {
        return callLegprofile;
    }
    public void setCallLegprofile(String callLegprofile) {
        this.callLegprofile = callLegprofile;
    }
    @Override
    public String toString() {
        return "appointment_meeting [id=" + id + ", name=" + name + ", url=" + url + ", requirecallid=" + requirecallid
                + ", defaultlayout=" + defaultlayout + ", callid=" + callid + ", nonmemberaccess=" + nonmemberaccess
                + ", callProfile=" + callProfile + ", callLegprofile=" + callLegprofile + "]";
    }


}
