package db;

import java.sql.*;

public class ConnectionDB {
    static Connection con;

    public static Statement connect() throws ClassNotFoundException, SQLException {
        if (con == null || con.isClosed()) {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = System.getenv("DB_URL") != null? System.getenv("DB_URL"): "jdbc:mysql://localhost:3306/demoweb?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Ho_Chi_Minh";
            String username = System.getenv("DB_USERNAME") != null? System.getenv("DB_USERNAME"): "root";
            String password = System.getenv("DB_PASSWORD") != null? System.getenv("DB_PASSWORD"): "";
            con = DriverManager.getConnection(url, username, password);
            PreparedStatement pst =con.prepareStatement("SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));");
            pst.execute();
            return con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
        } else {
            return con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
        }

    }

//    public static void main(String[] args) throws Exception {
//        Statement s = ConnectionDB.connect();
//        ResultSet rs = s.executeQuery("select * from users");
////        int i=rs.
//        rs.last();
//        System.out.println(rs.getRow());
//        rs.beforeFirst();
//        while (rs.next()) {
//            System.out.println(rs.getString(2));
//        }
//    }

}
