<%-- 
    Document   : buscarAgregarProductoAjax
    Created on : 10-01-2021, 21:59:29
    Author     : Erik Avello
--%>
<%@page import="model.TipoProducto"%>
<%@page import="java.util.List"%>
<%@page import="model.Producto"%>
<%@page import="bd.Data"%>

<%
    Data data = new Data();

    String codigo = request.getParameter("codigo");
    Producto p = null;
    int costo = -1;
    try {
        p = data.getProductoSegunCodigoDeBarra(codigo);
        costo = data.getCostoPorIdProducto(p.getId());
    } catch (Exception ex) {
        p = null;
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%if (p != null) {%>
                <span class="red-text text-darken-2">
                    <h2 class="center-align" >Agregar Producto</h2>
                    <form action="agregar_producto.do" method="POST">    
                        <input type="Text" name="txtCodigo" id="search" placeholder="Código (Si deja vacío se genera automáticamente): " 
                               onkeyup="capturarLetra(this)" onchange="capturarLetra(this)" value="<%= p.getCodigo() %>"><br>
                        <input type="Text" name="txtNombre" placeholder="Nombre: " required value="<%= p.getNombre() %>"><br>
                        <input type="Text" name="txtPrecio" placeholder="Precio venta: " 
                               onkeyup="capturarLetra(this)" onchange="capturarLetra(this)" required value="<%= p.getPrecio() %>"><br>
                        <input type="Text" name="txtStock" placeholder="Stock: " required 
                               onkeyup="capturarLetra(this)" onchange="capturarLetra(this)" value="<%= p.getStock()%>"><br>
                        <input type="Text" name="txtCosto" placeholder="Costo adquisición: " required 
                               onkeyup="capturarLetra(this)" onchange="capturarLetra(this)" value="<%= costo %>"><br>
                        <select class="browser-default" name="txtTipo"><br/>
                            <%
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
            <%} else {%>
            
                    <span class="red-text text-darken-2">
                        <h2 class="center-align">Agregar Producto</h2>
                        <form action="agregar_producto.do" method="POST">    
                            <input type="Text" name="txtCodigo" id="search" placeholder="Código (Si deja vacío se genera automáticamente): " 
                                   onkeyup="capturarLetra(this)" onchange="capturarLetra(this)" value="<%= codigo %>"><br>
                            <input type="Text" name="txtNombre" placeholder="Nombre: " required><br>
                            <input type="Text" name="txtPrecio" placeholder="Precio venta: " 
                                   onkeyup="capturarLetra(this)" onchange="capturarLetra(this)" required><br>
                            <input type="Text" name="txtStock" placeholder="Stock: " required 
                                   onkeyup="capturarLetra(this)" onchange="capturarLetra(this)"><br>
                            <input type="Text" name="txtCosto" placeholder="Costo adquisición: " required 
                                   onkeyup="capturarLetra(this)" onchange="capturarLetra(this)"><br>
                            <select class="browser-default" name="txtTipo"><br/>
                                <%
                                    List<TipoProducto> listaTipoProducto = data.getTipoProducto();
                                    for (TipoProducto tp : listaTipoProducto) {
                                        out.println("<option value='" + tp.getId() + "'>" + tp.getNombre() + "</option>");
                                    }
                                %>    
                            </select>

                            <br><div align="center">
                                <button type="submit" class="btn col s12 red">Editar Producto
                                    <i class="material-icons right">add_box</i>
                                </button>
                            </div>
                        </form>
                    </span>
                
                <%}%>
                
                </body>
                </html>
