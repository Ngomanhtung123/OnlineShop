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
public class SearchProductList extends HttpServlet {

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
        String pricep = request.getParameter("pricerange");
        String keywordp = request.getParameter("keyword");
        String checkp = request.getParameter("check");
        String pagep = request.getParameter("page");
        String price[]; 
        int low = 0;
        int high = 0;
        boolean check2 = false;
        if(pricep==""){
        pricep=null;
        }else{
        price = pricep.split(",");
        try {
            low = Integer.parseInt(price[0].trim());
            high = Integer.parseInt(price[1].trim());
            check2 = true;
            if(pricep=="0, 0"){
                pricep= "0, 5";
            }
        } catch (NumberFormatException e) {
            check2 = false;
        }
        }
        ProductDao pd = new ProductDao();
        CategoryDao cd = new CategoryDao();
        boolean check = false;
        if (checkp != null) {
            check = Boolean.parseBoolean(checkp);
        }
        int page = 0;
        int size = pd.getsize(keywordp, check, low, high, check2);
        int SoTrang;
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
        List<Product> lp = pd.GetProductsOrderAandSearch(page, keywordp, check, low, high, check2);
        List<Category> lc = cd.getAllCategories();
        List<Product> newproduct = pd.GetListLastProduct();
        request.setAttribute("listproduct", lp);
        request.setAttribute("listcategory", lc);
        request.setAttribute("pricerange", pricep);
        request.setAttribute("pageactive", page);
        request.setAttribute("sotrang", SoTrang);
        request.setAttribute("keyword", keywordp);
        request.setAttribute("check", check);
        request.setAttribute("newproduct", newproduct);
        request.setAttribute("notsearch", 1);
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

//    private int getlowprice(String pricep) {
//        if(pricep==null||pricep.equals("")){
//        return 0;
//        }else{
//        String[] prices = pricep.split(",");
//        int low;
//            try {
//            low = Integer.parseInt(prices[0].trim());    
//            } catch (Exception e) {
//            }
//        
//        return low;
//        }
//    }
//
//    private int getHighprice(String pricep) {
//        if(pricep==null||pricep.equals("")){
//        return 0;
//        }else{
//        String[] prices = pricep.split(",");
//        int high = Integer.parseInt(prices[1].trim());
//        return high;
//        }
//    }
}
