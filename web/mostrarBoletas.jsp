<%-- 
    Document   : mostrarBoletas
    Created on : 04-01-2021, 17:26:27
    Author     : Santo Tomás
--%>

<%@page import="java.util.List"%>
<%@page import="model.Boleta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="barraNavegacion.jsp"%>

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
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Fecha</th>
                        <th>Medio de pago</th>
                        <th>Total</th>
                        <th>Rut Cliente</th>
                        <th>Acción</th>
                    </tr>
                </thead>

                <tbody>
                    <%                        
                        Data data = new Data();
                        List<Boleta> listaBoleta = data.getBoletas();

                        for (Boleta b : listaBoleta) {
                            out.println("<tr>");
                            out.println("<td>" + b.getId() + "</td>");
                            out.println("<td>" + b.getFecha() + "</td>");
                            out.println("<td>" + b.getMedioPago() + "</td>");
                            out.println("<td>" + b.getTotal() + "</td>");
                            out.println("<td>" + b.getRut_cliente() + "</td>");
                            out.println("<td><a href='mostrarBoletaDetalle.jsp?idBoleta=" + b.getId() + "'>Ver detalle</a></td>");
                            out.println("</tr>");

                        }

                    %>
                </tbody>
            </table>
        </div>
    </body>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#search').keyup(function () {
                var caracter = $(this).val()
                $.ajax({
                    data: {caracter: caracter},
                    url: "mostrarBoletas_Ajax.jsp",
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
