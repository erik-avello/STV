
package model;

import java.util.Date;

/**
 *
 * @author Santo Tomás
 */
public class DetalleBoleta {
    int id;
    String nombreProducto;
    int precioProducto;
    int cantidad;
    Date fecha;
    String medioPago;
    int total;
    String rut_cliente;
    int subtotal;
    
    public DetalleBoleta(){
        
    }
    
    public DetalleBoleta(String nombreProducto, int precioProducto, int cantidad, Date fecha, String medioPago, int total, String rut_cliente, int subtotal){
        this.nombreProducto = nombreProducto;
        this.precioProducto = precioProducto;
        this.fecha = fecha;
        this.medioPago = medioPago;
        this.total = total;
        this.rut_cliente = rut_cliente;
        this.subtotal = subtotal;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public int getPrecioProducto() {
        return precioProducto;
    }

    public void setPrecioProducto(int precioProducto) {
        this.precioProducto = precioProducto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getMedioPago() {
        return medioPago;
    }

    public void setMedioPago(String medioPago) {
        this.medioPago = medioPago;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getRut_cliente() {
        return rut_cliente;
    }

    public void setRut_cliente(String rut_cliente) {
        this.rut_cliente = rut_cliente;
    }

    public int getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(int subtotal) {
        this.subtotal = subtotal;
    }
    
    

}
