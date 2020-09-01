package controller.auth;

import Model.Cart;
import Model.Product;
import Model.User;
import Model.WishList;
import Util.Util;
import db.ConnectionDB;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Map;

@WebServlet("/FB_login")
public class FB_login extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String access_token = (String) request.getParameter("access_token");


        try {

            String sql;
            Statement statement = ConnectionDB.connect();
            Connection conn = statement.getConnection();
            ResultSet rs;
            PreparedStatement preparedStatement;

            User user = call_me(access_token); // load user from FB data;

            sql = "SELECT * FROM users WHERE email = ?";
            preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, user.getEmail());
            rs = preparedStatement.executeQuery();
            if (!rs.next()) {  //
                sql = "INSERT INTO users(name,email) VALUES (?,?)";
                PreparedStatement preparedStatement1 = conn.prepareStatement(sql);
                preparedStatement1.setString(1, user.getUserName());
                preparedStatement1.setString(2, user.getEmail());
                preparedStatement1.executeUpdate();

                sql = "SELECT * FROM users WHERE email = ?";
                preparedStatement1 = conn.prepareStatement(sql);
                preparedStatement1.setString(1, user.getEmail());
                ResultSet rs1 = preparedStatement1.executeQuery();
                if (rs1.next())
                    user.setId(rs1.getInt("id"));
            } else {
                user.setId(rs.getInt("id"));
                user.setUserName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setFullName(rs.getString("fullname"));
                user.setGender(rs.getString("gender"));
                user.setAddress(rs.getString("address"));
                user.setPhone(rs.getString("phone"));
                user.setDateofbirth(rs.getString("dateofbirth"));
                user.setIdgroup(rs.getInt("idgroup"));
            }

            boolean first = true;
            sql = "SELECT * FROM orders WHERE id_customer = '" + user.getId() + "' AND  statusID in (1,3)";
            rs = statement.executeQuery(sql);
            while (rs.next()) {
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
            if (oldCart.getData().size() > 0)
                for (Map.Entry<Integer, Product> entry : oldCart.getData().entrySet()) {
                    cart.put(entry.getValue());
                }

            // End load shopping cart & wish-lish.

            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect(Util.fullPath(""));

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    public User call_me(String access_token) throws Exception {
        String url = "https://graph.facebook.com/v2.12/me?fields=id,name,picture,email&access_token=" + access_token;
        URL obj = new URL(url);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
        // optional default is GET
        con.setRequestMethod("GET");
        //add request header
        con.setRequestProperty("User-Agent", "Mozilla/5.0");
        int responseCode = con.getResponseCode();
//        System.out.println("\nSending 'GET' request to URL : " + url);
//        System.out.println("Response Code : " + responseCode);
        BufferedReader in = new BufferedReader(
                new InputStreamReader(con.getInputStream()));
        String inputLine;
        StringBuffer response = new StringBuffer();
        while ((inputLine = in.readLine()) != null) {
            response.append(inputLine);
        }
        in.close();
//        System.out.println(response);
        User user = new User();
        JSONObject myResponse = new JSONObject(response.toString());
        user.setUserName(myResponse.getString("name"));
        user.setId_fb(myResponse.getString("id"));
        user.setEmail(myResponse.getString("email"));
        JSONObject picture_reponse = myResponse.getJSONObject("picture");
        JSONObject data_response = picture_reponse.getJSONObject("data");
//        System.out.println("URL : " + data_response.getString("url"));
        user.setAvt(data_response.getString("url"));
        return user;
    }
}
