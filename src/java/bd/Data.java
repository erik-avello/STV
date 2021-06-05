package bd;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Boleta;
import model.DetalleBoleta;
import model.Producto;
import model.TipoProducto;
import model.User;


public class Data {
    private final Conexion C;
    
    public Data(){
        C = new Conexion();
    }
    
    public void editarPassSegunRut_Usuario(String nuevaPass, String rut) throws SQLException{
        String update = "UPDATE usuario "
                + "SET usu_pass = '"+nuevaPass+"'  WHERE usu_rut = '"+rut+"'";
        
        C.ejecutar(update);
        
    }
    
    public void editarNombreApellidoFnac_Usuario(String nuevoNombre, String nuevoApellido, Date nuevaFnac, String rut) throws SQLException{
        String update = "UPDATE usuario "
                + "SET usu_nombre = '"+nuevoNombre+"', "
                + "usu_apellido = '"+nuevoApellido+"', "
                + "usu_fechaNacimiento = '"+nuevaFnac+"' WHERE usu_rut = '"+rut+"'";
        
        C.ejecutar(update);
    }
    
    public User getUsuarioSegunRut(String rut) throws SQLException{
        User user = null;
        
        String select = "SELECT * FROM user WHERE rut_user = '"+rut+"' AND estado = 1;";
        ResultSet rs = C.ejecutarSelect(select);
        if(rs.next()){
            user = new User();
            user.setId(rs.getInt(1));
            user.setRut(rs.getString(2));
            user.setNombre(rs.getString(3));
            user.setApellido(rs.getString(4));
            user.setPass(rs.getString(5));
            user.setTipoUsu(rs.getInt(6));
            
        }
        
        return user;
    }
    
    public User getUsuarioSegunRut_y_Pass(String r, String p) throws SQLException{
        User u = null;
        
        String select = "SELECT * FROM user WHERE rut_user = '"+r+"' AND pass_user = '"+p+"' AND estado = 1;";
        ResultSet rs = C.ejecutarSelect(select);
        if(rs.next()){
            u = new User();
            u.setId(rs.getInt(1));
            u.setRut(rs.getString(2));
            u.setNombre(rs.getString(3));
            u.setApellido(rs.getString(4));
            u.setPass(rs.getString(5));
            u.setTipoUsu(rs.getInt(6));
            
        }
        
        return u;
    }
    
    public List<TipoProducto> getTipoProductos() throws SQLException{
        List<TipoProducto> lista_tp = new ArrayList<>();
        TipoProducto tpo = null;
        
        String select = "SELECT * FROM tipoProducto;";
        
        ResultSet rs = C.ejecutarSelect(select);
        while(rs.next()){
            tpo = new TipoProducto();
            tpo.setId(rs.getInt(1));
            tpo.setNombre(rs.getString(2));
            
            lista_tp.add(tpo);
        }
        
        return lista_tp;
    }
    
    public String getNombreTipoProductoSegunId(int id) throws SQLException{
        String nombre = "";
        String select = "SELECT nombre_tipoProducto FROM tipo_producto WHERE id_tipoProducto = '"+id+"';";
        
        ResultSet rs = C.ejecutarSelect(select);
        if(rs.next()){
            nombre = rs.getString(1);
        }
        
        return nombre;
    }
    
    /*
    public String getNombreTipoUsuarioSegunId(int id) throws SQLException{
        String nombre = "";
        String select = "SELECT nombre_tipoUsuario FROM tipo_usuario WHERE id_tipoUsuario = '"+id+"';";
        
        C.resultado = C.ejecutarSelect(select);
        if(C.resultado.next()){
            nombre = C.resultado.getString(1);
        }
        
        return nombre;
    }
    */
    
    public List<Producto> getProductoBuscarLike(String textoBuscar) throws SQLException{
        List<Producto> listaPro = new ArrayList<>();
        Producto p = null;
        
        String select = "SELECT * FROM producto WHERE estado = '1' AND codigo_producto LIKE '%"+textoBuscar+"%' OR nombre_producto LIKE '%"+textoBuscar+"%'";
        
        ResultSet rs = C.ejecutarSelect(select);
        while(rs.next()){
            p = new Producto();
            p.setId(rs.getInt(1));
            p.setCodigo(rs.getString(2));
            p.setNombre(rs.getString(3));
            p.setPrecio(rs.getInt(4));
            p.setStock(rs.getInt(5));
            p.setIdTipoProducto(rs.getInt(6));
            listaPro.add(p);
        }
        
        return listaPro;
    }
    
    public List<User> getUsuarioBuscarLike(String textoBuscar) throws SQLException{
        List<User> lista = new ArrayList<>();
        User u = null;
        
        String select = "SELECT * FROM user WHERE estado = '1' AND rut_user LIKE '%"+textoBuscar+"%' OR nombre_user LIKE '%"+textoBuscar+"%' OR apellido_user LIKE '%"+textoBuscar+"%';";
        
        ResultSet rs = C.ejecutarSelect(select);
        while(rs.next()){
            u = new User();
            u.setId(rs.getInt(1));
            u.setRut(rs.getString(2));
            u.setNombre(rs.getString(3));
            u.setApellido(rs.getString(4));
            u.setPass(rs.getString(5));
            u.setTipoUsu(rs.getInt(6));
            lista.add(u);
        }
        
        return lista;
        
    }
    
    public Producto getProductoSegunCodigoDeBarra(String codigo) throws SQLException{
        Producto p = null;
        
        String select = "SELECT * FROM producto WHERE codigo_producto = '"+codigo+"';";
        
        ResultSet rs = C.ejecutarSelect(select);
        if(rs.next()){
            p = new Producto();
            p.setId(rs.getInt(1));
            p.setCodigo(rs.getString(2));
            p.setNombre(rs.getString(3));
            p.setPrecio(rs.getInt(4));
            p.setStock(rs.getInt(5));
            p.setIdTipoProducto(rs.getInt(6));
        }
        
        return p;
    }
    
    public List<Producto> getProductos() throws SQLException{
        List<Producto> listaPro = new ArrayList<>();
        Producto p = null;
        
        String select = "SELECT * FROM producto WHERE estado = '1';";
        
        ResultSet rs = C.ejecutarSelect(select);
        while(rs.next()){
            p = new Producto();
            p.setId(rs.getInt(1));
            p.setCodigo(rs.getString(2));
            p.setNombre(rs.getString(3));
            p.setPrecio(rs.getInt(4));
            p.setStock(rs.getInt(5));
            p.setIdTipoProducto(rs.getInt(6));
            listaPro.add(p);
        }
        
        return listaPro;
    }
    
    public List<User> getUsuarios() throws SQLException{
        List<User> listUsu = new ArrayList<>();
        User u = null;
        
        String select = "SELECT * FROM user WHERE estado = 1;";
        
        ResultSet rs = C.ejecutarSelect(select);
        while(rs.next()){
            u = new User();
            u.setId(rs.getInt(1));
            u.setRut(rs.getString(2));
            u.setNombre(rs.getString(3));
            u.setApellido(rs.getString(4));
            u.setPass(rs.getString(5));
            u.setTipoUsu(rs.getInt(6));
            listUsu.add(u);
        }
        
        return listUsu;
    }
    
    public void insertarUsuario(User u) throws SQLException{
        String insert = "INSERT INTO USER VALUES(NULL, "
                + "'"+u.getRut()+"',"
                + "'"+u.getNombre()+"',"
                + "'"+u.getApellido()+"',"
                + "'"+u.getPass()+"',"
                + "'"+u.getTipoUsu()+"',"
                + "'1');";
        
        C.ejecutar(insert);
    }
    
    public void insertarProducto(Producto p) throws SQLException{
        String insert = "INSERT INTO producto VALUES(NULL,"
                + "UUID_SHORT(), "
                + "'"+p.getNombre()+"',"
                + "'"+p.getPrecio()+"',"
                + "'"+p.getStock()+"',"
                + "'"+p.getIdTipoProducto()+"',"
                + "1);";
        
        
        C.ejecutar(insert);
    }
    
    public void insertarProductoConCodigo(Producto p) throws SQLException{
        String insert = "INSERT INTO producto VALUES(NULL,"
                + "'"+p.getCodigo()+"', "
                + "'"+p.getNombre()+"',"
                + "'"+p.getPrecio()+"',"
                + "'"+p.getStock()+"',"
                + "'"+p.getIdTipoProducto()+"',"
                + "1);";
           
        
        
        C.ejecutar(insert);
    }
    
    public void insertarTipoProducto(String nombre) throws SQLException{
        String insert = "INSERT INTO tipoProducto VALUES(NULL, '"+nombre+"');";
        
        C.ejecutar(insert);
    }
    
    public void editarProductoPorId(int Id, String codigo, String nombre, int precio, int stock, int tipo_producto) throws SQLException{
        String update = "UPDATE producto SET codigo_producto = '"+codigo+"', "
                + "nombre_producto = '"+nombre+"', "
                + "precio_producto = '"+precio+"', "
                + "stock_producto = '"+stock+"', "
                + "tipo_producto = '"+tipo_producto+"' "
                + "WHERE id_producto = '"+Id+"' ";;
                
        C.ejecutar(update);
    }
    
    public void editarUsuarioPorId(int Id, String rut, String nombre, String apellido, String pass, int tipo) throws SQLException{
        String update = "UPDATE User SET rut_user = '"+rut+"', "
                + "nombre_user = '"+nombre+"', "
                + "apellido_user = '"+apellido+"', "
                + "pass_user = '"+pass+"', "
                + "tipo_usuario_fk = '"+tipo+"' "
                + "WHERE id_user = '"+Id+"' ";;
                
        C.ejecutar(update);
    }
    
    public Producto GetProductoPorId(String id) throws SQLException{
       String consulta = "SELECT * FROM PRODUCTO WHERE id_producto ='"+id+"';";
       
       Producto p = null;
       
       ResultSet rs = C.ejecutarSelect(consulta);
       
       while(rs.next()){
            p = new Producto();
            p.setId(rs.getInt(1));
            p.setCodigo(rs.getString(2));
            p.setNombre(rs.getString(3));
            p.setPrecio(rs.getInt(4));
            p.setStock(rs.getInt(5));
            p.setIdTipoProducto(rs.getInt(6));
        }
        
        return p;
    }
    
    public User GetUsuarioPorId(String id) throws SQLException{
        String consulta = "SELECT * FROM USER WHERE id_user = '"+id+"' AND estado = 1;";
        
        User u = null;
        
        ResultSet rs = C.ejecutarSelect(consulta);
        
        while(rs.next()){
            u = new User();
            u.setId(rs.getInt(1));
            u.setRut(rs.getString(2));
            u.setNombre(rs.getString(3));
            u.setApellido(rs.getString(4));
            u.setPass(rs.getString(5));
            u.setTipoUsu(rs.getInt(6));
        }
        return u;
    }
    
    public void eliminarProductoPorId(String id) throws SQLException{
        String consulta = "UPDATE PRODUCTO SET estado = 0 WHERE id_producto = '"+id+"';";
        C.ejecutar(consulta);
    }
    
    public void eliminarUsuarioPorId(String id) throws SQLException{
        String consulta = "UPDATE User SET estado = 0 WHERE id_user = '"+id+"';";
        C.ejecutar(consulta);
    }
    
    public void generarBoleta(String medioPago, int total, String rut) throws SQLException{
        String consulta = "INSERT INTO BOLETA VALUES(NULL, NOW(), '"+medioPago+"', '"+total+"', '"+rut+"');";
        C.ejecutar(consulta);
    }
    
    public void generarVenta(int idProducto, int cantidad, int precio) throws SQLException{
        String consulta = "INSERT INTO VENTA VALUES(NULL,'"+idProducto+"',(SELECT MAX(id_boleta) FROM boleta), '"+cantidad+"', '"+precio+"');";
        C.ejecutar(consulta);
    }
    
    public List<Boleta> getBoletas() throws SQLException{
        List<Boleta> lista = new ArrayList<>();
        Boleta b = null;
        
        String consulta = "SELECT * FROM BOLETA";
        ResultSet rs = C.ejecutarSelect(consulta);
        
        while(rs.next()){
            b = new Boleta();
            b.setId(rs.getInt(1));
            b.setFecha(rs.getDate(2));
            b.setMedioPago(rs.getString(3));
            b.setTotal(rs.getInt(4));
            b.setRut_cliente(rs.getString(5));
            lista.add(b);
        }
        return lista;
    }
    
    public List<DetalleBoleta> getDetalleBoletaId(String id) throws SQLException{
        String consulta ="SELECT producto.nombre_producto, producto.precio_producto, venta.cantidad, boleta.fecha_boleta, boleta.mediopago_boleta, boleta.total, boleta.rut_cliente , venta.precio FROM venta, boleta, producto WHERE (venta.id_boleta_fk = boleta.id_boleta AND producto.id_producto = venta.id_producto_fk) AND boleta.id_boleta = '"+id+"';" ;
        
        List<DetalleBoleta> lista = new ArrayList<>();
        DetalleBoleta db = null;
        
        ResultSet rs = C.ejecutarSelect(consulta);
        while(rs.next()){
            db = new DetalleBoleta();
            db.setNombreProducto(rs.getString(1));
            db.setPrecioProducto(rs.getInt(2));
            db.setCantidad(rs.getInt(3));
            db.setFecha(rs.getDate(4));
            db.setMedioPago(rs.getString(5));
            db.setTotal(rs.getInt(6));
            db.setRut_cliente(rs.getString(7));
            db.setSubtotal(rs.getInt(8));
            lista.add(db);

        }
        return lista;
        
    }
    
    public List<Boleta> getBoletaLike(String buscar) throws SQLException{
        List<Boleta> lista = new ArrayList<>();
        Boleta detalle = null;
        
        String select = "SELECT id_boleta, fecha_boleta, mediopago_boleta, total, rut_cliente from boleta where rut_cliente LIKE '%"+buscar+"%'";
        //id, fecha, mediopago,total
        ResultSet rs = C.ejecutarSelect(select);
        while(rs.next()){
            detalle = new Boleta();
            detalle.setId(rs.getInt(1));
            detalle.setFecha(rs.getDate(2));
            detalle.setMedioPago(rs.getString(3));
            detalle.setTotal(rs.getInt(4));
            detalle.setRut_cliente(rs.getString(5));
            lista.add(detalle);
        }
        
        return lista;
    }
    
    public void restarStock(int cantidad, int id) throws SQLException{
        String consulta = "UPDATE producto SET stock_producto = '"+cantidad+"' WHERE id_producto = '"+id+"'";
        C.ejecutar(consulta);

    }
    
    public String getTipoUsuarioSegunId(int id) throws SQLException{
        String nombre = "";
        String select = "SELECT nombre_tipoUsuario FROM tipo_Usuario WHERE id = '"+id+"';";
        
        ResultSet rs = C.ejecutarSelect(select);
        if(rs.next()){
            nombre = rs.getString(1);
        }
        
        return nombre;
    }
    
    public List<String> getTipoUsuario() throws SQLException{
        String nombre ="";
        List<String> lista = new ArrayList<>();
        
        String select = "SELECT nombre_tipoUsuario from tipo_Usuario;";
        ResultSet rs = C.ejecutarSelect(select);
        
        while(rs.next()){
             nombre = rs.getString(1);
             lista.add(nombre);
        }
       
        return lista;
    }
    
    public List<TipoProducto> getTipoProducto() throws SQLException{
        TipoProducto tp = null;
        List<TipoProducto> lista = new ArrayList<>();
        String select = "Select id_tipoProducto, nombre_tipoProducto from tipo_producto";
        ResultSet rs = C.ejecutarSelect(select);
        
        while(rs.next()){
            tp = new TipoProducto();
            tp.setId(rs.getInt(1));
            tp.setNombre(rs.getString(2));
            lista.add(tp);
            
        }
        return lista;
    }
    
    public void insertarCompra(int cantidad, int costo, int total) throws SQLException{
        String consulta = "INSERT INTO compra VALUES(NULL, NOW(), (SELECT MAX(id_producto) FROM producto), '"+cantidad+"','"+costo+"','"+total+"');";
        C.ejecutar(consulta);
    }
    
   public List<Boleta> getGastos() throws SQLException{
       List<Boleta> lista = new ArrayList<>();
       Boleta b = null;
       String gasto = "";
       String consulta = "select total_compra from compra;";
       ResultSet rs = C.ejecutarSelect(consulta);
       while(rs.next()){
           b = new Boleta();
           
           b.setTotal(rs.getInt(1));
           lista.add(b);
       }

       return lista;
   }

   public List<String> getGanancias() throws SQLException{
       List<String> lista = new ArrayList<>();
       String consulta = "select total from boleta;";
       String valor = "";
       ResultSet rs = C.ejecutarSelect(consulta);
       while(rs.next()){
           valor = rs.getString(1);
           lista.add(valor);
       }
       return lista;
   }
   
   public List<String> getFechasBoletas() throws SQLException{
       List<String> lista = new ArrayList<>();
       
       
       String sql = "SELECT FECHA_BOLETA FROM BOLETA;";
       //String sql = "SELECT (select min(fecha_boleta) from boleta) as 'primera boleta',"
       //        + " (select max(fecha_boleta) from boleta) as 'ultima boleta';";
       //String sql2 = "SELECT (SELECT MIN(fecha_compra)FROM compra), (SELECT MAX( fecha_compra )FROM compra);";
       
       Date resultado1 = null;
       //Date resultado2 = null;
       
       try {
           ResultSet rs = C.ejecutarSelect(sql);
            
           while(rs.next()){
                resultado1 = rs.getDate(1);
                //resultado2 = C.resultado.getDate(2);
                
                lista.add(resultado1.toString());
                //lista.add(resultado2.toString());
           }
       } catch (Exception e) {
           lista = null;
       }
       

       return lista;
   }
   
   public List<String> getFechasGastos() throws SQLException{
       List<String> lista = new ArrayList<>();
       
       String sql = "SELECT FECHA_COMPRA FROM COMPRA;";
       //String sql = "SELECT (SELECT MIN(fecha_compra)FROM compra), "
       //        + "(SELECT MAX( fecha_compra )FROM compra);";
       
       Date resultado1 = null;
       //Date resultado2 = null;
       
       try {
           ResultSet rs = C.ejecutarSelect(sql);
            
           while(rs.next()){
                resultado1 = rs.getDate(1);
                //resultado2 = C.resultado.getDate(2);
                
                lista.add(resultado1.toString());
                //lista.add(resultado2.toString());
           }
       } catch (Exception e) {
           lista = null;
       }
       

       return lista;
   }
   
   public List<String> getCantidadVentas() throws SQLException{
       List<String> lista = new ArrayList<>();
       

       String sql = "SELECT COUNT(total_compra) FROM COMPRA";
       ResultSet rs = C.ejecutarSelect(sql);
       
       if(rs.next()){
           lista.add(rs.getString(1));
       }
       return lista;
   }
   
   public List<String> getCantidadGastos() throws SQLException{
       List<String> lista = new ArrayList<>();
       

       String sql = "SELECT COUNT(total) FROM BOLETA";
       ResultSet rs = C.ejecutarSelect(sql);
       
       if(rs.next()){
           lista.add(rs.getString(1));
       }
       return lista;
   }
   
   public void editarCompra(int id, int costo, int total) throws SQLException{
       String consulta = "UPDATE compra SET precio_unitario = '"+costo+"', total_compra ='"+total+"' WHERE compra.id_producto_fk = '"+id+"';";
       C.ejecutar(consulta);
   }
   
   public int getCostoPorIdProducto(int id) throws SQLException{
       int precio_unitario = 0;
       String consulta = "select precio_unitario from compra where compra.id_producto_fk = '"+id+"';";
       ResultSet rs = C.ejecutarSelect(consulta);
       
       if(rs.next()){
           precio_unitario = rs.getInt(1);
       }
       return precio_unitario;
   }
   
   public int getTotalGanancias() throws SQLException{
       int total = 0;
       String consulta = "select sum(total) from boleta";
       ResultSet rs = C.ejecutarSelect(consulta);
       
       if(rs.next()){
           total = rs.getInt(1);
       }else{
           total = 0;
       }
       return total;
   }
   
   public int getTotalGastos() throws SQLException{
       int total = 0;
       String consulta = "select sum(total_compra) from compra";
       ResultSet rs = C.ejecutarSelect(consulta);
       
       if(rs.next()){
           total = rs.getInt(1);
       }else{
           total = 0;
       }
       return total;
   }
   
   public void insertarCategoria(String nombre) throws SQLException{
       String consulta = "INSERT INTO tipo_producto VALUES(null, '"+nombre+"');";
       C.ejecutar(consulta);
   }
       
}
