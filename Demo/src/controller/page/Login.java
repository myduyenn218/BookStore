package controller.page;

import Model.*;
import Util.Util;
import controller.auth.PasswordAuthentication;
import db.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/login")
public class Login extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/customer/view/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = Util.getParameterGeneric(request, "email", "");
        String pass = Util.getParameterGeneric(request, "pass", "");
        login(request, response, email, pass);


    }

    public static void login(HttpServletRequest request, HttpServletResponse response, String email, String pass) throws ServletException, IOException {
        try {
            String sql;
            Statement statement = ConnectionDB.connect();
            Connection conn = statement.getConnection();


            sql = "select * from users where email=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();

            rs.last();
            int i = rs.getRow();
            rs.first();
            String passStoring = rs.getString("password");

            if (i == 1 && PasswordAuthentication.check(pass, passStoring)) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUserName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setFullName(rs.getString("fullname"));
                user.setGender(rs.getString("gender"));
                user.setAddress(rs.getString("address"));
                user.setPhone(rs.getString("phone"));
                user.setDateofbirth(rs.getString("dateofbirth"));
                user.setIdgroup(rs.getInt("idgroup"));
                user.setAddress(rs.getString("avt"));


                // Load shopping cart & wish-list..
                boolean first = true;
                sql = "SELECT * FROM orders WHERE id_customer = '" + user.getId() + "' AND  statusID in (1,3)";
                rs = statement.executeQuery(sql);
                while (rs.next()) {  // load wishID and cartID
                    first = false;
                    if (rs.getInt("statusID") == 3)
                        user.getWishlist().setId(rs.getInt("id"));
                    else
                        user.getCart().setId_order(rs.getInt("id"));
                }

                if (first) {
                    sql = "INSERT INTO orders (id_customer, statusID) VALUES ('" + user.getId() + "',1),('" + user.getId() + "',3) ";
                    statement.executeUpdate(sql);
                    sql = "SELECT * FROM orders WHERE id_customer = '" + user.getId() + "' AND statusID in (1,3)";
                    rs = statement.executeQuery(sql);
                    while (rs.next()) {
                        if (rs.getInt("statusID") == 1)
                            user.getCart().setId_order(rs.getInt("id"));
                        else if (rs.getInt("statusID") == 3)
                            user.getWishlist().setId(rs.getInt("id"));
                    }
                }

                WishList wishList = user.getWishlist();
                sql = "SELECT books.id, img, title, rating, categories.name as type, publishers.name as publisher, authors.name as author, description,  books.price, orderdetails.quantity FROM  books JOIN categories ON books.type = categories.id JOIN publishers ON publishers.id = books.publisher JOIN authors ON authors.id = books.author JOIN img on img.id_book = books.id JOIN orderdetails ON orderdetails.id_book = books.id WHERE books.id in  (SELECT orderdetails.id_book FROM orderdetails WHERE orderdetails.id_order = '" + user.getWishlist().getId() + "') GROUP BY books.id";
                rs = statement.executeQuery(sql);
                while (rs.next()) {
                    Product product = new Product(rs.getInt("id"), rs.getString("img"), rs.getString("title"), rs.getInt("rating"), rs.getString("type"), rs.getString("publisher"), rs.getString("author"), rs.getString("description"), (int) rs.getDouble("price"), 1);
                    wishList.add(product);
                }
                Cart cart = user.getCart();
                sql = "SELECT books.id, img, title, rating, categories.name as type, publishers.name as publisher, authors.name as author, description,  books.price, orderdetails.quantity FROM  books JOIN categories ON books.type = categories.id JOIN publishers ON publishers.id = books.publisher JOIN authors ON authors.id = books.author JOIN img on img.id_book = books.id JOIN orderdetails ON orderdetails.id_book = books.id WHERE books.id in  (SELECT orderdetails.id_book FROM orderdetails WHERE orderdetails.id_order = '" + user.getCart().getId_order() + "') GROUP BY books.id";
                rs = statement.executeQuery(sql);
                while (rs.next()) {
                    Product product = new Product(rs.getInt("id"), rs.getString("img"), rs.getString("title"), rs.getInt("rating"), rs.getString("type"), rs.getString("publisher"), rs.getString("author"), rs.getString("description"), (int) rs.getDouble("price"), 1);
                    cart.put(product);
                }

                // add cart product when not login
                Cart oldCart = (Cart) request.getSession().getAttribute("cart");
                for (Map.Entry<Integer, Product> entry : oldCart.getData().entrySet()) {
                    cart.put(entry.getValue());
                }

                // End load shopping cart & wish-lish.

                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                response.sendRedirect(Util.fullPath(""));

            } else {
                request.setAttribute("err", "Sai email hoặc mật khẩu.");
                request.getRequestDispatcher("/customer/view/login.jsp").forward(request, response);
                response.getWriter().println("Đăng nhập không thành công");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("err", "Sai email hoặc mật khẩu.");
            request.getRequestDispatcher("/customer/view/login.jsp").forward(request, response);
        }
    }
}