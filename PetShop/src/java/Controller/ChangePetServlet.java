/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

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
public class ChangePetServlet extends HttpServlet {

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
            int idPet = Integer.parseInt(request.getParameter("idpet"));
            int statusPet = Integer.parseInt(request.getParameter("statuspet"));
            String namepet = request.getParameter("txtname");
            String imgpet = request.getParameter("txtimg");
            String oldimgpet = request.getParameter("oldimg");
            String des = request.getParameter("txtdes");
            float price = Float.parseFloat(request.getParameter("price"));
            if ("".equals(imgpet)) {
                int kq = DataDao.PetDao.updatePet(namepet, oldimgpet, des, price, idPet, statusPet);
                if (kq == 1) {
                    request.getRequestDispatcher("ProductServlet").forward(request, response);
                } else {
                    response.sendRedirect("error.html");
                }
            } else {
                int kq = DataDao.PetDao.updatePet(namepet, imgpet, des, price, idPet, statusPet);
                if (kq == 1) {
                    request.getRequestDispatcher("ProductServlet").forward(request, response);
                } else {
                    response.sendRedirect("error.html");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
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
