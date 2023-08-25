/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Sale;

import java.io.IOException;
import Model.Order;
import Dao.OrderDao;
import Model.Product;
import Dao.OrderDetailDao;
import Dao.ProductDao;
import Dao.SendMail;
import Dao.UserDao;
import Model.OrderDetail;
import Model.User;
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
public class OrderDetails extends HttpServlet {

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
        HttpSession session = request.getSession();
        User us = (User) session.getAttribute("u");
        int role = us.getRole_id();
        OrderDao od = new OrderDao();
        UserDao ud = new UserDao();
        List<User> lu = ud.GetAllSaler();
        OrderDetailDao oderdetails = new OrderDetailDao();
        String id = request.getParameter("id");
        String saler = request.getParameter("saler")==null ? "": request.getParameter("saler");
        String order_status = request.getParameter("orderstatus");
        Order o = od.getOrderByID(id);
        od.UpdateOrder(id, order_status);
        if(saler!=""||saler!="0"){
        od.AssignOrder(id, saler);
        }
        o = od.getOrderByID(id);
        int salerID = o.getSale_id();
        List<OrderDetail> listorderdetail = oderdetails.getOderDetailsByOrderID(id);
        User u = ud.getUserByOrderID(id);
        
        request.setAttribute("role", role);
        request.setAttribute("id", id);
        request.setAttribute("order", o);
        request.setAttribute("user", u);
        request.setAttribute("lu", lu);
        request.setAttribute("SalerID", salerID);
        request.setAttribute("listorderdetail", listorderdetail);
        request.getRequestDispatcher("OrderDetails.jsp").forward(request, response);
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
