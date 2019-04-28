package com.bcsd.dao;

public class UserInternal {

    private int id;
    private String name;
    private String tel;
    private String email;
    private String sex;
    private String dept;
    private String company;
    private String username;
    private int internal;
    private int status;

    @Override
    public String toString() {
        return "UserInternal{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", tel='" + tel + '\'' +
                ", email='" + email + '\'' +
                ", sex='" + sex + '\'' +
                ", dept='" + dept + '\'' +
                ", company='" + company + '\'' +
                ", username='" + username + '\'' +
                ", internal=" + internal +
                ", status=" + status +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getInternal() {
        return internal;
    }

    public void setInternal(int internal) {
        this.internal = internal;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
