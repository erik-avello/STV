<%-- 
    Document   : listarUsuarios
    Created on : 06-nov-2020, 15:02:44
    Author     : Erik
--%>

<%@page import="model.User"%>
<%@page import="bd.Data"%>
<%@include file="barraNavegacion.jsp" %>
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
                    <form>
                        <div class="input-field">
                            <input id="search" type="search" onKeypress="if (event.keyCode == 13)
                                        event.returnValue = false;" required>
                            <label class="label-icon" for="search"><i class="material-icons">search</i></label>
                        </div>
                    </form>
                </div>
            </nav>

            <table id="cargarDatos" class="striped">
                <tr>
                    <th>Id</th>
                    <th>Rut</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Tipo Usuario</th>
                    <th>Acciones elemento usuario</th>

                </tr>
                <%
                    String idUsuario = "";
                    try {
                        idUsuario = request.getParameter("idUsuario");
                        for (User u : data.getUsuarios()) {
                            if (u.getId() == Integer.parseInt(idUsuario)) {
                                out.println("<tr>");
                                out.println("<form action='editar_usuario.do' method='POST'>");
                                out.println("<th><input type='text' name='txtId' value='" + u.getId() + "' readonly style='width : 30px;'></th>");
                                out.println("<th><input type='text' name='txtRut' value='"+ u.getRut() +"' style='width : 160px;'></th>");
                                out.println("<th><input type='text' name='txtNombre' value='"+ u.getNombre() +"' style='width : 150px;'></th>");
                                out.println("<th><input type='text' name='txtApellido' value='"+ u.getApellido() +"' style='width : 150px;'></th>");
                                out.println("<th>");
                                out.println("<select class='browser-default' name='txtTipo'><br/>");
                                out.println("<option value='1'>Admin</option>");    
                                out.println("<option value='2'>Trabajador</option>");
                                out.println("</select>");
                                out.println("</th>");
                                out.println("<th><input type='submit' Class='btn col s12 red' value='Editar'></button> <a href='#' Class='btn col s12 red' onClick='eliminarUsuario(" + u.getId() + ")'><i class='material-icons right'>delete</i></a></th>");
                                out.println("</form>");
                                out.println("</tr>");
                            } else {
                                out.println("<tr>");
                                out.println("<th>" + u.getId() + "</th>");
                                out.println("<th>" + u.getRut() + "</th>");
                                out.println("<th>" + u.getNombre() + "</th>");
                                out.println("<th>" + u.getApellido() + "</th>");
                                out.println("<th>" + data.getTipoUsuarioSegunId(u.getTipoUsu()) + "</th>");
                                out.println("<th><a href='listarUsuarios.jsp?idUsuario=" + u.getId() + "' Class='btn col s12 red'><i class='material-icons right'>edit</i></a> <a href='#' Class='btn col s12 red' onClick='eliminarUsuario(" + u.getId() + ")'><i class='material-icons right'>delete</i></a></th>");
                                out.println("</tr>");
                            }

                        }
                    } catch (Exception e) {
                        idUsuario = null;
                        for (User u : data.getUsuarios()) {
                            out.println("<tr>");
                            out.println("<form action='editar_usuario.do' method='POST'>");
                            out.println("<th>" + u.getId() + "</th>");
                            out.println("<th>" + u.getRut() + "</th>");
                            out.println("<th>" + u.getNombre() + "</th>");
                            out.println("<th>" + u.getApellido() + "</th>");
                            out.println("<th>" + data.getTipoUsuarioSegunId(u.getTipoUsu()) + "</th>");
                            out.println("<th><a href='listarUsuarios.jsp?idUsuario=" + u.getId() + "' Class='btn col s12 red'><i class='material-icons right'>edit</i></a> <a href='#' Class='btn col s12 red' onClick='eliminarUsuario(" + u.getId() + ")'><i class='material-icons right'>delete</i></a></th>");
                            out.println("</form>");
                            out.println("</tr>");
                        }

                    }
                %>
            </table>

            <div class="striped" id="contenido">

            </div>


        </div>

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

    </body>
</html>
