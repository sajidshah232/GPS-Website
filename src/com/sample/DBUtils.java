package com.sample;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class DBUtils {

    public static Connection Connect() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        final String url = "jdbc:mysql://localhost/jshopdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
        Connection con = DriverManager.getConnection(url, "root", "12345");
        return con;
    }

    public static int getCount(String table) throws Exception {
        Connection con = Connect();
        ResultSet rs = con.createStatement().executeQuery("select count(*) from " + table);
        rs.next();
        return rs.getInt(1);
    }

    public static String getName(String userid) throws Exception {
        Connection con = Connect();
        ResultSet rs = con.createStatement().executeQuery("select * from users where userid='" + userid + "'");
        rs.next();
        return rs.getString(1) + " " + rs.getString(2);
    }

    public static List<String> getCategory() throws Exception {
        List<String> list = new ArrayList<>();
        Connection con = Connect();
        ResultSet rs = con.createStatement().executeQuery("select category from category");
        while (rs.next()) {
            list.add(rs.getString(1));
        }
        return list;
    }

    public static String formatDate(String date) throws Exception {
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss a");
        SimpleDateFormat src = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        java.util.Date od = src.parse(date);
        return sdf.format(od);
    }
}
