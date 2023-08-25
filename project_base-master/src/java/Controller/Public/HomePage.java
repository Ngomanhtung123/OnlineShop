/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Public;

import Dao.BlogDao;
import Dao.ProductDao;
import Dao.SliderDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import sun.rmi.server.Dispatcher;
import Model.Slider;
import Model.Product;
import Model.Blog;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author vieta
 */
public class HomePage extends HttpServlet {

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
//        try ( PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet HomePage</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet HomePage at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
            BlogDao bld = new BlogDao();
          List<Blog> topnew6 = bld.getAllBlogNewtop6();
          List<Blog> topnew31 = new ArrayList<>();
          List<Blog> topnew32 = new ArrayList<>();
          for (int i = 0; i < topnew6.size(); i++) {
            if(i<=2){
            topnew31.add(topnew6.get(i));
            }else{
                topnew32.add(topnew6.get(i));
            }
        }
          Blog newbl = bld.getBlogNew();
          ProductDao prd = new ProductDao();
          List<Product> lpr = prd.getProductNew();
          SliderDao sld = new SliderDao();
          List<Slider> lsl = sld.getAllSliderWithStatus(1);
          request.setAttribute("newtop31", topnew31);
          request.setAttribute("topnew32", topnew32);
          //=====================================================
          request.setAttribute("newbl", newbl);
          request.setAttribute("listslider", lsl);
          request.setAttribute("listproductnew", lpr);
          request.getRequestDispatcher("HomePage.jsp").forward(request, response);
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

}
