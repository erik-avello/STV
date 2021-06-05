<%-- 
    Document   : buscadorUsuario_Ajax
    Created on : 07-nov-2020, 23:32:40
    Author     : Erik
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.User"%>
<%@page import="bd.Data"%>
<%
    Data data = new Data();

    List<User> lista = new ArrayList();
    try {
        String caracter = request.getParameter("caracter");
        if (caracter.isEmpty()) {
            lista = data.getUsuarios();
        } else {
            lista = data.getUsuarioBuscarLike(caracter);
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
                <th>Rut</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Tipo Usuario</th>
                <th>Acciones elemento usuario</th>
            </tr>

            <%                for (User u : lista) {
                    out.println("<tr>");
                    out.println("<th>" + u.getId() + "</th>");
                    out.println("<th>" + u.getRut() + "</th>");
                    out.println("<th>" + u.getNombre() + "</th>");
                    out.println("<th>" + u.getApellido() + "</th>");
                    out.println("<th>" + u.getTipoUsu() + "</th>");
                    out.println("<th><a href='listarUsuarios.jsp?idUsuario=" + u.getId() + "' Class='btn col s12 red'><i class='material-icons right'>edit</i></a> <a href='#' Class='btn col s12 red' onClick='eliminarUsuario(" + u.getId() + ")'><i class='material-icons right'>delete</i></a></th>");                    out.println("</tr>");
                }
            %>    
        </table>
    </body>

    <script type="text/javascript">
        function eliminarUsuario(id) {
            swal({
                title: "Advertencia",
                text: "¿Seguro que quiere eliminar este elemento?",
                icon: "warning",
                buttons: true,
                dangerMode: true,
            })
                    .then((willDelete) => {
                        if (willDelete) {
                            location.href = "eliminar_usuario.do?id=" + id + "";
                            swal("Operación completada de manera exitosa!", {
                                icon: "success",
                            });
                        } else {
                            swal("Operación cancelada");
                        }
                    });
        }

        function editarUsuario(id) {
            $.ajax({
                data: {id: id},
                type: 'GET',
                url: "editarUsuario_Ajax.jsp",
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
                    url: "buscadorUsuario_Ajax.jsp",
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
