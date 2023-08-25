/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Marketing;

import Dao.BlogDao;
import Dao.CategoryBlogDao;
import Dao.UserDao;
import Helper.DBHelper;
import Model.Blog;
import Model.CategoryBlog;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author vieta
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)
public class PostsList extends HttpServlet {

    private static final String DEFAULT_FILENAME = "default.file";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PostsList</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PostsList at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int pageNumber = request.getParameter("pageNum") != null ? Integer.parseInt(request.getParameter("pageNum")) : 1;
        String categoryID = request.getParameter("cateID");
        String search = request.getParameter("search");
        String authorID = request.getParameter("authorID");
        String status = request.getParameter("status");
        String sort = request.getParameter("sort");
        BlogDao blogDao = new BlogDao();
        CategoryBlogDao categoryBlogDao = new CategoryBlogDao();
        UserDao udo = new UserDao();
        ArrayList<User> listUser = udo.getalluserBlog();
        List<CategoryBlog> allCategoryBlog = categoryBlogDao.getAllCategoryBlog();
        List<Blog> list = blogDao.GetAllBlogWithSearch(categoryID, authorID, status, search, sort);
        List<Blog> pagingList = (List<Blog>) DBHelper.Paging(list, pageNumber, 5);
        request.setAttribute("listCate", allCategoryBlog);
        request.setAttribute("listUser", listUser);
        request.setAttribute("list", pagingList);
        request.setAttribute("pageNum", pageNumber);
        request.setAttribute("totalPage", list.size() % 5 == 0 ? list.size() / 5 : (list.size() / 5 + 1));
        request.setAttribute("cateID", categoryID);
        request.setAttribute("authorID", authorID);
        request.setAttribute("status", status);
        request.setAttribute("search", search);
        request.setAttribute("sort", sort);
        request.getRequestDispatcher("PostsList.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User u1 = new User();
        u1.setUser_id(3);
        HttpSession session = request.getSession();
        session.setAttribute("u", u1);
        User u = (User) session.getAttribute("u");
        String id = request.getParameter("id");
        String title = request.getParameter("title");
        String cateID = request.getParameter("cateID");
        String status = request.getParameter("status");
        String content = request.getParameter("content");
        BlogDao blogDao = new BlogDao();
        Blog blog = blogDao.getBlogById(Integer.parseInt(id));
        String img = request.getParameter("img");
        img = "images/" + img;
        blogDao.update(id, title, cateID, status, content, img, u.getUser_id());
        response.sendRedirect("PostsList");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return DEFAULT_FILENAME;
    }
}
