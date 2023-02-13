package com.sample;

import static com.sample.DBUtils.Connect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO {
    public static void addCustomer(Customer c) throws Exception {
        Connection con=Connect();
        PreparedStatement ps=con.prepareStatement("INSERT INTO users(fname,lname,userid,pwd) VALUES(?,?,?,?)");
        ps.setString(1, c.getFname());
        ps.setString(2, c.getLname());
        ps.setString(3, c.getUserid());
        ps.setString(4, c.getPwd());
        ps.executeUpdate();
        con.close();
    }
    
    public static List<Customer> getCustomers() throws Exception {
        List<Customer> list=new ArrayList<>();
        Connection con=Connect();
        ResultSet rs=con.createStatement().executeQuery("SELECT * from users");
        while(rs.next()){
            Customer c=new Customer();
            c.setFname(rs.getString("fname"));
            c.setLname(rs.getString("lname"));
            c.setUserid(rs.getString("userid"));
            c.setPwd(rs.getString("pwd"));
            list.add(c);
        }
        con.close();
        return list;
    }
    
    public static Customer findByID(String userid) throws Exception {
        return null;
    }
    
    public static void removeCustomer(String userid) throws Exception {
        
    }
    
    public static void updateCustomer(Customer c) throws Exception {
        
    }
    
    public static int totalCustomers() throws Exception {
        Connection con=Connect();
        ResultSet rs=con.createStatement().executeQuery("select count(*) from users where role='Customer'");
        rs.next();
        int res=rs.getInt(1);
        con.close();
        return res;
    }
    
    public static void saveAddress(Address add) throws Exception {
        
    }
}
