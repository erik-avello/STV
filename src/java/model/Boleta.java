package model;

import java.util.Date;

/**
 *
 * @author Santo Tomás
 */
public class Boleta {
    int id;
    Date fecha;
    String medioPago;
    int total;
    String rut_cliente;
    
    public Boleta(){
        
    }
    public Boleta(int total){
        this.total = total;
    }
    
    public Boleta(int id, Date fecha, String medioPago, int total, String rut_cliente){
        this.id = id;
        this.fecha = fecha;
        this.medioPago = medioPago;
        this.total = total;
        this.rut_cliente = rut_cliente;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
    
    
}
