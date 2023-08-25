/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Common;

import Dao.UserDao;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Date;

/**
 *
 * @author Admin
 */
@WebServlet(name = "VerifyReset", urlPatterns = {"/VerifyReset"})
public class VerifyReset extends HttpServlet {

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
            out.println("<title>Servlet VerifyReset</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VerifyReset at " + request.getContextPath() + "</h1>");
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
        long resetTime = Long.valueOf(request.getParameter("time"));
        Date currentTime = new Date();
        long timeInMillis = currentTime.getTime();
        if (timeInMillis - resetTime > 3600000) {
            request.setAttribute("messTime", "Key is timeout try again!");
        } else {
            request.setAttribute("messTime", "OK");
            UserDao dao = new UserDao();
            request.getRequestDispatcher("VerifyReset.jsp").forward(request, response);
        }

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
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String newpass = request.getParameter("newpass");
        String renewpass = request.getParameter("renewpass");
        if (!newpass.equals(renewpass)) {
            request.setAttribute("mess", "Renew pass not match with pass");
            request.getRequestDispatcher("VerifyReset.jsp").forward(request, response);
        } else {
            UserDao dao = new UserDao();
            dao.changePassByEmail(email, newpass);
            request.setAttribute("mess", "Change password sucessfully!");
            request.getRequestDispatcher("VerifyReset.jsp").forward(request, response);
        }
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
