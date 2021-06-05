/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bd.Data;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Producto;

/**
 *
 * @author Erik
 */
public class agregar_producto_Servlet extends HttpServlet {

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
            Data data = new Data();

            int id = 0;
            String codigo = request.getParameter("txtCodigo");
            String nombre = request.getParameter("txtNombre");
            int precio = Integer.parseInt(request.getParameter("txtPrecio"));
            int stock = Integer.parseInt(request.getParameter("txtStock"));
            int tipo_producto = Integer.parseInt(request.getParameter("txtTipo"));
            int costo_compra = Integer.parseInt(request.getParameter("txtCosto"));
            int total = costo_compra * stock;

            System.out.println("--------try--------");
            System.out.println(id);
            System.out.println(codigo);
            System.out.println(nombre);
            System.out.println(precio);
            System.out.println(stock);
            System.out.println(tipo_producto);
            System.out.println(costo_compra);
            System.out.println(total);
            System.out.println("-------------------");

            Producto p = data.getProductoSegunCodigoDeBarra(codigo);
            if (p != null) {

                System.out.println("--------p!=null--------");
                System.out.println(id);
                System.out.println(codigo);
                System.out.println(nombre);
                System.out.println(precio);
                System.out.println(stock);
                System.out.println(tipo_producto);
                System.out.println(costo_compra);
                System.out.println(total);
                System.out.println("-------------------");

                data.editarProductoPorId(p.getId(), codigo, nombre, precio, stock, tipo_producto);
                data.editarCompra(p.getId(), costo_compra, total);
                request.getRequestDispatcher("agregarProducto.jsp?m=1").forward(request, response);
            } else {
                if (codigo.isEmpty()) {
                    System.out.println("--------codigo es igual a nada--------");
                    System.out.println(id);
                    System.out.println(codigo);
                    System.out.println(nombre);
                    System.out.println(precio);
                    System.out.println(stock);
                    System.out.println(tipo_producto);
                    System.out.println(costo_compra);
                    System.out.println(total);
                    System.out.println("-------------------");
                    Producto producto = new Producto(id, codigo, nombre, precio, stock, tipo_producto);
                    data.insertarProducto(producto);
                    data.insertarCompra(stock, costo_compra, total);
                    request.getRequestDispatcher("agregarProducto.jsp?m=1").forward(request, response);
                } else {
                    System.out.println("--------codigo igual a algo--------");
                    System.out.println(id);
                    System.out.println(codigo);
                    System.out.println(nombre);
                    System.out.println(precio);
                    System.out.println(stock);
                    System.out.println(tipo_producto);
                    System.out.println(costo_compra);
                    System.out.println(total);
                    System.out.println("-------------------");
                    Producto producto = new Producto(id, codigo, nombre, precio, stock, tipo_producto);
                    data.insertarProductoConCodigo(producto);
                    data.insertarCompra(stock, costo_compra, total);
                    request.getRequestDispatcher("agregarProducto.jsp?m=1").forward(request, response);
                }

            }

        } catch (Exception e) {
            request.getRequestDispatcher("agregarProducto.jsp?m=2").forward(request, response);
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
