<%-- 
    Document   : barraNavegacion
    Created on : 01-oct-2020, 14:48:29
    Author     : Erik
--%>



<%@page import="bd.Data"%>
<%@page import="model.User" %>
<%@include file="ValidarInicioSesion.jsp" %>

<% User usu = usuario; %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><% out.println(usuario.getNombre()); %></title>
        <link type="text/css" rel="stylesheet" href="Style/materialize/css/materialize.min.css"  media="screen,projection"/>
        <link type="text/css" rel="stylesheet" href="Style/materialize/css/formulario.css">

        <%-- íconos Materialize --%>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <%-- Librerías js --%>
        <script type="text/javascript" src="Style/materialize/js/jquery-3.2.1.min.js"></script>        
        <script type="text/javascript" src="Style/materialize/js/materialize.min.js"></script>
        <%-- SWEET ALERT --%>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="Style/materialize/js/sweetAlertFunciones.js"></script>

        <meta charset="utf-8">
    </head>

    <body>

        <%
            if (usuario.getTipoUsu() == 1) { %>


        <ul id="dropdown1" class="dropdown-content ">
            <li><a href="listarUsuarios.jsp">Lista de trabajadores</a></li>
            <li class="divider"></li>
            <li><a href="agregarUsuario.jsp">Agregar trabajadores</a></li>
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
            <li class="divider"></li>
            <li><a href="agregarCategoria.jsp">Agregar categoria</a></li>
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
                    <li><a class="dropdown-trigger" href="#!" data-target="dropdown1">Trabajadores<i class="material-icons right">wc</i></a></li>
                    <li><a class="dropdown-trigger" href="#!" data-target="dropdown2">Sesión<i class="material-icons right">account_box</i></a></li>
                </ul>
            </div>
        </nav>

        <%
        } else { %>

        <ul id="dropdown2" class="dropdown-content">
            <li><a href="cuenta.jsp">Cuenta</a></li>
            <li class="divider"></li>
            <li><a href="cerrar_sesion.do">Cerrar sesión</a></li>
        </ul>

        <ul id="dropdown3" class="dropdown-content">
            <li><a href="listarProductos.jsp">Lista de productos</a></li>
        </ul>

        <ul id="dropdown4" class="dropdown-content ">
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
        <% }
        %>
    </body>

    <script>
        $(document).ready(function (e) {
            $(".dropdown-trigger").dropdown();
        });
        
    </script>

    <%
        String mensaje = request.getParameter("m");
        if (mensaje != null) {
            if (mensaje.equals("1")) {%>
            <script type="text/javascript">
                var mensaje = <%= mensaje %>
                if(mensaje == "1"){
                    correcto();
                }
            </script>
            <%} else {%>
            <script type="text/javascript">
                error();
            </script>
            <%}
        }
    %>
</html>
