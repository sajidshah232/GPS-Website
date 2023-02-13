package com.sample;

public class Customer {
    private String fname;
    private String lname;
    private String userid;
    private String pwd;
    private Address address;

    public Customer() {
    }

    
    public Customer(String fname, String lname, String userid, String pwd) {
        this.fname = fname;
        this.lname = lname;
        this.userid = userid;
        this.pwd = pwd;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }
    
    

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
    
    
}
