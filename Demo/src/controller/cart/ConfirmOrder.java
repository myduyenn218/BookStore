package controller.cart;

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

@WebServlet("/ConfirmOrder")
public class ConfirmOrder extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        request.setAttribute("name", user.getFullName());
        request.setAttribute("phone", user.getPhone());
        request.setAttribute("address", user.getAddress());
        request.getRequestDispatcher("/customer/view/confirm-Order.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

            request.getRequestDispatcher("/customer/view/successPayment.jsp").forward(request, response);

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
