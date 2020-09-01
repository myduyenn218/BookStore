package controller.wish;

import Model.Product;
import Model.User;
import Util.Util;
import db.ConnectionDB;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/addWish")
public class Add extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        boolean isLogin = user != null;
        if (!isLogin) {
            response.setStatus(404);
            response.getWriter().write("!login");
            response.getWriter().flush();
            response.getWriter().close();
        } else {
            int bookID = Integer.parseInt((String) Util.getParameterGeneric(request, "bookID", ""));
            int idWish = user.getWishlist().getId();
            try {
                Statement statement = ConnectionDB.connect();
                Connection conn = statement.getConnection();
                String sql = "SELECT * FROM orderdetails WHERE orderdetails.id_order = '" + idWish + "' AND id_book = '" + bookID + "'";
                ResultSet rs = statement.executeQuery(sql);
                if (rs.next()){
                    response.setStatus(500);
                    response.getWriter().write("This book has already in your wish list");
                    response.getWriter().flush();
                    response.getWriter().close();
                }else{
                    sql = "INSERT INTO orderdetails (id_order, id_book) VALUES(?,?)";
                    PreparedStatement preparedStatement = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    preparedStatement.setInt(1, idWish);
                    preparedStatement.setInt(2, bookID);
                    int tmp = preparedStatement.executeUpdate();

                    sql = "SELECT books.id, img, title, rating, categories.name as type, publishers.name as publisher, authors.name as author, description,  books.price FROM  books JOIN categories ON books.type = categories.id JOIN publishers ON publishers.id = books.publisher JOIN authors ON authors.id = books.author JOIN img on img.id_book = books.id WHERE books.id =   '" + bookID + "'";
                    rs = statement.executeQuery(sql);
                    Product product = null;
                    if (rs.next()) {
                        product = new Product(rs.getInt("id"), rs.getString("img"), rs.getString("title"), rs.getInt("rating"), rs.getString("type"), rs.getString("publisher"), rs.getString("author"), rs.getString("description"), (int) rs.getDouble("price"), 1);
                    }
                    user.getWishlist().add(product);

                    JSONObject jsonObject = new JSONObject(product);
                    response.getWriter().write(jsonObject.toString());
                    response.getWriter().flush();
                    response.getWriter().close();
                }



            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            }


        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
