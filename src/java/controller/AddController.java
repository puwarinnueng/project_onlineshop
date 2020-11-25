

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.CartTable;
//import static model.Cart_.id;
import model.Quantity;
import model.QuantityTable;


public class AddController extends HttpServlet {

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
        
        Quantity quantity = new Quantity();

        int id_cart = Integer.parseInt(request.getParameter("idCart"));
        Cart cart = CartTable.findCartById(id_cart);

        List<Quantity> old_quantity = QuantityTable.findQuantityByIdCart(cart);
        if (old_quantity == null) {
            Quantity.setIdCart(cart);
            quantity.setQuantity(Integer.parseInt(request.getParameter("quantity")));
            QuantityTable.insertQuantity(quantity);
        } else {
            Quantity.setId(old_quantity.get(0).getId());
            quantity.setIdCart(cart);
            quantity.setQuantity(old_quantity.get(0).getQuantity()+Integer.parseInt(request.getParameter("quantity")));
            QuantityTable.updateQuantity(quantity);
        }
        request.getRequestDispatcher("quantity.jsp").forward(request, response);
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
