package controller;

import bd.Data;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
@WebServlet(name = "CarritoComprasServlet", urlPatterns = {"/eliminar.do"})
public class carrito_eliminar_Servlet extends HttpServlet {
    
    List<Carrito> listaCarrito = new ArrayList<>();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        String id = request.getParameter("idProducto");
        System.out.println("ELIMINAR");
        System.out.println(id);

        try {
            Data d;

            d = new Data();

            Producto p = d.getProductoSegunCodigoDeBarra(id);
            Carrito carrito = new Carrito();
            HttpSession sesionCarrito = request.getSession(true);
            listaCarrito = (List<Carrito>) sesionCarrito.getAttribute("carrito");

            System.out.println("-------------------");
            System.out.println(id);
            System.out.println("-------------------");

            for (int i = 0; i < listaCarrito.size(); i++) {
                if (listaCarrito.get(i).getIdProducto().equals(id)) {
                    listaCarrito.remove(i);
                }
            }
            request.getRequestDispatcher("generarVenta.jsp").forward(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(carrito_eliminar_Servlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
