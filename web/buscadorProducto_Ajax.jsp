<%-- 
    Document   : buscadorProducto_Ajax
    Created on : 07-nov-2020, 22:58:19
    Author     : Erik
--%>

<%@page import="model.TipoProducto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.Producto"%>
<%@page import="bd.Data"%>
<%
    List<Producto> lista = new ArrayList();
    Data data = new Data();
    try {
        String caracter = request.getParameter("caracter");
        if (caracter.isEmpty()) {
            lista = data.getProductos();
        } else {
            lista = data.getProductoBuscarLike(caracter);
        }
    } catch (Exception e) {
        System.out.println("algo pasa");
    }

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Código</th>
                <th>Nombre</th>
                <th>Precio</th>
                <th>Stock</th>
                <th>Tipo</th>
                <th>Acciones elemento producto</th>
            </tr>

            <%                
                try {
                    String idProducto = request.getParameter("idProducto");
                    if (idProducto != null) {
                        for (Producto p : lista) {
                            if (p.getId() == Integer.parseInt(idProducto)) {
                                out.println("<tr>");
                                out.println("<form action='editar_producto.do' method='POST'>");
                                out.println("<th><input type='text' name='txtId' value='" + p.getId() + "' readonly style='width : 30px;'></th>");
                                out.println("<th><input type='text' name='txtCodigo' value='" + p.getCodigo() + "'></th>");
                                out.println("<th><input type='text' name='txtNombre' value='" + p.getNombre() + "'></th>");
                                out.println("<th><input type='text' name='txtPrecio' value='" + p.getPrecio() + "' style='width : 70px;'></th>");
                                out.println("<th><input type='text' name='txtStock' value='" + p.getStock() + "' style='width : 30px;'></th>");

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
                    } else {
                        for (Producto p : lista) {
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

                } catch (Exception e) {
                    System.out.println("algo pasa");
                }

            %>    
        </table>
    </body>

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

        function editarProducto(id) {
            $.ajax({
                data: {id: id},
                type: 'GET',
                url: "editarProducto_Ajax.jsp",
                success: function (data) {
                    $("#contenido").html(data);
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
</html>
