<%-- 
    Document   : mostrarBoletas_Ajax
    Created on : 07-04-2021, 21:50:29
    Author     : Santo Tomás
--%>

<%@page import="model.Boleta"%>
<%@page import="java.util.List"%>
<%@page import="bd.Data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Data data = new Data();
    
    String caracter = request.getParameter("caracter");
   
    List<Boleta> lista = data.getBoletaLike(caracter);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table class="striped">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Fecha</th>
                        <th>Pago</th>
                        <th>Total</th>
                        <th>Rut Cliente</th>
                        <th>Acción</th>
                    </tr>
                </thead>

                <tbody>
                    <% 
                       
                        for (Boleta b  : lista) {
                            out.println("<tr>");
                            out.println("<td>"+b.getId()+"</td>");
                            out.println("<td>"+b.getFecha()+"</td>");
                            out.println("<td>"+b.getMedioPago()+"</td>");
                            out.println("<td>"+b.getTotal()+"</td>");
                            out.println("<td>"+b.getRut_cliente()+"</td>");
                            out.println("<td><a href='mostrarBoletaDetalle.jsp?idBoleta="+b.getId()+"'>Ver detalle</a></td>");
                            out.println("</tr>");

                        }

                    %>
                </tbody>
            </table>
    </body>
</html>
