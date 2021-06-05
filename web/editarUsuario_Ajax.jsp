<%-- 
    Document   : editarUsuario_Ajax
    Created on : 06-nov-2020, 19:28:20
    Author     : Erik
--%>

<%@page import="model.User"%>
<%@page import="bd.Data"%>
<%
    Data data = new Data();
    
    String id = request.getParameter("id");
   
    User u = data.GetUsuarioPorId(id);
                
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <form action="editar_usuario.do" method="POST">
            <div> 
                <table border="1">
                    <tr>
                        <th>Id</th>
                        <th>Rut</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Contraseña</th>
                        <th>Tipo Usuario</th>
                    </tr>
                    
                    <tr>
                        <th><input type="Text" name="txtId" readonly="true" value="<% out.println(u.getId()); %>"></th>
                        <th><input type="Text" name="txtRut" value="<% out.println(u.getRut()); %>"></th>
                        <th><input type="Text" name="txtNombre" value="<% out.println(u.getNombre()); %>"></th>
                        <th><input type="Text" name="txtApellido" value="<% out.println(u.getApellido()); %>"></th>
                        <th><input type="Text" name="txtPass" value="<% out.println(u.getPass()); %>"></th>
                        <th><input type="Text" name="txtTipo" value="<% out.println(u.getTipoUsu()); %>"></th>
                    </tr>
                </table>
            </div>
                    <input type="submit" value="Editar Usuario" >
        </form>
                    
        
    </body>
</html>
