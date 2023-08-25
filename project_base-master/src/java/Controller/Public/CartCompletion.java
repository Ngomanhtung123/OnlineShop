/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Public;

import Dao.CategoryDao;
import Dao.ProductDao;
import Dao.RoleDao;
import Dao.CartDao;
import Dao.NewClass;
import Dao.OrderDao;
import Dao.OrderDetailDao;
import Dao.SendMail;
import Model.Cart;
import Model.Category;
import Model.Order;
import Model.Product;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author vieta
 */
public class CartCompletion extends HttpServlet {

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
        String msg = "";
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("u");
        int uid = u.getUser_id();
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
        List<Cart> lcrn = new ArrayList<>();// danh sach cart
        List<Cart> lcr = crd.getALlCartByUserID(uid);
        for (int i = 0; i < pridd.length; i++) {
            for (Cart cart : lcr) {
                if (cart.getProduct().getProduct_id() == pridd[i]) {
                    lcrn.add(cart);
                }
            }
        }
        //}
        ProductDao dpr = new ProductDao();
        List<Product> lp = new ArrayList<>();// danh sach san pham
        for (Cart cart : lcrn) {
            lp.add(cart.getProduct());
        }
        boolean check = true;
        //thay doi so luong san pham trong kho 
        for (int i = 0; i < lp.size(); i++) {
            Product p = lp.get(i);
            Cart c = lcrn.get(i);
            if(dpr.changeQuantity(p.getProduct_id(), c.getQuantity())==false){
                msg = "The quantity of the product is not enough to Order";
                request.setAttribute("MSG", msg);
                check = false;
                break;
            }
        }
        if (check) {
        float total = 0;
        for (int i = 0; i < lp.size(); i++) {
            total += (float) lp.get(i).getSale_prices() * (float) lcrn.get(i).getQuantity();

        }
        //nhan ve thong tin ca nhan 
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        int gender = -1;
        try {
            gender = Integer.parseInt(request.getParameter("gender"));
        } catch (NumberFormatException e) {
        }

        // so sanh voi thong tin trong he thong
        OrderDao ord = new OrderDao();
        ord.CreateOrder(uid, name, email, phone, address, 1, total, gender);
        
        int lastid = ord.GetIdOfLastOrders(uid);
        OrderDetailDao orda = new OrderDetailDao();
        for (Cart cart : lcrn) {
            for (int i = 0; i < pridd.length; i++) {
                if (pridd[i] == cart.getProduct().getProduct_id()) {
                    orda.CreateOrderDetail(u.getUser_id(), cart.getProduct().getSale_prices() * cart.getQuantity(), cart.getQuantity(), lastid, cart.getProduct().getProduct_id());
                }
            }
        }
        String msgEmail = "Order code : "+lastid+" \n"
                + "Cost : "+total+"$\n"
                + "Payment on delivery";
        SendMail.send(email, "Your Order Has Been Placed Successfully", msgEmail);
        request.setAttribute("total", total);
        request.setAttribute("lsitCart", lcrn);
            for (int i = 0; i < pridd.length; i++) {
                crd.deleteCart(uid, pridd[i]);
            }
        }
        List<Product> newproduct = dpr.GetListLastProduct();
        request.setAttribute("newproduct", newproduct);
        request.getRequestDispatcher("CartCompletion.jsp").forward(request, response);
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
