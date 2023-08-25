/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Marketing;

import Dao.FeedbackDao;
import Model.Feedback;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author vieta
 */
public class FeedbacksList extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet FeedbacksList</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FeedbacksList at " + request.getContextPath() + "</h1>");
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
        String star = request.getParameter("star") == null ? "" : request.getParameter("star");
        String status = request.getParameter("status") == null ? "" : request.getParameter("status");
        String search = request.getParameter("search") == null ? "" : request.getParameter("search");
        String index = request.getParameter("index") == null ? "1" : request.getParameter("index");

        FeedbackDao dao = new FeedbackDao();
        int totalproduct = dao.getAllFeedbackByCondtion(status, star, search, 1, 9999999).size();
        int numberPage = (int) Math.ceil((double) totalproduct / 6);
        List<Feedback> fl = dao.getAllFeedbackByCondtion(status, star, search, Integer.valueOf(index), 6);
        request.setAttribute("feedbacksList", fl);
        request.setAttribute("numberPage", numberPage);
//        for (Feedback feedback : fl) {
//            response.getWriter().print(feedback.getFeedback());
//        }
        request.getRequestDispatcher("./marketing/FeedbacksList.jsp").forward(request, response);
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
