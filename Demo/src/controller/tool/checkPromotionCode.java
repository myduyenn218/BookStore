package controller.tool;

import Model.Promotion;
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

@WebServlet("/checkPromotionCode")
public class checkPromotionCode extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = Util.getParameterGeneric(request, "code", "");

        String sql;
        try {
            Statement statement = ConnectionDB.connect();
            Connection conn = statement.getConnection();
            ResultSet rs;
            sql = "SELECT * FROM promotion WHERE detail_id in( SELECT id FROM promotion_detail WHERE code = ?)";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, code);
            rs = preparedStatement.executeQuery();
            if (rs.next()) {
                response.getWriter().write("true");
                response.getWriter().flush();
                response.getWriter().close();
            } else {
                response.getWriter().write("false");
                response.getWriter().flush();
                response.getWriter().close();
            }


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
