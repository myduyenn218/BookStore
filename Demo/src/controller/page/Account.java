package controller.page;

import Model.Ordered;
import Model.User;
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
import java.util.ArrayList;


@WebServlet(urlPatterns = {"/account", "/account/edit", "/account/address", "/account/add-address", "/account/order", "/account/wishlist"})
//@WebServlet("/account")
public class Account extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        String sql;
        ResultSet rs;
        Statement statement = null;
        try {
            statement = ConnectionDB.connect();
            conn = statement.getConnection();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }


        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String type = request.getParameter("type");
        Model.User user = (Model.User) request.getSession().getAttribute("user");
        request.setAttribute("user", user);

//        System.out.println(user.getDateofbirth());

        if (request.getServletPath().equals("/account") || request.getServletPath().equals("/account/edit")) {
            request.setAttribute("route", "edit");
        } else if (request.getServletPath().equals("/account/address")) {
            request.setAttribute("route", "address");
        } else if (request.getServletPath().equals("/account/add-address")) {
            request.setAttribute("route", "add-address");
        } else if (request.getServletPath().equals("/account/order")) {
            try {
                ArrayList<Ordered> ordereds = new ArrayList<Ordered>();
                sql = "SELECT orders.*, statuses.status FROM orders JOIN statuses ON statuses.id = orders.statusID WHERE id_customer = '" + user.getId() + "' AND orders.statusID = 2";
                rs = statement.executeQuery(sql);
                while (rs.next()) {
                    Statement statement2 = ConnectionDB.connect();
                    ResultSet rs2 = statement2.executeQuery("SELECT books.title FROM orderdetails JOIN books ON books.id = orderdetails.id_book WHERE orderdetails.id_order = '" + rs.getInt("id") + "'");
                    ArrayList<String> products = new ArrayList<String>();
                    while (rs2.next()) {
                        products.add(rs2.getString("title"));
                    }
                    Ordered ordered = new Ordered(rs.getInt("id"), rs.getDate("orderDate"), products, rs.getInt("total"), rs.getString("status"));
                    ordereds.add(ordered);
                }
                request.setAttribute("ordereds", ordereds);
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
            request.setAttribute("route", "order");
        } else if (request.getServletPath().equals("/account/wishlist")) {
            request.setAttribute("wishlist", user.getWishlist().getWishlist());
            request.setAttribute("route", "wishlist");
        }
        request.getRequestDispatcher("/customer/account/my-account.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        if (request.getServletPath().equals("/account/edit")) {
            String id = request.getParameter("id");
            if (id != null && !id.equals("")) {
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String fullname = request.getParameter("fullname");
                String gender = request.getParameter("gender");
                String address = request.getParameter("address");
                String phone = request.getParameter("phone");
                String dateofbirth = request.getParameter("dateofbirth");
                String is_change_pass = request.getParameter("is_change_pass");
                String oldPass = request.getParameter("old_password");
                String newPass = request.getParameter("new_password");
                String reNewPass = request.getParameter("re_new_password");
//                String dateofbirth = year + "-" + month + "-" + day;
                System.out.println(name + "\t" + email + "\t" + fullname + "\t" + gender + "\t" + address + phone + "\t" + dateofbirth);

                System.out.println(is_change_pass);
                System.out.println(dateofbirth);

                try {
                    Statement s = ConnectionDB.connect();
                    Connection conn = s.getConnection();
                    String sqlUser = "SELECT * FROM users Where id=?";
                    PreparedStatement u = conn.prepareStatement(sqlUser);
                    u.setString(1, id);
                    ResultSet rs = u.executeQuery();
                    rs.next();
                    User user = new User();
                    if (is_change_pass != null) {


                        if (PasswordAuthentication.check(oldPass, rs.getString("password"))) {

                            if(newPass.length()< 6 && newPass.length() > 32) {
                                System.out.println("new pass");
                                request.setAttribute("errNewPass", "Mật khẩu phải từ 6-32 kí tự");
                                request.setAttribute("noti", "Cập nhật không thành công");
                                response.sendRedirect("/account/edit?id" + id);
                                return;
                            }

                            if (newPass.equals(reNewPass)) {

                                String hashPass = PasswordAuthentication.getSaltedHash(newPass);
                                String sqlPass = "UPDATE users SET password=? WHERE id=?";
                                PreparedStatement pstPass = conn.prepareStatement(sqlPass);

                                pstPass.setString(1, hashPass);
                                pstPass.setString(2, id);
                                pstPass.execute();
                                System.out.println("OK");
//                                user.setPassword();

                            } else {
                                System.out.println("re pass");
                                request.setAttribute("errRePass", "Mật khẩu không trùng khớp");
                                request.setAttribute("noti", "Cập nhật không thành công");
                                response.sendRedirect("/account/edit?id" + id);
                                return;

                            }



                        } else {
                            System.out.println("old pass");
                            request.setAttribute("errOldPass", "Mật khẩu cũ không đúng");
                            request.setAttribute("noti", "Cập nhật không thành công");
                            response.sendRedirect("/account/edit?id" + id);
                            return;
                        }
                    }
                    String sqlCategory = "UPDATE users SET name=?,email=?,fullname=?,gender=?,address=?,phone=?,dateofbirth=? where id=?";

                    PreparedStatement pstCate = conn.prepareStatement(sqlCategory);


                    pstCate.setString(1, name);
                    pstCate.setString(2, email);
                    pstCate.setString(3, fullname);
                    pstCate.setString(4, gender);
                    pstCate.setString(5, address);
                    pstCate.setString(6, phone);
                    pstCate.setString(7, dateofbirth);
                    pstCate.setString(8, id);
                    pstCate.execute();

                     sqlUser = "SELECT * FROM users Where id=?";
                     u = conn.prepareStatement(sqlUser);
                    u.setString(1, id);
                     rs = u.executeQuery();
                    rs.next();

                    user.setId(rs.getInt("id"));
                    user.setUserName(rs.getString("name"));
                    user.setEmail(rs.getString("email"));
                    user.setFullName(rs.getString("fullname"));
                    user.setGender(rs.getString("gender"));
//                    user.setAddress(rs.getString("address"));
                    user.setPhone(rs.getString("phone"));
                    user.setDateofbirth(rs.getString("dateofbirth"));
                    System.out.println("userdob: " + dateofbirth);
                    HttpSession session = request.getSession();
                    session.setAttribute("user", user);


                } catch (SQLException e) {
                    e.printStackTrace();
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            request.setAttribute("noti", "Cập nhật thành công");
            response.sendRedirect("/account/edit?id=" + id);
        }


    }
}
