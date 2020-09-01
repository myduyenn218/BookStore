package controller.page;

import db.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;


@WebServlet("/single-product")
public class SingleProduct extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String id = request.getParameter("id");


        try {
            Statement s = ConnectionDB.connect();
            Connection conn = s.getConnection();
            String sql = "SELECT * FROM books WHERE id=? and active = 1";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, id);
            ResultSet book = pst.executeQuery();
            book.first();
            String type = book.getString("type");
            String author = book.getString("author");
//            System.out.println(type);
            book.first();
            String sqlBooks ="SELECT books.id, books.title, books.price, img.img, img.id, books.rating,books.description FROM" +
                    " img inner JOIN books ON img.id_book = books.id  WHERE active = 1 AND TYPE = ? GROUP BY img.id_book ";

            PreparedStatement pstBooks = conn.prepareStatement(sqlBooks);
            pstBooks.setString(1, type);
            ResultSet listBook = pstBooks.executeQuery();

            String sqlCate = "SELECT * FROM categories WHERE id= ?";
            PreparedStatement pstCate = conn.prepareStatement(sqlCate);
            pstCate.setString(1, type);
            ResultSet cate = pstCate.executeQuery();
            request.setAttribute("cate", cate);

            String img = "SELECT * FROM img WHERE id_book= ? LIMIT 3";
            PreparedStatement pstImg = conn.prepareStatement(img);
            pstImg.setString(1, id);
            ResultSet imgs = pstImg.executeQuery();

            String sqlauthor = "SELECT * FROM authors WHERE id= ?";
            PreparedStatement ptauthor = conn.prepareStatement(sqlauthor);
            ptauthor.setString(1, author);
            ResultSet reauthor = ptauthor.executeQuery();

            request.setAttribute("img", imgs);
            request.setAttribute("author", reauthor);
            request.setAttribute("book", book);
            request.setAttribute("listBook", listBook);


            request.getRequestDispatcher("/customer/view/single-product.jsp").forward(request, response);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();

        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}