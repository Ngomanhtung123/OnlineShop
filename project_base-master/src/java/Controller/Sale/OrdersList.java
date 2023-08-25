/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Sale;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Model.Order;
import Dao.OrderDao;
import Dao.UserDao;
import Model.User;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author vieta
 */
public class OrdersList extends HttpServlet {

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
        User u1 = (User) session.getAttribute("u");
        String confirmp = request.getParameter("confirm");
        String pagep = request.getParameter("page");
        int page;
        try {
            page = Integer.parseInt(pagep);
        } catch (Exception e) {
            page = 1;
        }
        int confirm;
        try {
            confirm = Integer.parseInt(confirmp);
        } catch (Exception e) {
            confirm = 0;
        }

        OrderDao od = new OrderDao();
        List<Order> list = new ArrayList<>();
        int sale_id = u1.getUser_id();
        request.setAttribute("confirm", confirmp);
        if (confirm == 0) {
            int size = od.getsize(sale_id);
            int sotrang;
            if (size % 12 == 0) {
                sotrang = size / 12;
            } else {
                sotrang = size / 12 + 1;
            }
            list = od.GetAllOrderBysaleID(sale_id);
            request.setAttribute("pageactive", page);
            request.setAttribute("list", list);
            request.setAttribute("sotrang", sotrang);
            //nhan=3;
            request.getRequestDispatcher("OrdersList.jsp").forward(request, response);
        } else if (confirm == 1) {
            String id = request.getParameter("orderid");
            String customername = request.getParameter("customername");
            int size = od.getSize(id, customername, sale_id);
            int sotrang;
            if (size % 12 == 0) {
                sotrang = size / 12;
            } else {
                sotrang = size / 12 + 1;
            }
            list = od.getOrderbySearch(id, customername, page, sale_id);
            request.setAttribute("id", id);
            request.setAttribute("customername", customername);
            request.setAttribute("pageactive", page);
            request.setAttribute("sotrang", sotrang);
            request.setAttribute("list", list);
            //nhan=1;
            request.getRequestDispatcher("OrdersList.jsp").forward(request, response);
        } else if (confirm == 2) {
            String startdate = request.getParameter("startdate");
            String finishdate = request.getParameter("finishdate");
            String salename = request.getParameter("salename");
            String status = request.getParameter("status");
            int size = od.getsize(startdate, finishdate, status, salename, sale_id);
            int sotrang;
            if (size % 12 == 0) {
                sotrang = size / 12;
            } else {
                sotrang = size / 12 + 1;
            }
            list = od.getOrderbySearch(startdate, finishdate, status, salename, page, sale_id);
            request.setAttribute("startdate", startdate);
            request.setAttribute("finishdate", finishdate);
            request.setAttribute("salename", salename);
            request.setAttribute("status", status);
            request.setAttribute("pageactive", page);
            request.setAttribute("sotrang", sotrang);
            request.setAttribute("list", list);

            //nhan=2;
            request.getRequestDispatcher("OrdersList.jsp").forward(request, response);
        }
//        response.setContentType("text/html;charset=UTF-8");
//        try ( PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet OrdersList</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1> " + list.size() + "</h1>");
//            out.println("<h1> " + nhan + "</h1>");
//            
//            out.println("</body>");
//            out.println("</html>");
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

}
