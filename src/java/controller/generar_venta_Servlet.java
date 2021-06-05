/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.PrinterService;
import bd.Data;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Carrito;
import model.Producto;
/**
 *
 * @author Santo Tomás
 */
public class generar_venta_Servlet extends HttpServlet {

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
            Data data = new Data();
            HttpSession sesionCarrito = (HttpSession) request.getSession();
            List<Carrito> listaCarrito = (List<Carrito>) sesionCarrito.getAttribute("carrito");
            
            String nombreProducto = null;
            int precioProducto = 0;
            int cantidadProducto = 0;
            
            if(listaCarrito.size() >=1){
                String medioPago = request.getParameter("txtMedioPago");
                int total = Integer.parseInt(request.getParameter("txtTotal"));
                String rut = request.getParameter("txtRut");
                data.generarBoleta(medioPago, total, rut);
                System.out.println("rut cliente: "+rut);
                
                for (Carrito c : listaCarrito){
                    String cod = c.getIdProducto();
                    Producto p = data.getProductoSegunCodigoDeBarra(cod);   
                    int cantidad = c.getCantidad();
                    data.generarVenta(p.getId() , p.getPrecio(), cantidad);
                    int restarStock = p.getStock() - cantidad;
                    data.restarStock(restarStock, p.getId());
                    nombreProducto =p.getNombre();
                    precioProducto = p.getPrecio();
                    cantidadProducto = c.getCantidad();
                    
                    try {
                        PrinterService printerService = new PrinterService();
                        System.out.println(printerService.getPrinters());
                        printerService.printString("POS-80", "\n -----------------------");
                        byte[] cutP = new byte[] { 0x1d, 'V', 1 };
                        printerService.printBytes("POS-80", cutP);
                        printerService.printString("POS-80", "\n Producto: "+nombreProducto);
                        printerService.printString("POS-80", "\n Valor: "+precioProducto);
                        printerService.printString("POS-80", "\n Cantidad: "+cantidadProducto);
                        printerService.printString("POS-80", "\n Fecha: ");
                        printerService.printString("POS-80", "\n Medio de pago: "+medioPago);
                        printerService.printString("POS-80", "\n Total: "+total);
                        printerService.printString("POS-80", "\n -----------------------");
                        printerService.printString("POS-80", "\n -----------------------");
                
                    } catch (Exception e) {
                        System.out.println("No hay impresora");
                    }
                }
                 
                listaCarrito.clear();
                request.getRequestDispatcher("generarVenta.jsp?m=1").forward(request, response);
            }
            else{
                request.getRequestDispatcher("generarVenta.jsp?m=2").forward(request, response);
            }
            
                
        } catch (Exception e) {
            request.getRequestDispatcher("generarVenta.jsp?m=2").forward(request, response);
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
