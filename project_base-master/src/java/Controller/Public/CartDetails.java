/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Public;

import Dao.CartDao;
import Dao.ProductDao;
import Model.Cart;
import Dao.CategoryDao;
import Model.Category;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import Model.User;

/**
 *
 * @author vieta
 */
public class CartDetails extends HttpServlet {

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
        User u = (User) session.getAttribute("u");
//        if(u==null||u.getRole_id()!=2){
//        response.sendRedirect("UserLogin");
//        return;
//        }
        String product_idp = request.getParameter("productID");
        String uproductp = request.getParameter("uproduct");
        String checkp = request.getParameter("check");
        boolean check = false;
        try {
            check = Boolean.parseBoolean(checkp);
        } catch (Exception e) {
        }
        String productdelete = request.getParameter("productdelete");
        CategoryDao cd = new CategoryDao();
        List<Category> listcataCategory = cd.getAllCategories();
        CartDao d = new CartDao();
        ProductDao pd = new ProductDao();
        if (product_idp != null) {
            d.Addtocart(u.getUser_id(), Integer.parseInt(product_idp));
        }
        d.UpdateCart(check, uproductp, productdelete, u.getUser_id());
        List<Cart> lc = d.getALlCartByUserID(u.getUser_id());
        double totals = d.getTotals(lc);
        List<Product> newproduct = pd.GetListLastProduct();
        request.setAttribute("newproduct", newproduct);
        request.setAttribute("listcart", lc);
        request.setAttribute("totals", totals);
        request.setAttribute("listcatacategory", listcataCategory);
        request.getRequestDispatcher("CartDetails.jsp").forward(request, response);

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
