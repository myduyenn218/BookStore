package controller.admin;

import db.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet(urlPatterns = {"/admin/product", "/admin/product/delete", "/admin/product/add", "/admin/product/edit",
        "/admin/product/see", "/admin/categories/add", "/admin/categories/edit", "/admin/categories/see", "/admin/categories/delete"})
public class Product extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        if (request.getServletPath().equals("/admin/product")) {
            try {
                Statement s = ConnectionDB.connect();
                Connection conn = s.getConnection();
                String sql = "SELECT * FROM books WHERE active = 1 ";
                String sqlCategory = "SELECT * FROM categories WHERE active = 1";
//                String sql = "SELECT * FROM books";
//                String sqlCategory = "SELECT * FROM categories ";

                PreparedStatement pst = conn.prepareStatement(sql);
                PreparedStatement pstCate = conn.prepareStatement(sqlCategory);

                ResultSet book = pst.executeQuery();
                ResultSet categories = pstCate.executeQuery();

                request.setAttribute("book", book);
                request.setAttribute("categories", categories);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            request.getRequestDispatcher("/admin/products.jsp").forward(request, response);
        } else if (request.getServletPath().equals("/admin/product/add")) {
            try {
                Statement s = ConnectionDB.connect();
                Connection conn = s.getConnection();
                String sqlCategory = "SELECT * FROM categories WHERE active = 1";
                String sqlPublisher = "SELECT * FROM publishers";
                String sqlAuthor = "SELECT * FROM authors";
//loại sách
                PreparedStatement pst = conn.prepareStatement(sqlCategory);
                ResultSet categories = pst.executeQuery();
//                nhà sx
                PreparedStatement pstPub = conn.prepareStatement(sqlPublisher);
                ResultSet publisher = pstPub.executeQuery();
//tác giả
                PreparedStatement pstAuthor = conn.prepareStatement(sqlAuthor);
                ResultSet authors = pstAuthor.executeQuery();

                request.setAttribute("categories", categories);
                request.setAttribute("publisher", publisher);
                request.setAttribute("authors", authors);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            request.getRequestDispatcher("/admin/add-product.jsp").forward(request, response);

        } else if (request.getServletPath().equals("/admin/product/edit")) {
            String id = request.getParameter("id");
            if (id != null && !id.equals("")) {
                try {
                    Statement s = ConnectionDB.connect();
                    Connection conn = s.getConnection();
                    String sqlBooks = "SELECT * FROM books where id=?";
                    String sqlCategory = "SELECT * FROM categories WHERE active = 1";
                    String sqlPublisher = "SELECT * FROM publishers";
                    String sqlAuthor = "SELECT * FROM authors";
                    String sqlImg = "SELECT * FROM img";
                    // rút ra cuốn sách cần edit
                    PreparedStatement pstBooks = conn.prepareStatement(sqlBooks);
                    pstBooks.setString(1, id);
                    ResultSet books = pstBooks.executeQuery();
                    books.first();
//loại sách
                    PreparedStatement pst = conn.prepareStatement(sqlCategory);
                    ResultSet categories = pst.executeQuery();
//                nhà sx
                    PreparedStatement pstPub = conn.prepareStatement(sqlPublisher);
                    ResultSet publisher = pstPub.executeQuery();
//tác giả
                    PreparedStatement pstAuthor = conn.prepareStatement(sqlAuthor);
                    ResultSet authors = pstAuthor.executeQuery();
//img
                    PreparedStatement pstImg = conn.prepareStatement(sqlImg);
                    ResultSet img = pstImg.executeQuery();


                    request.setAttribute("books", books);
                    request.setAttribute("categories", categories);
                    request.setAttribute("publisher", publisher);
                    request.setAttribute("authors", authors);
                    request.setAttribute("imgs", img);

                    request.getRequestDispatcher("/admin/edit-product.jsp").forward(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
            }
        } else if (request.getServletPath().equals("/admin/product/see")) {
            String id = request.getParameter("id");
            if (id != null && !id.equals("")) {
                try {
                    Statement s = ConnectionDB.connect();
                    Connection conn = s.getConnection();
                    String sqlBooks = "SELECT * FROM books where id=?";
                    String sqlCategory = "SELECT * FROM categories WHERE active = 1";
                    String sqlPublisher = "SELECT * FROM publishers";
                    String sqlAuthor = "SELECT * FROM authors";
                    // rút ra cuốn sách cần edit
                    PreparedStatement pstBooks = conn.prepareStatement(sqlBooks);
                    pstBooks.setString(1, id);
                    ResultSet books = pstBooks.executeQuery();
                    books.first();
//loại sách
                    PreparedStatement pst = conn.prepareStatement(sqlCategory);
                    ResultSet categories = pst.executeQuery();
//                nhà sx
                    PreparedStatement pstPub = conn.prepareStatement(sqlPublisher);
                    ResultSet publisher = pstPub.executeQuery();
//tác giả
                    PreparedStatement pstAuthor = conn.prepareStatement(sqlAuthor);
                    ResultSet authors = pstAuthor.executeQuery();

                    request.setAttribute("books", books);
                    request.setAttribute("categories", categories);
                    request.setAttribute("publisher", publisher);
                    request.setAttribute("authors", authors);

                    request.getRequestDispatcher("/admin/see-product.jsp").forward(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
            }
        } else if (request.getServletPath().equals("/admin/product/delete")) {
            String id = request.getParameter("id");
            if (id != null && !id.equals("")) {
                try {
                    Statement s = ConnectionDB.connect();
                    Connection conn = s.getConnection();
                    String sqlCategory = "DELETE FROM books WHERE id = ?";

                    PreparedStatement pstCate = conn.prepareStatement(sqlCategory);
                    pstCate.setString(1, id);
                    pstCate.execute();

                    response.sendRedirect("/admin/product");
                } catch (SQLException e) {
                    e.printStackTrace();
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
            }
        } else if (request.getServletPath().equals("/admin/categories/add")) {
            request.getRequestDispatcher("/admin/add-categories.jsp").forward(request, response);
        } else if (request.getServletPath().equals("/admin/categories/edit")) {
            String id = request.getParameter("id");
            if (id != null && !id.equals("")) {
                try {
                    Statement s = ConnectionDB.connect();
                    Connection conn = s.getConnection();
                    String sqlCategory = "SELECT * FROM categories WHERE id=?";

                    PreparedStatement pst = conn.prepareStatement(sqlCategory);
                    pst.setString(1, id);
                    ResultSet categories = pst.executeQuery();
                    categories.first();

                    request.setAttribute("categories", categories);
                    request.getRequestDispatcher("/admin/edit-categories.jsp").forward(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
            }
        } else if (request.getServletPath().equals("/admin/categories/see")) {
            String id = request.getParameter("id");
            if (id != null && !id.equals("")) {
                try {
                    Statement s = ConnectionDB.connect();
                    Connection conn = s.getConnection();
                    String sqlCategory = "SELECT * FROM categories WHERE id=?";

                    PreparedStatement pst = conn.prepareStatement(sqlCategory);
                    pst.setString(1, id);
                    ResultSet categories = pst.executeQuery();
                    categories.first();

                    request.setAttribute("categories", categories);
                    request.getRequestDispatcher("/admin/see-categories.jsp").forward(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
            }
        } else if (request.getServletPath().equals("/admin/categories/delete")) {
            String id = request.getParameter("id");
            if (id != null && !id.equals("")) {
                try {
                    Statement s = ConnectionDB.connect();
                    Connection conn = s.getConnection();
                    String sqlCategory = "DELETE FROM categories WHERE id = ?";

                    PreparedStatement pstCate = conn.prepareStatement(sqlCategory);
                    pstCate.setString(1, id);

                    pstCate.execute();


                    response.sendRedirect("/admin/product");
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
        if (request.getServletPath().equals("/admin/product/add")) {


            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String category = request.getParameter("category");
            String publisher = request.getParameter("publisher");
            String author = request.getParameter("author");
            String price = request.getParameter("price");
            String stock = request.getParameter("stock");
            String img1 = request.getParameter("imgPlaceHolder1");
            String img2 = request.getParameter("imgPlaceHolder2");
            String img3 = request.getParameter("imgPlaceHolder3");

            try {
                Statement s = ConnectionDB.connect();
                Connection conn = s.getConnection();
                String sqlCategory = "INSERT INTO books (title, type, description, price, in_stock, publisher, author, active, rating) VALUE (?, ?, ?, ?, ?, ?,?,1, 0)";

                PreparedStatement pstCate = conn.prepareStatement(sqlCategory, Statement.RETURN_GENERATED_KEYS);
                pstCate.setString(1, name);
                pstCate.setInt(2, Integer.parseInt(category));
                pstCate.setString(3, description);
                pstCate.setDouble(4, Double.parseDouble(price));
                pstCate.setInt(5, Integer.parseInt(stock));
                pstCate.setInt(6, Integer.parseInt(publisher));
                pstCate.setInt(7, Integer.parseInt(author));

                pstCate.executeUpdate();

                ResultSet rs = pstCate.getGeneratedKeys();
                rs.next();
                long id = rs.getLong(1);
                if (img1 != null) {
                    img1 = img1.substring(img1.lastIndexOf("/") +1 , img1.length());
                    System.out.println(img1);
                    String sqlImg = "INSERT INTO img (id_book, img) VALUE (?, ?)";

                    PreparedStatement pstImg = conn.prepareStatement(sqlImg);

                    pstImg.setLong(1, id);
                    pstImg.setString(2, img1);
                    pstImg.executeUpdate();

                }
                if (img2 != null) {
                    img2 = img2.substring(img2.lastIndexOf("/") +1 , img2.length());
                    String sqlImg = "INSERT INTO img (id_book, img) VALUE (?, ?)";

                    PreparedStatement pstImg = conn.prepareStatement(sqlImg);

                    pstImg.setLong(1, id);
                    pstImg.setString(2, img2);
                    pstImg.executeUpdate();
                }
                if (img3 != null) {
                    img3 = img3.substring(img3.lastIndexOf("/") +1 , img3.length());
                    String sqlImg = "INSERT INTO img (id_book, img) VALUE (?, ?)";

                    PreparedStatement pstImg = conn.prepareStatement(sqlImg);

                    pstImg.setLong(1, id);
                    pstImg.setString(2, img3);
                    pstImg.executeUpdate();
                }


            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

            response.sendRedirect("/admin/product");
        } else if (request.getServletPath().equals("/admin/product/edit")) {
            String id = request.getParameter("id");
            if (id != null && !id.equals("")) {
                String name = request.getParameter("name");
                String description = request.getParameter("description");
                String category = request.getParameter("category");
                String publisher = request.getParameter("publisher");
                String author = request.getParameter("author");
                String price = request.getParameter("price");
                String stock = request.getParameter("stock");
                try {
                    Statement s = ConnectionDB.connect();
                    Connection conn = s.getConnection();
                    String sqlCategory = "UPDATE books SET title=?,type=?,description=?,price=?,in_stock=?,publisher=?,author=? where id=?";
                    PreparedStatement pstCate = conn.prepareStatement(sqlCategory);
                    pstCate.setString(1, name);
                    pstCate.setInt(2, Integer.parseInt(category));
                    pstCate.setString(3, description);
                    pstCate.setDouble(4, Double.parseDouble(price));
                    pstCate.setInt(5, Integer.parseInt(stock));
                    pstCate.setInt(6, Integer.parseInt(publisher));
                    pstCate.setInt(7, Integer.parseInt(author));
                    pstCate.setString(8, id);

                    pstCate.execute();


                } catch (SQLException e) {
                    e.printStackTrace();
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }

            }
            response.sendRedirect("/admin/product");
        } else if (request.getServletPath().equals("/admin/categories/add")) {
            String name = request.getParameter("name");
            try {
                Statement s = ConnectionDB.connect();
                Connection conn = s.getConnection();
                String sqlCategory = "INSERT INTO categories (name, active) VALUE (?,1)";

                PreparedStatement pstCate = conn.prepareStatement(sqlCategory);
                pstCate.setString(1, name);
                pstCate.execute();
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            response.sendRedirect("/admin/product");
        } else if (request.getServletPath().equals("/admin/categories/edit")) {
            String id = request.getParameter("id");
            if (id != null && !id.equals("")) {
                String name = request.getParameter("name");
                response.getWriter().println(name);
                try {
                    Statement s = ConnectionDB.connect();
                    Connection conn = s.getConnection();
                    String sqlCategory = "UPDATE categories SET name=? where id=?";
                    PreparedStatement pstCate = conn.prepareStatement(sqlCategory);
                    pstCate.setString(1, name);
                    pstCate.setString(2, id);
                    pstCate.execute();
                } catch (SQLException e) {
                    e.printStackTrace();
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
            }
            response.sendRedirect("/admin/product");
        }
    }


}
