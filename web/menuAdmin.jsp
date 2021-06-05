<%-- 
    Document   : menuAdmin
    Created on : 14-may-2020, 1:14:17
    Author     : Erik

importo data para utilizar sus funciones
importo validadInicioSesion para validar que el usuario realmente está con una sesión activa
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@page import="java.util.Map"%>
<%@page import="model.Boleta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<link type="text/css" rel="stylesheet" href="Style/materialize/css/formulario.css">


<%@page import="bd.Data"%>
<%@include file="barraNavegacion.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%Data data = new Data();%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial scale=1.0">
    </head>
    
    
    <body>
        
        <div class="valign-wrapper container">
            <div style="width: 50%">
                <h3 class="header" align="center">Reporte financiero</h3>
                <div class="card horizontal medium">                
                    <div class="card-stacked">
                  
                        <div class="card-content">
                            <p><h3 class="green-text left">Ingresos</h3></p> 
                            <p><h3 class="red-text center">Gastos</h3></p>
                            <li class="divider"></li>
                            <%
                                int ganancias = 0;
                                int gastos  = 0;
                                
                                if(data.getTotalGanancias() != 0){
                                    ganancias = data.getTotalGanancias();
                                }
                                if(data.getTotalGastos() != 0){
                                    gastos = data.getTotalGastos();
                                }
                                int resultado = ganancias - gastos;
                            %>
                            <p><h4 class="green-text left">$ <%= ganancias %></h4></p>
                            <p><h4 class="red-text center">$ <%= gastos %></h4></p>
                            <li class="divider"></li>
                            <p><h4 >Resultado: $ <%= resultado %></h4></p>
                        </div>
                        
                        <div class="card-action">
                            <a href="#" class="btn col s12 red"><i class="material-icons right">assignment</i>Generar reportes</a>
                        </div>
                    </div>
                </div>
            </div>
            
            <br>

            <div style="width: 50%">
                <h3 class="header" align="center">Reportes Generales</h3>
                <div class="card horizontal medium">                
                    <div class="card-stacked">
                  
                        <div class="card-content">
                            <p><h4 class="green-text">Producto más vendido</h4></p>
                            <li class="divider"></li>
                            <p><h4 class="red-text ">Producto menos vendido</h4></p>
                            <li class="divider"></li>
                            <p><h4 class="green-text">Mejor vendedor</h4></p>
                            <li class="divider"></li>
                        </div>
                        
                        <div class="card-action">
                            <a href="vistaReportes.jsp" class="btn col s12 red"><i class="material-icons right">assignment</i>Generar reportes</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    
</html>
