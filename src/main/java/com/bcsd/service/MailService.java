package com.bcsd.service;

import com.bcsd.entity.Mail;

import java.util.List;


public interface MailService {
    List<Mail> findAll(String status);
    List<Mail> findPage(String status,int pageNum,int pageSize);
    void add(Mail mail);
    Mail findByid(int id);
    void update(Mail mail);
}
