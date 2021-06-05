package controller;

import bd.Data;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Carrito;
import model.User;

/**
 *
 * @author Erik
 */
@WebServlet(name = "iniciar_sesion_Servlet", urlPatterns = {"/iniciar_sesion.do"})
public class iniciar_sesion_Servlet extends HttpServlet {

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
        
            try {
                PrintWriter out = response.getWriter();
                
                String correo = request.getParameter("txtUsuario");
                String contrasenia = request.getParameter("txtContrasenia");
                
                Data data = new Data(); //Declarando Data
                User user = data.getUsuarioSegunRut_y_Pass(correo, contrasenia); //Declaro un usuario pero en este caso aplico inmediatamente la función
           
                if(user != null){
                    HttpSession sesion = request.getSession(true);
                    sesion.setAttribute("sesion", user);
                    
                    //Si el usuario es tipo 1 es admin y se dirige al menu admin
                    if(user.getTipoUsu() == 1){
                        request.getRequestDispatcher("menuAdmin.jsp").forward(request, response);
                    }
                    //Si el usuario es tipo 2 es usuario normal y se dirige al menu de usuario normal
                    else if(user.getTipoUsu() == 2){
                        request.getRequestDispatcher("menuUsuario.jsp").forward(request, response);
                    }
                }
                
                else{
                    request.getRequestDispatcher("index.jsp?m=1").forward(request, response);
                }
                
            
            } 
            catch (Exception e) {
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
