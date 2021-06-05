<%-- 
    Document   : agregarCategoria
    Created on : 21-may-2021, 15:23:27
    Author     : Erik
--%>

<%@page import="model.TipoProducto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="barraNavegacion.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form>

        </form>
        
        <div class="valign-wrapper formulario">
            <div class="">
                <span class="red-text text-darken-2">
                    <h2 class="center-align">Agregar Categoria</h2>
                    <form action="agregar_categoria.do" method="POST">    
                        <input type="Text" name="txtNombre" placeholder="Nombre: " required><br>

                        <br><div align="center">
                            <button type="submit" class="btn col s12 red">Registrar Categoria
                                <i class="material-icons right">add_box</i>
                            </button>
                        </div>
                    </form>
                </span>
            </div>
        </div>
        
        <div class="valign-wrapper container center-block">
            <div>
                <span class="red-text text-darken-2">
                <h2 class="center-align">Lista de categorías</h2>
                <form>    
                    <div align="center" style="width: 100%;">
                        <select class="browser-default" name="txtCategoria"><br/>
                            <%                                
                                Data data = new Data();
                                List<TipoProducto> listaTipoProducto = data.getTipoProducto();
                                for (TipoProducto tp : listaTipoProducto) {
                                    out.println("<option value='" + tp.getId() + "'>" + tp.getNombre() + "</option>");
                                }
                            %>    
                        </select>  
                    </div>   
                </form>
            </div>
        </div>
    </body>
</html>
