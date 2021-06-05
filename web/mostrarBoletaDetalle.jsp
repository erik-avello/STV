<%-- 
    Document   : mostrarBoletaDetalle
    Created on : 04-01-2021, 18:22:13
    Author     : Santo Tomás
--%>

<%@page import="model.DetalleBoleta"%>
<%@page import="java.util.List"%>
<%@page import="bd.Data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="ValidarInicioSesion.jsp" %>
<link type="text/css" rel="stylesheet" href="Style/materialize/css/materialize.min.css"  media="screen,projection"/>
<link type="text/css" rel="stylesheet" href="Style/materialize/css/formulario.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script type="text/javascript" src="Style/materialize/js/jquery-3.2.1.min.js"></script>        
<script type="text/javascript" src="Style/materialize/js/materialize.min.js"></script>


<%
    
    if(usuario.getTipoUsu() == 1){%>
    <div class="noimprimir">
        <ul id="dropdown1" class="dropdown-content ">
            <li><a href="listarUsuarios.jsp">Lista de usuarios</a></li>
            <li class="divider"></li>
            <li><a href="agregarUsuario.jsp">Agregar usuarios</a></li>

        </ul>
        
        <ul id="dropdown2" class="dropdown-content">
            <li><a href="cuenta.jsp">Cuenta</a></li>
            <li class="divider"></li>
            <li><a href="cerrar_sesion.do">Cerrar sesión</a></li>

        </ul>
        
        <ul id="dropdown3" class="dropdown-content">
            <li><a href="listarProductos.jsp">Lista de productos</a></li>
            <li class="divider"></li>
            <li><a href="agregarProducto.jsp">Agregar productos</a></li>

        </ul>
        
        <ul id="dropdown4" class="dropdown-content ">
            <li><a href="generarVenta.jsp">Vender</a></li>
            <li class="divider"></li>
            <li><a href="mostrarBoletas.jsp">Boletas</a></li>

        </ul>

        <nav>
            <div class="nav-wrapper container">
                <a href="menuAdmin.jsp" class="brand-logo logocss" ></a>
                <ul class="right hide-on-med-and-down">
                    <li><a class="dropdown-trigger" href="#!" data-target="dropdown4">Ventas<i class="material-icons right">card_membership</i></a></li>
                    <li><a class="dropdown-trigger" href="#!" data-target="dropdown3">Productos<i class="material-icons right">local_grocery_store</i></a></li>
                    <li><a class="dropdown-trigger" href="#!" data-target="dropdown1">Usuarios<i class="material-icons right">wc</i></a></li>
                    <li><a class="dropdown-trigger" href="#!" data-target="dropdown2">Sesión<i class="material-icons right">account_box</i></a></li>
                    
                </ul>
            </div>
        </nav>
        
        </div>
    </div>
    <%
        }else{ %>
        <div class="noimprimir">
            <ul id="dropdown2" class="dropdown-content">
                <li><a href="cuenta.jsp">Cuenta</a></li>
                <li class="divider"></li>
                <li><a href="cerrar_sesion.do">Cerrar sesión</a></li>
            </ul>
        
            <ul id="dropdown3" class="dropdown-content">
                <li><a href="listarProductos.jsp">Lista de productos</a></li>
            </ul>
            
            <ul id="dropdown4" class="dropdown-content ">
                <li><a href="generarVenta.jsp">Vender</a></li>
                <li class="divider"></li>
                <li><a href="mostrarBoletas.jsp">Boletas</a></li>
            </ul>
            
            <nav>    
                <div class="nav-wrapper container">    
                    <a href="menuUsuario.jsp" class="brand-logo logocss" ></a>    
                    <ul class="right hide-on-med-and-down">
                        <li><a class="dropdown-trigger" href="#!" data-target="dropdown4">Ventas<i class="material-icons right">card_membership</i></a></li>
                        <li><a class="dropdown-trigger" href="#!" data-target="dropdown3">Productos<i class="material-icons right">local_grocery_store</i></a></li>
                        <li><a class="dropdown-trigger" href="#!" data-target="dropdown2">Sesión<i class="material-icons right">account_box</i></a></li>
                    </ul>
                </div>
            </nav>
        </div>
       <% }
        %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
                @media print{
                    .noimprimir {
                        display:none;
                    }
                    .noimprimir2{
                        display:none;
                    }
                }
        </style>
    </head>
    <body>
        <form>
            
        </form>
        
        <form class="container">
            <table>
                <thead>
                    <tr>
                        <th>Producto</th>
                        <th>Valor</th>
                        <th>Cantidad</th>
                        <th>Fecha</th>
                        <th>Pago</th>
                        <th>Subtotal</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Data data = new Data();
                        String idBoleta = request.getParameter("idBoleta");
                        List<DetalleBoleta> listaDetalle = data.getDetalleBoletaId(idBoleta);
                        int total = 0;
                        
                        for (DetalleBoleta db : listaDetalle) {
                            total = db.getTotal();
                            out.println("<tr>");
                            out.println("<td>"+db.getNombreProducto()+"</td>");
                            out.println("<td>"+db.getSubtotal()+"</td>");
                            out.println("<td>"+db.getCantidad()+"</td>");
                            out.println("<td>"+db.getFecha()+"</td>");
                            out.println("<td>"+db.getMedioPago()+"</td>");
                            out.println("<td>"+db.getSubtotal() * db.getCantidad()+"</td>");
                            out.println("</tr>");
                        }
                        
                    %>
                </tbody>
            </table>
            <div>
                <input type="Text" value="Total" readonly="true">
                <input type="Text" name="" value= "<%= total %>" readonly="true">
            </div>
            
            <div align="center">
                <button type="submit" class="btn col s12 red noimprimir2" onclick="print()">Imprimir Boleta
                    <i class="material-icons right">print</i>               
                </button>
            </div>
        </form>
    </body>
    
    <script>
     $(document).ready(function (e) {
        $(".dropdown-trigger").dropdown();    
    });
    </script>
</html>
