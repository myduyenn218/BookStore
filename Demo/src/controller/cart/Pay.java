package controller.cart;

import Model.Cart;
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
import java.time.LocalDateTime;

@WebServlet("/cartPay")
public class Pay extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        int idOrder = user.getCart().getId_order();
        String sql;
        if (user != null) {
            try {
                Statement statement = ConnectionDB.connect();
                sql = "UPDATE orders SET  orders.statusID = 2 WHERE orders.id = '" + idOrder + "'";
                statement.executeUpdate(sql);

                Util.updateOrderDB(statement.getConnection(), user.getCart());

                sql = "INSERT INTO orders (id_customer, statusID) VALUES('" + user.getId() + "',1)";
                statement.executeUpdate(sql);
                user.getCart().setId_order(1);
                sql = "SELECT id FROM orders WHERE id_customer = '" + user.getId() + "' AND statusID = 1";
                ResultSet rs = statement.executeQuery(sql);
                user.setCart(new Cart());
                if (rs.next()) {
                    user.getCart().setId_order(rs.getInt("id"));
                }

                request.getRequestDispatcher("/customer/view/successPayment.jsp").forward(request, response);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            request.setAttribute("mess", "You need to login continue!!!");
            request.getRequestDispatcher("/customer/view/login.jsp").forward(request, response);
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
