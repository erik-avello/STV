/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bd.Data;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.TipoProducto;
import java.util.ArrayList;

/**
 *
 * @author Erik
 */
public class agregar_categoria_Servlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            Data data = new Data();
            String nombre = request.getParameter("txtNombre");
            
            List<TipoProducto> lista = data.getTipoProducto();
            if(lista != null){
                for (TipoProducto x : lista) {
                    if(x.getNombre().toLowerCase() == nombre){
                        request.getRequestDispatcher("agregarCategoria.jsp?m=2").forward(request, response);
                    }else{
                        data.insertarCategoria(nombre);
                        request.getRequestDispatcher("agregarCategoria.jsp?m=1").forward(request, response);
                    }
                }
            }
            
            request.getRequestDispatcher("agregarCategoria.jsp?m=1").forward(request, response);
        } catch (Exception e) {
            request.getRequestDispatcher("agregarCategoria.jsp?m=2").forward(request, response);
            
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
