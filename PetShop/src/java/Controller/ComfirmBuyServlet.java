/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

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
public class ComfirmBuyServlet extends HttpServlet {

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
            String name = request.getParameter("txtname");
            String phone = request.getParameter("txtphone");
            String address = request.getParameter("txtaddress");
            int role = Integer.parseInt(request.getParameter("txtrole"));
            HttpSession session = request.getSession();
            HashMap<Integer,Integer> cart = (HashMap<Integer, Integer>)session.getAttribute("cart");
            int insert = DataDao.OrderDao.insertInformation(name, phone, address, role, cart);
            if(insert == 1){
                ArrayList<Pet> listpet = DataDao.PetDao.getAllPet();
            ArrayList<Pet> listcate = DataDao.PetDao.getAllCate();
            if(listcate != null && listcate.size() > 0){
             if(listpet != null && listpet.size() > 0){
                request.setAttribute("listpet", listpet);
                request.setAttribute("listcate", listcate);
                request.setAttribute("msg", "Đơn hàng của bạn đã đươc mua");
                session.removeAttribute("cart");
                request.getRequestDispatcher("main.jsp").forward(request, response);
            }else{
                request.setAttribute("emptypet", "Không có Pet nào để bán");
                request.getRequestDispatcher("main.jsp").forward(request, response);
            }   
            }else{
                request.getRequestDispatcher("main.jsp").forward(request, response);
            }
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
