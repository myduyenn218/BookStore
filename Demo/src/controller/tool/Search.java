package controller.tool;

import Util.Util;
import db.ConnectionDB;
import org.json.JSONArray;
import org.json.JSONObject;

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
import java.util.ArrayList;

@WebServlet("/search")
public class Search extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String value = Util.getParameterGeneric(request, "str", "");
        int maxP = Integer.parseInt(Util.getParameterGeneric(request, "max", ""));
        int minP = Integer.parseInt(Util.getParameterGeneric(request, "min", ""));
        try {
            Statement statement = ConnectionDB.connect();
            String sql = "SELECT * FROM books JOIN img on img.id_book = books.id WHERE title LIKE '%" + value + "%' AND books.price BETWEEN " + minP + " AND " + maxP + " GROUP BY books.id";
            ResultSet rs = statement.executeQuery(sql);
            JSONArray items = new JSONArray();
            double min = Double.MAX_VALUE, max = Double.MIN_VALUE;
            while (rs.next()) {
                JSONObject item = new JSONObject();
                item.put("id", rs.getInt("id"));
                item.put("title", rs.getString("title"));
                item.put("rating", rs.getInt("rating"));
                item.put("price", rs.getDouble("price"));
                item.put("img", rs.getString("img"));
                items.put(item);
                if (rs.getDouble("price") < min) min = rs.getDouble("price");
                if (rs.getDouble("price") > max) max = rs.getDouble("price");

            }

            response.getWriter().write(items.toString());
            response.getWriter().flush();
            response.getWriter().close();

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
