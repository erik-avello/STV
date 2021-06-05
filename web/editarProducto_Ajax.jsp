<%-- 
    Document   : editarProducto_Ajax
    Created on : 16-may-2020, 17:48:52
    Author     : Erik
--%>

<%@page import="model.Producto"%>
<%@page import="bd.Data"%>

<%
    Data data = new Data();
    
    String id = request.getParameter("id");
   
    Producto p = data.GetProductoPorId(id);
                
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <body>
        <form action="editar_producto.do" method="POST">
            <div> 
                <table border="1">
                    <tr>
                        <th>Id</th>
                        <th>Código</th>
                        <th>Nombre</th>
                        <th>Precio</th>
                        <th>Stock</th>
                        <th>Tipo</th>
                    </tr>
                    
                    <tr>
                        <th><input type="Text" name="txtId" readonly="true" value="<% out.println(p.getId()); %>"></th>
                        <th><input type="Text" name="txtCodigo" value="<% out.println(p.getCodigo()); %>"></th>
                        <th><input type="Text" name="txtNombre" value="<% out.println(p.getNombre()); %>"></th>
                        <th><input type="Text" name="txtPrecio" value="<% out.println(p.getPrecio()); %>"></th>
                        <th><input type="Text" name="txtStock" value="<% out.println(p.getStock()); %>"></th>
                        <th><input type="Text" name="txtTipo" value="<% out.println(p.getIdTipoProducto()); %>"></th>
                    </tr>
                </table>
            </div>
                    <input type="submit" value="Editar Producto" >
        </form>
    </body>
</html>
