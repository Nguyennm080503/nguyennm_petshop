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
public class MainController extends HttpServlet {

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
            String ac = request.getParameter("action");
            if (ac != null) {
                String url = "";
                switch (ac) {
                    case "Đăng nhập":
                        url = "LoginServlet";
                        break;
                    case "Logout":
                        url = "LogoutServlet";
                        break;
                    case "Đăng kí":
                        url = "RegisterServlet";
                        break;
                    case "Account":
                        url = "AccountServlet";
                        break;
                    case "Tìm kiếm":
                        url = "SearchServlet";
                        break;
                    case "Thay đổi":
                        url = "Change";
                        break;
                    case "Product":
                        url = "ProductServlet";
                        break;
                    case "Thay đổi Pet":
                        url = "ChangePetServlet";
                        break;
                    case "+ Dòng Pet":
                        url = "CategoryServlet";
                        break;
                    case "+ Thêm Pet":
                        url = "AddNewPetServlet";
                        break;
                    case "Thêm":
                        url = "AddPetServlet";
                        break;
                    case "Tạo":
                        url = "AddCateServlet";
                        break;
                    case "Order":
                        url = "OrderServlet";
                        break;
                    case "Comfirm":
                        url = "ComfirmStatusServlet";
                        break;
                    case "Detail":
                        url = "DetailOrderServlet";
                        break;
                    case "Tìm":
                        url = "FindInMainServlet";
                        break;
                    case "Type":
                        url = "TypeServlet";
                        break;
                    case "Thêm vào giỏ hàng":
                        url = "AddToCartServlet";
                        break;
                    case "ViewCart":
                        url = "ViewCartServlet";
                        break;
                    case "Xác nhận":
                        url = "ChangeCartServlet";
                        break;
                    case "Xoá":
                        url = "DeleteCartServlet";
                        break;
                    case "Mua":
                        url = "BuyServlet";
                        break;
                    case "Đồng ý":
                        url = "ComfirmBuyServlet";
                        break;
                    case "ViewHistory":
                        url = "ViewHistoryServlet";
                        break;
                    case "Contact":
                        url = "ContactServlet";
                        break;
                    case "DetailPet":
                        url = "DetailPetServlet";
                        break;
                    case "Personal":
                        url = "PersonalServlet";
                        break;
                    default:
                        url = "error.html";
                        break;
                }
                request.getRequestDispatcher(url).forward(request, response);
            }
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
        request.setCharacterEncoding("UTF-8");
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
