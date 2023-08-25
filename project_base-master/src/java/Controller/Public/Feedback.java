/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Public;

import Dao.*;
import Model.Category;
import Model.Product;
import Dao.OrderDetailDao;
import Model.User;
import Dao.FeedbackDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author vieta
 */
public class Feedback extends HttpServlet {

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
            out.println("<title>Servlet Feedback</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Feedback at " + request.getContextPath() + "</h1>");
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
        int orderID;
        int id = Integer.parseInt(request.getParameter("productID"));
        HttpSession session = request.getSession();
        FeedbackDao fd = new FeedbackDao();
        User u = (User) session.getAttribute("u");
        orderID = Integer.parseInt(request.getParameter("orderID"));  
        if(fd.checktFeedbackExist(id, u.getUser_id(), orderID)==true){
            String MSG = "Product of this order you have Feedback"; 
            request.setAttribute("msg", MSG);
        }else{
        ProductDao dpr = new ProductDao();
        Product pr = dpr.getProductByid(id);
        request.setAttribute("product", pr);
        }
        session.setAttribute("orderID", orderID);
        request.getRequestDispatcher("Feedback.jsp").forward(request, response);
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
        FeedbackDao dao = new FeedbackDao();
        OrderDetailDao odd = new OrderDetailDao();
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("u");
        String feedback = request.getParameter("feedback");
        String rate = request.getParameter("rate");
        int orderID = (int)session.getAttribute("orderID");
        session.removeAttribute("orderID");
        String pid = request.getParameter("pid");
        String img = request.getParameter("img");
        dao.sendfeedback(feedback, rate, u.getUser_id(), pid, img, orderID);
        odd.changeFeedbackOrderDetail(pid, orderID);
        response.sendRedirect("ProductDetails?productID="+pid);
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
