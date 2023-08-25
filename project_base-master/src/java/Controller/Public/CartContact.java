/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Public;

import Dao.CartDao;
import Dao.CategoryDao;
import Dao.ProductDao;
import Dao.RoleDao;
import Dao.UserDao;
import Model.Cart;
import Model.Category;
import Model.Product;
import Model.User;
import Model.Order;
import Dao.OrderDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author vieta
 */
public class CartContact extends HttpServlet {

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
        OrderDao odd = new OrderDao();
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("u");
        int uid =u.getUser_id();
        Order od = odd.getLastOrderOfUser(uid);
        String prid[] = request.getParameterValues("productid");
        if (prid == null) {
            response.sendRedirect("CartDetails");
        }
        CategoryDao cd = new CategoryDao();
        List<Category> listCategory = cd.getAllCategories();
        request.setAttribute("listCategory", listCategory);
        int pridd[] = new int[prid.length];
        for (int i = 0; i < pridd.length; i++) {
            pridd[i] = Integer.parseInt(prid[i]);
        }
        CartDao crd = new CartDao();
        List<Cart> lcrn = new ArrayList<>();
        List<Cart> lcr = crd.getALlCartByUserID(u.getUser_id());
        for (int i = 0; i < pridd.length; i++) {
            for (Cart olcr : lcr) {
                if (olcr.getProduct().getProduct_id() == pridd[i]) {
                    lcrn.add(olcr);
                }
            }
        }
        ProductDao dpr = new ProductDao();
        float total = 0;
        for (Cart cart : lcrn) {
            total = total + (cart.getProduct().getSale_prices() * cart.getQuantity());
        }
        
        
        if(od!=null){
        request.setAttribute("name", od.getFullname());
        request.setAttribute("email", od.getEmail());
        request.setAttribute("phone", od.getMobile());
        request.setAttribute("gender", od.getGender());
        request.setAttribute("address", od.getAddress());
        }else{
        request.setAttribute("name", u.getFullname());
        request.setAttribute("email", u.getEmail_address());
        request.setAttribute("phone", u.getPhone_number());
        request.setAttribute("gender", u.getGender());
        request.setAttribute("address", u.getAddress());
        }
        List<Product> newproduct = dpr.GetListLastProduct();
        request.setAttribute("newproduct", newproduct);
        request.setAttribute("total", total);
        request.setAttribute("listCart", lcrn);
        request.getRequestDispatcher("CartContact.jsp").forward(request, response);
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
