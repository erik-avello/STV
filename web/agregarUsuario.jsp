<%-- 
    Document   : agregarUsuario
    Created on : 28-sep-2020, 14:41:52
    Author     : Erik
--%>
<%@page import="java.util.List"%>
<%@include file="barraNavegacion.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body>
        <form>

        </form>

        <div class="valign-wrapper formulario" id="cargarDatos">
            <div class="">
                <span class="red-text text-darken-2">
                    <h2 class="center-align" style="width: 420px;">Agregar Usuario</h2>
                    <form action="agregar_usuario.do" method="POST">
                        <input type="Text" name="txtRut" id="search" onkeypress="validar(event)" placeholder="Rut: " required ><br>
                        <input type="Text" name="txtNombre" placeholder="Nombre: " required><br>
                        <input type="Text" name="txtApellido" placeholder="Apellido: " required><br>
                        <input type="Text" name="txtPass" placeholder="Contraseña: " required><br>
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
    </body>


    <script type="text/javascript">
        function validar(e) {
            var tecla = (document.all) ? e.keyCode : e.which;
            if (tecla === 13) {
                var rut = document.getElementById('search').value;
                $.ajax({
                    data: {rut: rut},
                    url: "buscarAgregarUsuarioAjax.jsp",
                    type: 'POST',
                    beforeSend: function () {

                    },
                    success: function (response) {
                        $("#cargarDatos").html(response);
                    }
                })
            } else {

            }
        }


    </script>

</html>
