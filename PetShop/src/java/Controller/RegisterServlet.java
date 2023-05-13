/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Object.Account;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class RegisterServlet extends HttpServlet {

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
            String email = request.getParameter("email");
            String name = request.getParameter("name");
            String account = request.getParameter("account");
            String password = request.getParameter("password");
            String phone = request.getParameter("phone");
            int role = Integer.parseInt(request.getParameter("role"));
            int status = Integer.parseInt(request.getParameter("status"));
            String address = request.getParameter("address");
            Account acc = DataDao.AccountDao.checkAccount(account, email);
            if (acc == null) {
                int kq = DataDao.AccountDao.insertAccount(email, name, account, password, phone, role, status, address);
                if (kq == 1) {
                    request.setAttribute("register", "msg");
                    request.getRequestDispatcher("Register.jsp").forward(request, response);
                } else {
                    request.setAttribute("registerfail", "msg");
                    request.getRequestDispatcher("Register.jsp").forward(request, response);
                }
            } else {
                if (acc.getEmail().equals(email) && acc.getAccount().equals(account)) {
                    request.setAttribute("email", "Email đã tồn tại!!");
                    request.setAttribute("account", "Tài khoản đã tồn tại!!");
                    request.getRequestDispatcher("Register.jsp").forward(request, response);
                } else if (acc.getEmail().equals(email)) {
                    request.setAttribute("email", "Email đã tồn tại!!");
                    request.getRequestDispatcher("Register.jsp").forward(request, response);
                } else {
                    request.setAttribute("account", "Tài khoản đã tồn tại!!");
                    request.getRequestDispatcher("Register.jsp").forward(request, response);
                }
            }
        } catch (Exception e) {
            response.sendRedirect("error.html");
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
        request.setCharacterEncoding("UTF-8");
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
