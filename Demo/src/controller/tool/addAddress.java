package controller.tool;

import Model.User;
import Util.Util;
import db.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/addAddress")
public class addAddress extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String full_name = Util.getParameterGeneric(request, "full_name", "");
        String telephone = Util.getParameterGeneric(request, "telephone", "");
        String address = Util.getParameterGeneric(request, "address", "");

        User user = (User) request.getSession().getAttribute("user");

        String sql;
        Statement statement = null;
        try {
            statement = ConnectionDB.connect();
            Connection conn = statement.getConnection();


            sql = "select * from users where id=?";
            PreparedStatement pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            pstmt.setInt(1, user.getId());
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                user.setFullName(full_name);
                user.setAddress(address);
                user.setPhone(telephone);
                rs.updateString("fullname", full_name);
                rs.updateString("address", address);
                rs.updateString("phone", telephone);
                rs.updateRow();
            }

            request.getSession().setAttribute("mess", "Adding address successfully!!!");
            response.sendRedirect(Util.fullPath("account/address"));

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
