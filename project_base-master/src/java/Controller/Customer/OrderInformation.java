/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Customer;

import Dao.OrderDao;
import Dao.OrderDetailDao;
import Dao.ProductDao;
import Model.Order;
import Model.Category;
import Dao.CategoryDao;
import Model.OrderDetail;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author vieta
 */
public class OrderInformation extends HttpServlet {

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
        CategoryDao cd = new CategoryDao();
        ProductDao pd = new ProductDao();
        response.setContentType("text/html;charset=UTF-8");
        String status = request.getParameter("status");
        String soid = request.getParameter("oid");
        int oid = Integer.parseInt(soid);
        OrderDao od = new OrderDao();
        if (status != null) {
            od.ChangeStatusOrderById(oid, 4);
            String httpclient = "OrderInformation?oid=" + oid;
            response.sendRedirect(httpclient);
        }
        Order o = od.getOrderById(oid);// order
        OrderDetailDao odd = new OrderDetailDao();
        ArrayList<OrderDetail> lord = odd.GetAllOrderDetailByOrderId(oid);
        if (status != null) {
            for (OrderDetail orderdetail : lord) {
                pd.AddQuantity(orderdetail.getProduct_id(), orderdetail.getQuantity());
            }
        }
// lay ra cart detail co id truyen vao
        request.setAttribute("Order", o);
        request.setAttribute("ListOrderDetail", lord);
        List<Category> listCategory = cd.getAllCategories();
        List<Product> newproduct = pd.GetListLastProduct();
        request.setAttribute("newproduct", newproduct);
        request.setAttribute("listCategory", listCategory);
        request.getRequestDispatcher("OrderInformation.jsp").forward(request, response);
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
