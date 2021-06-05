<%-- 
    Document   : listarProductos
    Created on : 14-may-2020, 15:35:02
    Author     : Erik
--%>
<%@page import="java.util.List"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

<%@page import="bd.Data"%>
<%@include file="barraNavegacion.jsp" %>

<%@page import="model.Producto"%>
<%@page import="model.TipoProducto" %>
<%Data data = new Data();  %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body>
        <br>
        <div class="container">
            <nav>
                <div class="nav-wrapper ">
                    <form id="form1">
                        <div class="input-field">
                            <input id="search" type="search" onKeypress="if (event.keyCode == 13)
                                        event.returnValue = false;" required>
                            <label class="label-icon" for="search"><i class="material-icons">search</i></label>
                        </div>
                    </form>
                </div>
            </nav>


            <table id="cargarDatos" class="striped">

                <%
                    if (usu.getTipoUsu() == 1) { %>    
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Código</th>
                        <th>Nombre</th>
                        <th>Precio</th>
                        <th>Stock</th>
                        <th>Tipo Producto</th>
                        <th>Acciones Producto</th>
                    </tr>  
                </thead>
                <%
                } else { %>
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Código</th>
                        <th>Nombre</th>
                        <th>Precio</th>
                        <th>Stock</th>
                        <th>Tipo Producto</th>
                    </tr>  
                </thead>
                <% }
                %>


                <%
                    if (usu.getTipoUsu() == 1) {

                        String idProducto = "";
                        try {
                            idProducto = request.getParameter("idProducto");

                            for (Producto p : data.getProductos()) {
                                if (p.getId() == Integer.parseInt(idProducto)) {
                                    out.println("<tr>");
                                    out.println("<form action='editar_producto.do' method='POST'>");
                                    out.println("<th><input type='text' name='txtId' value='"+p.getId()+"' readonly style='width : 30px;'></th>");
                                    out.println("<th><input type='text' name='txtCodigo' value='" + p.getCodigo() + "'></th>");
                                    out.println("<th><input type='text' name='txtNombre' value='" + p.getNombre() + "'></th>");
                                    out.println("<th><input type='text' name='txtPrecio' value='" + p.getPrecio() + "' style='width : 70px;'></th>");
                                    out.println("<th><input type='text' name='txtStock' value='" + p.getStock()+ "' style='width : 30px;'></th>");
                                    
                                    out.println("<th>");
                                    out.println("<select class='browser-default' name='txtTipo'><br/>");
                                    List<TipoProducto> listaTipoProducto = data.getTipoProducto();
                                    for (TipoProducto tp : listaTipoProducto) {
                                        out.println("<option value='" + tp.getId() + "'>" + tp.getNombre() + "</option>");
                                    }
                                    out.println("</select>");
                                    out.println("</th>");
                                    
                                    out.println("<th><input type='submit' Class='btn col s12 red' value='editar'></input>"
                                            + " <a href='#' onclick='eliminarProducto(" + p.getId() + ")' Class='btn col s12 red'><i class='material-icons right'>delete</i></a></th>");
                                    out.println("</form>");
                                    out.println("</tr>");
                                } else {
                                    out.println("<tr>");
                                    out.println("<th>" + p.getId() + "</th>");
                                    out.println("<th>" + p.getCodigo() + "</th>");
                                    out.println("<th>" + p.getNombre() + "</th>");
                                    out.println("<th>" + p.getPrecio() + "</th>");
                                    out.println("<th>" + p.getStock() + "</th>");
                                    out.println("<th>" + data.getNombreTipoProductoSegunId(p.getIdTipoProducto()) + "</th>");
                                    out.println("<th><a href='listarProductos.jsp?idProducto=" + p.getId() + "' Class='btn col s12 red'><i class='material-icons right'>edit</i></a>"
                                            + " <a href='#' onclick='eliminarProducto(" + p.getId() + ")' Class='btn col s12 red'><i class='material-icons right'>delete</i></a></th>");
                                    //out.println("<th><a href='#' Class='btn col s12 red' onclick='editarProducto(" + p.getId() + ")'>Editar</a>-<a href='#' onclick='eliminarProducto(" + p.getId() + ")' Class='btn col s12 red'>Eliminar</a></th>");
                                    out.println("</tr>");

                                }

                            }

                        } catch (Exception ex) {
                            idProducto = "null";

                            for (Producto p : data.getProductos()) {
                                out.println("<tr>");
                                out.println("<th>" + p.getId() + "</th>");
                                out.println("<th>" + p.getCodigo() + "</th>");
                                out.println("<th>" + p.getNombre() + "</th>");
                                out.println("<th>" + p.getPrecio() + "</th>");
                                out.println("<th>" + p.getStock() + "</th>");
                                out.println("<th>" + data.getNombreTipoProductoSegunId(p.getIdTipoProducto()) + "</th>");
                                out.println("<th><a href='listarProductos.jsp?idProducto=" + p.getId() + "' Class='btn col s12 red'><i class='material-icons right'>edit</i></a>"
                                            + " <a href='#' onclick='eliminarProducto(" + p.getId() + ")' Class='btn col s12 red'><i class='material-icons right'>delete</i></a></th>");
                                out.println("</tr>");

                            }
                        }
                    } else {
                        for (Producto p : data.getProductos()) {
                            out.println("<tr>");
                            out.println("<th>" + p.getId() + "</th>");
                            out.println("<th>" + p.getCodigo() + "</th>");
                            out.println("<th>" + p.getNombre() + "</th>");
                            out.println("<th>" + p.getPrecio() + "</th>");
                            out.println("<th>" + p.getStock() + "</th>");
                            out.println("<th>" + data.getNombreTipoProductoSegunId(p.getIdTipoProducto()) + "</th>");
                            out.println("</tr>");
                        }
                    }
                %>    

            </table>

            <div class="striped" id="contenido">

            </div>

        </div>

        <script type="text/javascript">


            function eliminarProducto(id) {
                swal({
                    title: "Advertencia",
                    text: "¿Seguro que quiere eliminar este elemento?",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                        .then((willDelete) => {
                            if (willDelete) {
                                location.href = "eliminar_producto.do?id=" + id + "";
                                swal("Operación completada de manera exitosa!", {
                                    icon: "success",
                                });
                            } else {
                                swal("Operación cancelada");
                            }
                        });
            }

            $(document).ready(function () {
                $('#search').keyup(function () {
                    var caracter = $(this).val()
                    $.ajax({
                        data: {caracter: caracter},
                        url: "buscadorProducto_Ajax.jsp",
                        type: 'POST',
                        beforeSend: function () {

                        },
                        success: function (response) {
                            $("#cargarDatos").html(response);
                        }
                    })
                })
            })
        </script>
    </body>
</html>
