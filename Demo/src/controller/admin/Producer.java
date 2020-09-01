package controller.admin;

import db.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;


@WebServlet(urlPatterns = {"/admin/producer", "/admin/producer/delete", "/admin/producer/add", "/admin/producer/edit", "/admin/producer/see"})
public class Producer extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        if (request.getServletPath().equals("/admin/producer")) {
            try {
                Statement s = ConnectionDB.connect();
                Connection conn = s.getConnection();
                String sqlCategory = "SELECT * FROM publishers";
                PreparedStatement pstCate = conn.prepareStatement(sqlCategory);
                ResultSet publishers = pstCate.executeQuery();
                request.setAttribute("publishers", publishers);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            request.getRequestDispatcher("/admin/producers.jsp").forward(request, response);

        }
        else if (request.getServletPath().equals("/admin/producer/add")) {
            request.getRequestDispatcher("/admin/add-producer.jsp").forward(request, response);
        }

        else if (request.getServletPath().equals("/admin/producer/edit")) {
            String id = request.getParameter("id");
            if (id != null && !id.equals("")) {
                try {
                    Statement s = ConnectionDB.connect();
                    Connection conn = s.getConnection();
                    String sqlCategory = "SELECT * FROM publishers WHERE id=?";

                    PreparedStatement pst = conn.prepareStatement(sqlCategory);
                    pst.setString(1, id);
                    ResultSet publishers = pst.executeQuery();
                    publishers.first();

                    request.setAttribute("publishers", publishers);
                    request.getRequestDispatcher("/admin/edit-producer.jsp").forward(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
            }
        }

        else if (request.getServletPath().equals("/admin/producer/see")) {
            String id = request.getParameter("id");
            if (id != null && !id.equals("")) {
                try {
                    Statement s = ConnectionDB.connect();
                    Connection conn = s.getConnection();
                    String sqlCategory = "SELECT * FROM publishers WHERE id=?";

                    PreparedStatement pst = conn.prepareStatement(sqlCategory);
                    pst.setString(1, id);
                    ResultSet publishers = pst.executeQuery();
                    publishers.first();

                    request.setAttribute("publishers", publishers);
                    request.getRequestDispatcher("/admin/see-producer.jsp").forward(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
            }
        }

        else if (request.getServletPath().equals("/admin/producer/delete")) {
            String id = request.getParameter("id");
            if (id != null && !id.equals("")) {
                try {
                    Statement s = ConnectionDB.connect();
                    Connection conn = s.getConnection();
                    String sqlCategory = "DELETE FROM publishers WHERE id = ?";
                    PreparedStatement pstCate = conn.prepareStatement(sqlCategory);
                    pstCate.setString(1, id);
                    pstCate.execute();
                    response.sendRedirect("/admin/producer");
                } catch (SQLException e) {
                    e.printStackTrace();
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        if (request.getServletPath().equals("/admin/producer/add")) {
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String contact = request.getParameter("contact");
            try {
                Statement s = ConnectionDB.connect();
                Connection conn = s.getConnection();
                String sqlCategory = "INSERT INTO publishers (name, address, contact) VALUE (?, ?, ?)";

                PreparedStatement pstCate = conn.prepareStatement(sqlCategory);
                pstCate.setString(1, name);
                pstCate.setString(2, address);
                pstCate.setString(3, contact);
                pstCate.execute();
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            response.sendRedirect("/admin/producer");
        }

        else if (request.getServletPath().equals("/admin/producer/edit")) {
            String id = request.getParameter("id");
            if (id != null && !id.equals("")) {
                String name = request.getParameter("name");
                String address = request.getParameter("address");
                String contact = request.getParameter("contact");
                response.getWriter().println(name);
                response.getWriter().println(address);
                response.getWriter().println(contact);
                try {
                    Statement s = ConnectionDB.connect();
                    Connection conn = s.getConnection();
                    String sqlCategory = "UPDATE publishers SET name=?,address=?,contact=? where id=?";
                    PreparedStatement pstCate = conn.prepareStatement(sqlCategory);
                    pstCate.setString(1, name);
                    pstCate.setString(2, address);
                    pstCate.setString(3, contact);
                    pstCate.setString(4,id);
                    pstCate.execute();
                } catch (SQLException e) {
                    e.printStackTrace();
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
            }
            response.sendRedirect("/admin/producer");
        }
    }
}
