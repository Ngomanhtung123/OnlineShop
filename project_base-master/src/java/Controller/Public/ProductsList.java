/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Public;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Dao.ProductDao;
import Dao.CategoryDao;
import Model.Category;
import Model.Product;
import java.util.List;

/**
 *
 * @author vieta
 */
public class ProductsList extends HttpServlet {

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
        ProductDao pd = new ProductDao();
        CategoryDao cd = new CategoryDao();
        List<Product> AllProduct = pd.GetAllProductOrder();
        int size = AllProduct.size();
        String pagep = request.getParameter("page");
        int SoTrang;
        int page;
        if (size % 12 == 0) {
            SoTrang = (size / 12);
        } else {
            SoTrang = (size / 12) + 1;
        }
        if (size == 0) {
            SoTrang = 0;
        }
        if (pagep == null) {
            page = 1;
        } else {
            page = Integer.parseInt(pagep);
        }
        List<Product> lpp = pd.GetAllProductOrder(page);
        List<Category> lc = cd.getAllCategories();
        List<Product> newproduct = pd.GetListLastProduct();
        request.setAttribute("newproduct", newproduct);
        request.setAttribute("listcategory", lc);
        request.setAttribute("listproduct", lpp);
        request.setAttribute("sotrang", SoTrang);
        request.setAttribute("pageactive", page);
        request.setAttribute("notsearch", 0);
        request.getRequestDispatcher("ProductsList.jsp").forward(request, response);
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
