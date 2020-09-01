package controller.tool;

import Model.Cart;
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

@WebServlet("/addPromotion")
public class addPromotion extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = Util.getParameterGeneric(request, "code", "");

        String sql;
        try {
            Statement statement = ConnectionDB.connect();
            Connection conn = statement.getConnection();
            ResultSet rs;
            sql = "SELECT promotion.id, promotion_detail.type, promotion_detail.amount, promotion_detail.conditionPrice FROM promotion RIGHT JOIN promotion_detail on promotion.detail_id = promotion_detail.id WHERE detail_id in( SELECT id FROM promotion_detail WHERE code = ?)";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, code);
            rs = preparedStatement.executeQuery();
            Promotion promotion = null;
            if (rs.next()) {
                promotion = new Promotion();
                promotion.setId(rs.getInt("id"));
                promotion.setCode(code);
                promotion.setType(rs.getInt("type"));
                promotion.setAmount(rs.getDouble("amount"));
                promotion.setPriceCondition(rs.getDouble("conditionPrice"));
            } else {
//                response.getWriter().write("false");
//                response.getWriter().flush();
//                response.getWriter().close();
            }

            if (promotion != null) {
                User user = (User) request.getSession().getAttribute("user");
                boolean isLogin = user != null;
                Cart cart = isLogin ? user.getCart() : (Cart) request.getSession().getAttribute("cart");
                int idCart = cart.getId_order();

                sql = "SELECT * FROM orders WHERE orders.id = ?";
                preparedStatement = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
                preparedStatement.setInt(1, idCart);
                rs = preparedStatement.executeQuery();
                if (rs.next()) {
                    rs.updateInt("promotion", promotion.getId());
                    rs.updateRow();
                }
                cart.setPromotion(promotion);
                int totalPayment = cart.getTotalPayment();
                response.getWriter().write(totalPayment+"");
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
