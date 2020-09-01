package controller.cart;

import Model.Product;
import Model.Cart;
import Model.User;
import Util.Util;
import com.google.gson.Gson;
import db.ConnectionDB;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/add-cart")
public class Add extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookID = Integer.parseInt((String) Util.getParameterGeneric(request, "bookID", ""));
        int quantity = Integer.parseInt((String) Util.getParameterGeneric(request, "quantity", ""));


        User user = (User) request.getSession().getAttribute("user");
        boolean isLogin = user != null;
        Cart cart = isLogin ? user.getCart() : (Cart) request.getSession().getAttribute("cart");
        Connection conn = null;
        String sql;
        Statement statement = null;
        Product product = null;
        try {
            statement = ConnectionDB.connect();
            conn = statement.getConnection();
            ResultSet rs;

            if (isLogin) {
                sql = "SELECT * FROM orderdetails WHERE orderdetails.id_order = '" + user.getCart().getId_order() + "' AND id_book = '" + bookID + "'";
                rs = statement.executeQuery(sql);
                if (rs.next()) {
                    int currentQuantity = rs.getInt("quantity");
                    rs.updateInt("quantity", currentQuantity + 1);
                    rs.updateRow();
                    currentQuantity = rs.getInt("quantity");
                    quantity = currentQuantity;
                } else {
                    sql = "INSERT INTO orderdetails (id_order, id_book,quantity) VALUES(?,?,?)";
                    PreparedStatement preparedStatement = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    preparedStatement.setInt(1, user.getCart().getId_order());
                    preparedStatement.setInt(2, bookID);
                    preparedStatement.setInt(3, quantity);
                    preparedStatement.executeUpdate();
                }
            }

            sql = "SELECT books.id, img, title, rating, categories.name as type, publishers.name as publisher, authors.name as author, description,  books.price FROM  books JOIN categories ON books.type = categories.id JOIN publishers ON publishers.id = books.publisher JOIN authors ON authors.id = books.author JOIN img on img.id_book = books.id WHERE books.id =   '" + bookID + "'";
            rs = statement.executeQuery(sql);
            if (rs.next()) {
                product = new Product(rs.getInt("id"), rs.getString("img"), rs.getString("title"), rs.getInt("rating"), rs.getString("type"), rs.getString("publisher"), rs.getString("author"), rs.getString("description"), (int) rs.getDouble("price"), quantity);
            }
            cart.put(product);


        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }


        JSONObject bookJson = new JSONObject(product);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("book", bookJson);
        jsonObject.put("totalPrice", cart.getTotalPrice());


        response.getWriter().write(jsonObject.toString());
        response.getWriter().flush();
        response.getWriter().close();

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }


}

