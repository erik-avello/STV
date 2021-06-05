<%-- 
    Document   : cuenta
    Created on : 06-nov-2020, 20:07:57
    Author     : Erik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link type="text/css" rel="stylesheet" href="Style/materialize/css/materialize.min.css"  media="screen,projection"/>
<script type="text/javascript" src="Style/materialize/js/jquery-3.2.1.min.js"></script>        
<script type="text/javascript" src="Style/materialize/js/materialize.min.js"></script>
<link type="text/css" rel="stylesheet" href="Style/materialize/css/formulario.css">

<%@include file="barraNavegacion.jsp" %>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    
    <body >
        <form>
            
        </form>
        
        <div class="valign-wrapper formulario"> 
            <div class="">
                <span class="red-text text-darken-2">
                    <form class="">
                        <h2 class="center-align" >Datos de usuario</h2>
                        
                        Id <input type="Text" readonly="true" value="<% out.println(usu.getId()); %>">  </input>
                        Rut <input type="Text" value="<% out.println(usu.getRut()); %>">  </input>
                        Nombre <input type="Text" value="<% out.println(usu.getNombre()); %>">  </input>
                        Apellido <input type="Text" value="<% out.println(usu.getApellido()); %>">  </input>
                        Contraseña <input type="password" value="<% out.println(usu.getPass()); %>">  </input>
                        Tipo <input type="Text" value="<% out.println(usu.getTipoUsu()); %>">  </input>
                        
                    </form>
                </span>
            </div>
        </div>
    </body>
</html>
