<%-- 
    Document   : menuUsuario
    Created on : 14-may-2020, 1:14:48
    Author     : Erik
--%>

<%@page import="model.Producto"%>
<%@page import="model.Carrito"%>
<%@page import="java.util.List"%>
<%@page import="bd.Data"%>
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


        <div class="valign-wrapper container">


            <div>
                <span class="red-text text-darken-2">

                    <form action="carrito_compras.do" method="Post">
                        <h2 class="center-align">Generar Venta</h2>

                        <input type="Text" name="accion" value="agregar" hidden="true">
                        Código producto <input type="Text" placeholder="Código producto" id="search" name="txtCodigo" required="true">
                        Cantidad <input type="Text" placeholder="Cantidad a comprar" name="txtCantidad" required="true">

                        <div align="center">
                            <button type="submit" class="btn col s12 red" value="">Agregar a carrito
                                <i class="material-icons right">attach_money</i>
                            </button>
                        </div>
                    </form>            
            </div>

            <div style="width:80%;">
                <span class="red-text text-darken-2">

                    <h2 class="center-align">Carrito</h2>

                    <table class="responsive-table black-text">
                        <thead>   
                            <tr>
                                <th>Código</th>
                                <th>Cantidad</th>
                                <th>Precio*cantidad</th>
                                <th>Acción</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%                                    int totalfinal = 0;
                                Data data = new Data();
                                HttpSession sesionCarrito = (HttpSession) request.getSession();
                                List<Carrito> listaCarrito = (List<Carrito>) sesionCarrito.getAttribute("carrito");

                                if (listaCarrito != null) {
                                    for (Carrito c : listaCarrito) {
                                        Producto p = data.getProductoSegunCodigoDeBarra(c.getIdProducto());
                                        if (p.getStock() > 0) {
                                            totalfinal = totalfinal + c.getTotal();
                                            out.println("<tr>");
                                            out.println("<td>" + c.getIdProducto() + "</td>");
                                            out.println("<td>" + c.getCantidad() + "</td>");
                                            out.println("<td>" + c.getTotal() + "</td>");

                                            out.println("<td>"
                                                    + "<form action='eliminar.do' method='POST'>"
                                                    + "<input type='hidden' id='idProducto' name='idProducto' value='" + c.getIdProducto() + "'>"
                                                    + "<input type='submit' id='btnEliminar' value='remover' Class='btn col s12 red'>"
                                                    + "</form>"
                                                    + "</td>");
                                            out.println("</tr>");
                                        } else {

                                        }

                                    }
                                }

                            %>
                        </tbody>
                        </div>

                        <div>
                            <%  out.println("<h5> Total: " + totalfinal + "</h5>");%>

                            <form action="generarVentaFinal.jsp" method="Post">
                                <%
                                    if (listaCarrito == null || listaCarrito.size() <= 0) {
                                        out.println("<input type='submit' id='generarVenta' value='Generar Venta' Class='btn col s12 red' disabled>");
                                    } else {
                                        out.println("<input type='submit' id='generarVenta' value='Generar Venta' Class='btn col s12 red'>");
                                    }
                                %>

                                <input type="hidden" name="idProducto" value="<%= totalfinal%>">
                            </form>
                            <%
                                if (listaCarrito == null || listaCarrito.size() <= 0) {
                                    out.println("<input type='submit' id='cancelarVenta' value='Cancelar Venta' onclick='cancelarVenta()' Class='btn col s12 red' disabled> ");
                                } else {
                                    out.println("<input type='submit' id='cancelarVenta' value='Cancelar Venta' onclick='cancelarVenta()' Class='btn col s12 red'>");
                                }
                            %>

                        </div>          
                    </table>
            </div>

            <div>
                <%
                    String msg = request.getParameter("mensaje");
                    if (msg != null) {
                        if (mensaje.equals("2")) {
                            out.println("<h5>Error! asegúrese de agregar productos o verifique código</h5>");
                        }
                    }
                %>
            </div>
    </body>     

    <script type="text/javascript">
        function cancelarVenta() {
            var confirmar = confirm("¿Está seguro que desea cancelar la venta?");
            if (confirmar == true) {
                location.href = "limpiar_carrito.do";
            } else {
                return false;
            }
        }
    </script>

</html>
