package controller.admin;

import com.google.gson.Gson;
import db.ConnectionDB;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;


@WebServlet(urlPatterns = { "/admin/orders/delete",
        "/admin/orders/add", "/admin/orders/edit", "/admin/orders/see", "/admin/orders/statistic"})

public class Orders extends HttpServlet {
    private  Gson gson = new Gson();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        if (request.getServletPath().equals("/admin")) {
            try {
                Statement s = ConnectionDB.connect();
                Connection conn = s.getConnection();
//                String sqlCategory = "SELECT * FROM orders";

                String sqlCategory = "SELECT orders.id,users.fullname,orders.orderDate,orders.subtotal,orders.shipping,orders.total,statuses.`status`  FROM orders INNER JOIN users ON orders.id_customer = users.id INNER JOIN statuses  ON orders.statusID = statuses.id";

                PreparedStatement pstCate = conn.prepareStatement(sqlCategory);
                ResultSet orders = pstCate.executeQuery();

                request.setAttribute("orders", orders);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            request.getRequestDispatcher("/admin/orders.jsp").forward(request, response);
        } else if (request.getServletPath().equals("/admin/orders/add")) {
            try {
                Statement s = ConnectionDB.connect();
                Connection conn = s.getConnection();
                String sqlcustomer = "SELECT * FROM users";
                String sqlstatuses = "SELECT * FROM statuses";

                PreparedStatement pstcustomer = conn.prepareStatement(sqlcustomer);
                ResultSet customer = pstcustomer.executeQuery();

                PreparedStatement pstPub = conn.prepareStatement(sqlstatuses);
                ResultSet statuses = pstPub.executeQuery();

                request.setAttribute("customer", customer);
                request.setAttribute("statuses", statuses);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            request.getRequestDispatcher("/admin/add-orders.jsp").forward(request, response);
        } else if (request.getServletPath().equals("/admin/orders/edit")) {
            String id = request.getParameter("id");
            if (id != null && !id.equals("")) {
                try {
                    Statement s = ConnectionDB.connect();
                    Connection conn = s.getConnection();
                    String sqlcustomer = "SELECT * FROM users";
                    String sqlstatuses = "SELECT * FROM statuses";
                    String sqlorders = "SELECT * FROM orders WHERE id=?";

                    PreparedStatement pstcustomer = conn.prepareStatement(sqlcustomer);
                    ResultSet customer = pstcustomer.executeQuery();

                    PreparedStatement pstPub = conn.prepareStatement(sqlstatuses);
                    ResultSet statuses = pstPub.executeQuery();

                    PreparedStatement pstorders = conn.prepareStatement(sqlorders);
                    pstorders.setString(1, id);
                    ResultSet orders = pstorders.executeQuery();
                    orders.first();

                    request.setAttribute("customer", customer);
                    request.setAttribute("statuses", statuses);
                    request.setAttribute("orders", orders);
                    request.getRequestDispatcher("/admin/edit-orders.jsp").forward(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
            }
        } else if (request.getServletPath().equals("/admin/orders/delete")) {
            String id = request.getParameter("id");
            if (id != null && !id.equals("")) {
                try {
                    Statement s = ConnectionDB.connect();
                    Connection conn = s.getConnection();
                    String sqlCategory = "DELETE FROM orders WHERE id = ?";

                    PreparedStatement pstCate = conn.prepareStatement(sqlCategory);
                    pstCate.setString(1, id);
                    pstCate.execute();

                    response.sendRedirect("/admin");
                } catch (SQLException e) {
                    e.printStackTrace();
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
            }
        } else if (request.getServletPath().equals("/admin/orders/statistic")) {
            String type = request.getParameter("type");
            PrintWriter out = response.getWriter();
            response.setContentType("application/json");  // return data
            response.setCharacterEncoding("UTF-8");

            if (type == null) {
                out.print("{}");
                out.flush();
            } else {

                //thoongs kee doanh thu
                if (type.equals("revenue")) {
                    try {
                        String yearParam = request.getParameter("year");
                        int year = -1;
                        if (yearParam != null && !yearParam.equals("")) {
                            try {
                                year = Integer.parseInt(yearParam);
                            } catch (Exception e) {
                                e.printStackTrace();
                                out.print("{\"error\": \"Invalid year\"}");
                                out.flush();
                                return;
                            }
                        } else {
                            year = Calendar.getInstance().get(Calendar.YEAR);
                        }

                        Statement s = ConnectionDB.connect();
                        Connection conn = s.getConnection();
                        String dataQuery = "SELECT MONTH(orderDate) as month, SUM(total) as revenue FROM orders WHERE YEAR(orderDate) = ? GROUP BY MONTH(orderDate);";

                        PreparedStatement pstCate = conn.prepareStatement(dataQuery);
                        pstCate.setInt(1, year);
                        ResultSet rs = pstCate.executeQuery();
                        ArrayList<Integer> month = new ArrayList<>();
                        ArrayList<Integer> revenue = new ArrayList<>();
                        while (rs.next()) {
                            month.add(rs.getInt("month"));
                            revenue.add(rs.getInt("revenue"));
                        }

                        for (int i = 1; i <= 12; i++) {
                            if (!month.contains(i)) {
                                month.add(i);
                                revenue.add(0);
                            }
                        }

                        JSONObject data = new JSONObject();
                        data.put("month", month);
                        data.put("revenue", revenue);
                        out.print(gson.toJson(data));
                        out.flush();
                        return;
                    } catch (SQLException e) {
                        e.printStackTrace();
                    } catch (ClassNotFoundException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        if (request.getServletPath().equals("/admin/orders/add")) {
            String id_customer = request.getParameter("id_customer");
            String subtotal = request.getParameter("subtotal");
            String shipping = request.getParameter("shipping");
            String total = request.getParameter("total");
            String statusID = request.getParameter("statusID");

            Date date = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("yyy/MM/dd hh:mm:ss");
            String orderDate = formatter.format(date);

            try {
                Statement s = ConnectionDB.connect();
                Connection conn = s.getConnection();
                String sqlCategory = "INSERT INTO orders (id_customer, orderDate, subtotal, shipping, total, statusID) VALUE (?, ?, ?, ?, ?, ?)";

                PreparedStatement pstCate = conn.prepareStatement(sqlCategory);
                pstCate.setString(1, id_customer);
                pstCate.setString(2, orderDate);
                pstCate.setString(3, subtotal);
                pstCate.setString(4, shipping);
                pstCate.setString(5, total);
                pstCate.setString(6, statusID);
                pstCate.execute();
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            response.sendRedirect("/admin");
        }

        else if (request.getServletPath().equals("/admin/orders/edit")) {
            String id = request.getParameter("id");
            if (id != null && !id.equals("")) {
                String id_customer = request.getParameter("id_customer");
//                String orderDate = request.getParameter("orderDate");
                String subtotal = request.getParameter("subtotal");
                String shipping = request.getParameter("shipping");
                String total = request.getParameter("total");
                String statusID = request.getParameter("statusID");
                try {
                    Statement s = ConnectionDB.connect();
                    Connection conn = s.getConnection();
                    String sqlCategory = "UPDATE orders SET id_customer=?,subtotal=?,shipping=?,total=?,statusID=? where id=?";
//                    PreparedStatement pstCate = conn.prepareStatement(sqlCategory);
//                    pstCate.setInt(1, Integer.parseInt(id_customer));
//                    pstCate.setDate(2,Date.valueOf(orderDate));
//                    pstCate.setDouble(3, Double.parseDouble(subtotal));
//                    pstCate.setDouble(4, Double.parseDouble(shipping));
//                    pstCate.setDouble(5, Double.parseDouble(total));
//                    pstCate.setInt(6, Integer.parseInt(statusID));
//                    pstCate.setString(7, id);
                    PreparedStatement pstCate = conn.prepareStatement(sqlCategory);
                    pstCate.setString(1, id_customer);
//                    pstCate.setString(2, orderDate);
                    pstCate.setString(2, subtotal);
                    pstCate.setString(3, shipping);
                    pstCate.setString(4, total);
                    pstCate.setString(5, statusID);
                    pstCate.setString(6, id);

                    pstCate.execute();
                } catch (SQLException e) {
                    e.printStackTrace();
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }

            }
            response.sendRedirect("/admin");
        }
    }
}