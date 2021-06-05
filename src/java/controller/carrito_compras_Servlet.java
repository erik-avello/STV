/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bd.Data;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
 * @author Erik
 */
public class carrito_compras_Servlet extends HttpServlet {

    List<Carrito> listaCarrito = new ArrayList<>();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String accion = request.getParameter("accion");
            String codProducto = request.getParameter("txtCodigo");
            int cantidad = Integer.parseInt(request.getParameter("txtCantidad"));
            String idProdu = request.getParameter("txtCodigo");
            
            Data d = new Data();
            Producto p = d.getProductoSegunCodigoDeBarra(codProducto);
            Carrito carrito = new Carrito();
            int total = p.getPrecio() * cantidad;
            HttpSession sesionCarrito = request.getSession(true);

           
            if (accion.equals("agregar")) {
                if(p.getStock() >= cantidad){
                    int posicion = 0;
                    int cantidadProducto = 1;
                    if(listaCarrito.size() > 0){
                        for (int i = 0; i < listaCarrito.size(); i++) {
                            if(idProdu.equals(listaCarrito.get(i).getIdProducto())){
                                posicion = i;
                            }
                        }
                        if(idProdu.equals(listaCarrito.get(posicion).getIdProducto())){
                            cantidad = listaCarrito.get(posicion).getCantidad() + cantidad;
                            if(p.getStock() >= cantidad){
                                total = p.getPrecio() * cantidad;
                                listaCarrito.get(posicion).setCantidad(cantidad);
                                listaCarrito.get(posicion).setTotal(total);
                                sesionCarrito.setAttribute("carrito", listaCarrito);
                                request.getRequestDispatcher("generarVenta.jsp").forward(request, response);
                            }else{
                                request.getRequestDispatcher("generarVenta.jsp").forward(request, response);
                            }
                            
                        }else{
                            carrito.setIdProducto(codProducto);
                            carrito.setCantidad(cantidad);
                            carrito.setTotal(total);
                            listaCarrito.add(carrito);

                            sesionCarrito.setAttribute("carrito", listaCarrito);
                            request.getRequestDispatcher("generarVenta.jsp").forward(request, response);
                        }
                    }else{
                        carrito.setIdProducto(codProducto);
                        carrito.setCantidad(cantidad);
                        carrito.setTotal(total);
                        listaCarrito.add(carrito);

                        sesionCarrito.setAttribute("carrito", listaCarrito);
                        request.getRequestDispatcher("generarVenta.jsp").forward(request, response);
                    }
                }else{
                    request.getRequestDispatcher("generarVenta.jsp").forward(request, response);
                }
                
                
            }else if(accion.equals("remover")){
                
            }

//            switch (accion) {
//                case "agregar":
//                    carrito.setIdProducto(codProducto);
//                    carrito.setCantidad(cantidad);
//                    carrito.setTotal(total);
//                    listaCarrito.add(carrito);
//
//                    sesionCarrito.setAttribute("carrito", listaCarrito);
//                    request.getRequestDispatcher("generarVenta.jsp").forward(request, response);
//                    System.out.println("CASO AGREGAR");
//                    break;
//                case "remover":
//                    System.out.println("CASO REMOVER");
//                    for (int i = 0; i < listaCarrito.size(); i++) {
//                        if (listaCarrito.get(i).getIdProducto().equals(codProducto)) {
//                            listaCarrito.remove(i);
//                        }
//                    }
//                    break;
//
//                default:
//                    sesionCarrito.setAttribute("carrito", listaCarrito);
//                    request.getRequestDispatcher("generarVenta.jsp").forward(request, response);
//            }
        } catch (Exception e) {
            request.getRequestDispatcher("generarVenta.jsp?m=2").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
