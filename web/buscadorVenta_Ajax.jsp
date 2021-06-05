<%-- 
    Document   : buscadorVenta_Ajax
    Created on : 09-nov-2020, 17:42:13
    Author     : Erik
--%>

<%@page import="java.util.List"%>
<%@page import="model.Producto"%>
<%@page import="model.User"%>
<%@page import="bd.Data"%>
<%
    Data data = new Data();
    
    String caracter = request.getParameter("caracter");
   
    List<Producto> lista = data.getProductoBuscarLike(caracter);
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <body>
        <table>
            <tr>
                <th>Nombre</th>
                <th>Precio</th>
                <th>Stock</th>
            </tr>
        
        
        <%               
            for(Producto p : lista){
                out.println("<tr>");
                out.println("<th>"+p.getNombre()+"</th>");               
                out.println("<th>"+p.getPrecio()+"</th>");               
                out.println("<th>"+p.getStock()+"</th>");
                out.println("</tr>");
            }
        %>
        </table>
    </body>         
</html>
