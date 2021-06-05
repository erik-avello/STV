package model;

/**
 *
 * @author rivaa
 */
public class Carrito {
    // si siempre con clases para que despues se te haga mas facil el paso de la bd a la app
    private String idProducto;
    private int cantidad;
    private int total;

    public Carrito() {
    }

    public Carrito(String idProducto, int cantidad, int total) {
        this.idProducto = idProducto;
        this.cantidad = cantidad;
        this.total = total;
    }

    public String getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(String idProducto) {
        this.idProducto = idProducto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
    
    
}
