<%-- 
    Document   : eliminarProducto
    Created on : 14-may-2020, 15:32:40
    Author     : Erik
--%>
<%@page import="bd.Data"%>
<%@include file="ValidarInicioSesion.jsp" %>
<%@page import="model.Producto"%>
<%@page import="model.TipoProducto" %>

<% Data data = new Data(); %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Código</th>
                <th>Nombre</th>
                <th>Precio</th>
                <th>Stock</th>
                <th>Tipo Producto</th>
                <th>Acción</th>
            </tr>
            <% 
                for(Producto p : data.getProductos()){
                    out.println("<tr>");
                        out.println("<th>"+p.getId()+"</th>");
                        out.println("<th>"+p.getCodigo()+"</th>");
                        out.println("<th>"+p.getNombre()+"</th>");
                        out.println("<th>"+p.getPrecio()+"</th>");
                        out.println("<th>"+p.getStock()+"</th>");
                        out.println("<th>"+p.getIdTipoProducto()+"</th>");
                        out.println("<th><a href='eliminarProducto.jsp'>Eliminar</a></th>");
                    out.println("</tr>");
                }
            %>
            </table>
    </body>
</html>
