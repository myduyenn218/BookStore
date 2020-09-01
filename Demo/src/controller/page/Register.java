package controller.page;

import controller.auth.PasswordAuthentication;
import controller.tool.SendingEmail;
import db.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.Base64;
import java.util.regex.Pattern;


@WebServlet("/register")
public class Register extends HttpServlet {
    String email, name, pass, re_pass, phone;


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/customer/view/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        email = request.getParameter("email") == null ? "" : request.getParameter("email");
        name = request.getParameter("username") == null ? "" : request.getParameter("username");
        pass = request.getParameter("pass") == null ? "" : request.getParameter("pass");
        re_pass = request.getParameter("re-pass") == null ? "" : request.getParameter("re-pass");
        phone = request.getParameter("phone") == null ? "" : request.getParameter("phone");


        if (validate(request, response)) {


            Connection conn = null;
            String sql;
            try {
                // kiểm tra email đã tồn tại chưa
                Statement s = ConnectionDB.connect();
                String query = "SELECT * from `users` where email =\"" + email + "\"";
                ResultSet rs = s.executeQuery(query);

                rs.last();

                if (rs.getRow() == 1) {
                    request.setAttribute("err-email", "Email has exist.");
                    request.setAttribute("old-email", email);
                    request.setAttribute("username", name);
                    request.getRequestDispatcher("/customer/view/register.jsp").forward(request, response);
                } else if (!(pass.equals(re_pass))) { // kiểm tra pass khớp
                    request.setAttribute("err-pass", "Passwords not matches!!");
                    request.getRequestDispatcher("/customer/view/register.jsp").forward(request, response);
                } else {
                    sql = "INSERT INTO users(name, email, email_hashed, password" +
                            ", phone) VALUES(?,?,?,?,?)";
                    conn = s.getConnection();
                    PreparedStatement pstmt = conn.prepareStatement(sql);

                    String hashMail = Base64.getEncoder().encodeToString((email + java.time.LocalDateTime.now()).getBytes());
                    String hashPass = PasswordAuthentication.getSaltedHash(pass);


                    pstmt.setString(1, name);
                    pstmt.setString(2, email);
                    pstmt.setString(3, hashMail);
                    pstmt.setString(4, hashPass);
                    pstmt.setString(5, phone);
                    int i = pstmt.executeUpdate();
                    if (i != 0) {
                        SendingEmail sendingEmail = new SendingEmail("active-account", email, hashMail);
                        sendingEmail.start();
                        response.sendRedirect("/customer/view/verify.jsp");
                    } else {
                        request.getRequestDispatcher("/customer/view/register.jsp").forward(request, response);
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {

        }
    }

    private boolean validate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean rs = true;
        if (!Pattern.compile("^[A-Za-z0-9+_.-]+@(.+)$").matcher(email).matches()) {
            rs = false;
            request.setAttribute("err-email", "Email wrong format.");
        }
        if (!Pattern.compile("^(?=.*[0-9])(?=.*\\w)(?=\\S+$).{8,}$").matcher(pass).matches()) {
            rs = false;
            request.setAttribute("err-pass", "Password wrong format.");
        }
        if (!pass.equals(re_pass)) {
            rs = false;
            request.setAttribute("err-pass", "Passwords not matches");
        }
        if (!Pattern.compile("\\d{10}|(?:\\d{3}-){2}\\d{4}|\\(\\d{3}\\)\\d{3}-?\\d{4}").matcher(phone).matches()) {
            rs = false;
            request.setAttribute("err-phone", "Phone number wrong format.");
        }

        if (!rs) {
            request.setAttribute("old-email", email);
            request.setAttribute("username", name);
            request.setAttribute("phone", phone);
            request.getRequestDispatcher("/customer/view/register.jsp").forward(request, response);
        }

        return rs;
    }

}