package controller.auth;

import Util.Util;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import controller.page.Login;
import db.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.sql.*;

@WebServlet("/reset-pass")
public class ResetPass extends HttpServlet {
    String email;
    String hash;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        email = Util.getParameterGeneric(request, "key1", "");
        hash = Util.getParameterGeneric(request, "key2", "");
        try {
            Statement statement = ConnectionDB.connect();
            Connection conn = statement.getConnection();
            String sql = "select email, email_hashed, is_active from users where email=? and email_hashed=?";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, hash);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                request.setAttribute("email", email);
                request.getRequestDispatcher("/customer/view/reset-pass.jsp").forward(request, response);
            }else{
                request.getRequestDispatcher("/customer/view/route-not-defined.jsp").forward(request, response);
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pass = Util.getParameterGeneric(request, "pass", "");
        String repass = Util.getParameterGeneric(request, "repass", "");
        System.out.println(pass+repass);

        if (pass.equals(repass)) {
            try {
                Statement s = ConnectionDB.connect();
                Connection conn = s.getConnection();
                PreparedStatement pst = conn.prepareStatement("select pass from users where email=? and email_hashed=?");
                pst.setString(1, email);
                pst.setString(2, hash);
                ResultSet rs = pst.executeQuery();
                if (rs.next()) {
                    String hashPass = PasswordAuthentication.getSaltedHash(pass);
                    rs.updateString("pass", hashPass);
                    rs.updateRow();
                }

                request.setAttribute("mess", "Change pass successfully");
                request.getRequestDispatcher("/customer/view/login.jsp").forward(request, response);

            } catch (Exception var10) {
            }
        } else {
            request.setAttribute("err", "mật khẩu không khớp");
            request.getRequestDispatcher("/customer/view/reset-pass.jsp").forward(request, response);
        }


    }
}
