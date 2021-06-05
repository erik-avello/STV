<%-- 
    Document   : agregarProducto
    Created on : 14-may-2020, 15:18:41
    Author     : Erik
--%>

<%@page import="model.TipoProducto"%>
<%@page import="java.util.List"%>
<%@include file="barraNavegacion.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Producto</title>
    </head>

    <body>
        <form>

        </form>
        
        <div class="valign-wrapper formulario" id="cargarDatos" >
            <div class="">
                <span class="red-text text-darken-2">
                    <h2 class="center-align">Agregar Producto</h2>
                    <form action="agregar_producto.do" method="POST">    
                        <input type="Text" name="txtCodigo" id="search" onkeypress="validar(event)" placeholder="Código (Si deja vacío se genera automáticamente): " 
                                onchange="capturarLetra(this)"><br>
                        <input type="Text" name="txtNombre" placeholder="Nombre: " required><br>
                        <input type="Text" name="txtPrecio" placeholder="Precio venta: " 
                               onkeyup="capturarLetra(this)" onchange="capturarLetra(this)" required><br>
                        <input type="Text" name="txtStock" placeholder="Stock: " required 
                               onkeyup="capturarLetra(this)" onchange="capturarLetra(this)"><br>
                        <input type="Text" name="txtCosto" placeholder="Costo adquisición: " required 
                               onkeyup="capturarLetra(this)" onchange="capturarLetra(this)"><br>
                        <select class="browser-default" name="txtTipo"><br/>
                            <%                                
                                Data data = new Data();
                                List<TipoProducto> listaTipoProducto = data.getTipoProducto();
                                for (TipoProducto tp : listaTipoProducto) {
                                    out.println("<option value='" + tp.getId() + "'>" + tp.getNombre() + "</option>");
                                }
                            %>    
                        </select>

                        <br><div align="center">
                            <button type="submit" class="btn col s12 red">Registrar Producto
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
                var codigo = document.getElementById('search').value;
                $.ajax({
                    data: { codigo : codigo},
                    url: "buscarAgregarProductoAjax.jsp",
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


        function capturarLetra(obj) {
            obj.value = obj.value.replace(/\D/g, '');
        }

    </script>

</html>
