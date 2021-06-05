<%-- 
    Document   : generarVentaFinal
    Created on : 03-01-2021, 0:57:36
    Author     : Santo Tomás
--%>

<%@page import="model.Producto"%>
<%@page import="java.util.List"%>
<%@page import="model.Carrito"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="barraNavegacion.jsp" %>
<link type="text/css" rel="stylesheet" href="Style/materialize/css/formulario.css">

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <body>
        <form>
            
        </form>
        
        <div class="formulario contenedor">
            
            <div class="uno" >
                <div class="valign-wrapper formulario" >
                    <span class="red-text text-darken-2">
                        <form style="height:500px; overflow: scroll;">
                            <h2 class="center-align">Venta</h2>
                            <table class="responsive-table black-text">      
                            <thead>             
                                <tr>      
                                    <th>Nombre</th>    
                                    <th>Cantidad</th>     
                                    <th>Subtotal</th>                 
                                </tr>           
                            </thead>          

                            <tbody class="black-text"> 
                                
                                <% 
                                    HttpSession sesionCarrito = (HttpSession) request.getSession();
                                    List<Carrito> listaCarrito = (List<Carrito>) sesionCarrito.getAttribute("carrito");
                                    Data data = new Data();
                                    String totalfinal = request.getParameter("idProducto");
                                    for (Carrito c : listaCarrito) {
                                        Producto p = data.getProductoSegunCodigoDeBarra(c.getIdProducto());
                                        
                                        out.println("<tr>");
                                        out.println("<td>"+p.getNombre()+"</td>");
                                        out.println("<td>"+c.getCantidad()+"</td>");
                                        out.println("<td>"+c.getTotal()+"</td>");
                                        out.println("</tr>");
                                    }
                                %>
                            </tbody>
                            <%  out.println("<h5> Total: " + totalfinal + "</h5>");%>
                        </form>

                    </span>
                </div>
                        <div >
                            <form action="generar_venta.do" method="POST">
                                <select class="browser-default" name="txtMedioPago"><br/>
                                    <option value="Efectivo">Efectivo</option>
                                    <option value="Tarjeta">Tarjeta</option>
                                </select>
                                Rut cliente <br><input type="text" name="txtRut" placeholder="Rut cliente">
                                <br><input type="hidden" name="txtTotal" value="<%= totalfinal %>">                            
                                <input type="submit" value="Vender" Class='btn col s12 red'>
                            </form>    
                        </div>    
                </div>

            </div>    
        </div>
        
            
    </body>
</html>
