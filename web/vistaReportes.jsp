<%-- 
    Document   : vistaReportes
    Created on : 31-01-2021, 18:21:39
    Author     : JOAQUIN CABELLO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="barraNavegacion.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <div  class="nav-wrapper container contenedor">
            <div class="left-align">
                <h3>Generar reporte productos</h3>
                <form action="reporte.jsp?tipo=producto" method="POST" target="black">
                    <input type="Submit" value="Generar reporte de productos" class="btn col s12 red large btn-large">
                </form>
                
            </div>
            
            <div class="center-align">
                <h3>Generar reporte usuarios</h3>
                <form action="reporte.jsp?tipo=usuario" method="POST" target="black">
                    <input type="Submit" value="Generar reporte de usuarios" class="btn col s12 red large btn-large">
                </form>
                
            </div>
            
            <div class="right-align">
                <h3>Generar reporte productos</h3>
                <form action="reporte.jsp" target="black">
                    <input type="Submit" value="Generar reporte de productos" class="btn col s12 red large btn-large">
                </form>
                
            </div>
        </div>
        
    </body>
</html>
