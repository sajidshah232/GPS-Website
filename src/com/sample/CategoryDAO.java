package com.sample;

import static com.sample.DBUtils.Connect;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

public class CategoryDAO {
    
    public static void AddCategory(String cname) throws Exception {
        
    }
    
    public static Map<Integer,String> getCategories() throws Exception {
        Map<Integer,String> list = new HashMap<>();
        Connection con = Connect();
        ResultSet rs = con.createStatement().executeQuery("SELECT * from category");
        while (rs.next()) {            
            list.put(rs.getInt("catid"),rs.getString("category"));
        }
        con.close();
        return list;
    }
    
    public static int totalCategories() throws Exception {
        Connection con=Connect();
        ResultSet rs=con.createStatement().executeQuery("SELECT count(*) from category");
        rs.next();
        int total=rs.getInt(1);
        con.close();
        return total;
    }
    
    public static int productInCategory(String cat) throws Exception {
        Connection con=Connect();
        ResultSet rs=con.createStatement().executeQuery("SELECT count(*) from product where pcat='"+cat+"'");
        rs.next();
        int total=rs.getInt(1);
        con.close();
        return total;
    }
    
    public static void deleteCategory(String cat) throws Exception {
        Connection con=Connect();
        con.createStatement().executeUpdate("DELETE from category where category='"+cat+"'");                
        con.close();
    }
}
