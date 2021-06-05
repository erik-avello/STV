<%-- 
    Document   : buscarAgregarUsuarioAjax
    Created on : 10-01-2021, 23:47:50
    Author     : Erik Avello
--%>
<%@page import="model.User"%>
<%@page import="model.Producto"%>
<%@page import="java.util.List"%>
<%@page import="bd.Data"%>

<%
    Data data = new Data();
    String rut = request.getParameter("rut");
    System.out.println("Rut viajante: "+rut);
    User user = null;
    try { 
        user = data.getUsuarioSegunRut(rut);   
        
    } catch (Exception e) {
        user = null;
    }
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% if(user != null){ %>
        <div class="valign-wrapper formulario" id="cargarDatos">
            <div class="">
                <span class="red-text text-darken-2">
                    <h2 class="center-align" style="width: 420px;">Agregar Usuario</h2>
                    <form action="agregar_usuario.do" method="POST">
                        <input type="Text" id="search" name="txtRut" value="<%= user.getRut() %>" required><br>
                        <input type="Text" name="txtNombre" value="<%= user.getNombre() %>" required><br>
                        <input type="Text" name="txtApellido" value="<%= user.getApellido() %>" required><br>
                        <input type="Text" name="txtPass" value="<%= user.getPass() %>" required><br>
                        <select class="browser-default" name="txtTipousuario"><br/>
                                <option value="1">Admin</option>
                                <option value="2">Trabajador</option>
                        </select>
                        
                        <br><div align="center">
                            <button type="submit" class="btn col s12 red">Registrar Usuario
                                <i class="material-icons right">add_box</i>
                            </button>
                        </div>
                    </form>
                </span>
            </div>
        </div>
        <%}else{%>
        <div class="valign-wrapper formulario" id="cargarDatos">
            <div class="">
                <span class="red-text text-darken-2">
                    <h2 class="center-align" style="width: 420px;">Agregar Usuario</h2>
                    <form action="agregar_usuario.do" method="POST">
                        <input type="Text" name="txtRut" id="search" placeholder="Rut: " required value="<%= rut %>"><br>
                        <input type="Text" name="txtNombre" placeholder="Nombre: " required><br>
                        <input type="Text" name="txtApellido" placeholder="Apellido: " required><br>
                        <input type="Text" name="txtPass" placeholder="Contraseña: " required><br>
                        <select class="browser-default" name="txtTipousuario"><br/>
                                <option value="1">Admin</option>
                                <option value="2">Trabajador</option>
                        </select>
                        
                        <br><div align="center">
                            <button type="submit" class="btn col s12 red">Editar Usuario
                                <i class="material-icons right">add_box</i>
                            </button>
                        </div>
                    </form>
                </span>
            </div>
        </div>
        <%}%>
    </body>
</html>
