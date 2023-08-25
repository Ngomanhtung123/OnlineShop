/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Public;

import Dao.CategoryBlogDao;
import Model.CategoryBlog;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import Model.Blog;
import Dao.BlogDao;

/**
 *
 * @author vieta
 */
public class BlogsList extends HttpServlet {

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
//        response.setContentType("text/html;charset=UTF-8");
        String searchp = (String) request.getParameter("search");
        String checkp = request.getParameter("check");
        request.setAttribute("search", searchp);
        request.setAttribute("check", checkp);
        CategoryBlogDao cd = new CategoryBlogDao();
        BlogDao bld = new BlogDao();
        List<CategoryBlog> list = cd.getAllCategoryBlog();
        request.setAttribute("list", list);
        boolean check=false;
        try {
            check=Boolean.parseBoolean(checkp);
        } catch (Exception e) {
        }
        
        int size = bld.GetSize(searchp, check);
            int SoTrang  ;
            if (size % 3 == 0) {
                SoTrang = (size / 3);
            } else {
                SoTrang = (size / 3) + 1;
            }
            if (size == 0) {
                SoTrang = 0;
            }
            String pagestr = (String) request.getParameter("page");
            int page;
            if (pagestr == null) {
                page = 1;
            } else {
                page = Integer.parseInt(pagestr);
            }
            List<Blog> lb = bld.GetBySearch(searchp, page, check);
            request.setAttribute("pageactive", page);
            request.setAttribute("sotrang", SoTrang);
            request.setAttribute("bloglist", lb);
        
        
            Blog newbl = bld.getBlogNew();
            request.setAttribute("newbl", newbl);
            request.getRequestDispatcher("BlogsList.jsp").forward(request, response);
//        try ( PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.print(pagestr+", "+page);
//        }

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
        processRequest(request, response);
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
        processRequest(request, response);

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
    //List<Blog> 
}
