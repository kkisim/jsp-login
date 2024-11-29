package dao;

import java.sql.*;
import java.util.Date;


public class UserBean {
    private String id; 
    private String ps;
    private String name;
    private String phone;
    private String emailPrefix;
    private String emailDomain;
    private String birthYear;
    private String birthMonth;
    private String birthDay;

    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getPs() {
        return ps;
    }
    public void setPs(String ps) {
        this.ps = ps;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmailPrefix() {
        return emailPrefix;
    }
    public void setEmailPrefix(String emailPrefix) {
        this.emailPrefix = emailPrefix;
    }
    public String getEmailDomain() {
        return emailDomain;
    }
    public void setEmailDomain(String emailDomain) {
        this.emailDomain = emailDomain;
    }
    
    public String getBirthYear() {
        return birthYear;
    }
    public void setBirthYear(String birthYear) {
        this.birthYear = birthYear;
    }
    public String getBirthMonth() {
        return birthMonth;
    }
    public void setBirthMonth(String birthMonth) {
        this.birthMonth = birthMonth;
    }
    public String getBirthDay() {
        return birthDay;
    }
    public void setBirthDay(String birthDay) {
        this.birthDay = birthDay;
    }

    public String getEmail() {
        return emailPrefix + "@" + emailDomain;
    }

    public String getBirthDate() {
        return birthYear + "-" + birthMonth + "-" + birthDay;
    }
}
