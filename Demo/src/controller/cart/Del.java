package controller.cart;

import Model.Cart;
import Model.Product;
import Model.User;
import Util.Util;
import db.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;
import java.time.LocalDateTime;


@WebServlet("/DelProduct")
public class Del extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            String sql;
            Statement statement = ConnectionDB.connect();
//            Connection conn = statement.getConnection();
            ResultSet rs;

            HttpSession session = request.getSession();
            int id = Integer.parseInt((String) Util.getParameterGeneric(request, "bookID", ""));
            User user = (User) session.getAttribute("user");
            Cart cart = null;
            if (user == null) {
                cart = (Cart) session.getAttribute("cart");
            } else {
                cart = user.getCart();
                sql = "SELECT * FROM orderdetails WHERE  orderdetails.id_book =  '" + id + "' and  orderdetails.id_order in (SELECT id FROM orders WHERE orders.id_customer = '" + user.getId() + "') ";
                rs = statement.executeQuery(sql);
                if (rs.next()) {
                    rs.deleteRow();
                }
            }
            cart.remove(id);

            Util.updateOrderDB(statement.getConnection(), cart);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        response.getWriter().write("true");
        response.getWriter().flush();
        response.getWriter().close();
    }
}