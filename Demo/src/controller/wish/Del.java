package controller.wish;

import Model.User;
import Util.Util;
import db.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/delWish")
public class Del extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        int bookID = Integer.parseInt((String) Util.getParameterGeneric(request, "bookID", ""));
        int idWish = user.getWishlist().getId();
        try {
            Statement statement = ConnectionDB.connect();
            String sql = "SELECT * FROM orderdetails WHERE orderdetails.id_order = '" + idWish + "' AND id_book = '" + bookID + "'";
            ResultSet rs = statement.executeQuery(sql);
            if (rs.next()) {
                rs.deleteRow();
            }
            user.getWishlist().remove(bookID);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        response.getWriter().write("");
        response.getWriter().flush();
        response.getWriter().close();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
