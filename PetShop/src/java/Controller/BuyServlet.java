/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Object.Account;
import Object.Pet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class BuyServlet extends HttpServlet {

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
            HttpSession session = request.getSession();
            HashMap<Integer,Integer> cart = (HashMap<Integer, Integer>)session.getAttribute("cart");
            Account acc = (Account)session.getAttribute("accCustomer");
           if(acc != null){
               int order = DataDao.OrderDao.insertOrder(acc.getId(),cart);
               session.removeAttribute("cart");
               ArrayList<Pet> listpet = DataDao.PetDao.getAllPet();
            ArrayList<Pet> listcate = DataDao.PetDao.getAllCate();
            if(listcate != null && listcate.size() > 0){
             if(listpet != null && listpet.size() > 0){
                request.setAttribute("listpet", listpet);
                request.setAttribute("listcate", listcate);
                request.setAttribute("notice", "buysuccess");
                request.getRequestDispatcher("main.jsp").forward(request, response);
            }else{
                request.setAttribute("emptypet", "Không có Pet nào để bán");
                request.getRequestDispatcher("main.jsp").forward(request, response);
            }   
            }else{
                request.getRequestDispatcher("main.jsp").forward(request, response);
            }
           } else{
               ArrayList<Pet> listcate = DataDao.PetDao.getAllCate();
               request.setAttribute("listcate", listcate);
               request.getRequestDispatcher("moreinformation.jsp").forward(request, response);
           }
        }catch(Exception e){
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
