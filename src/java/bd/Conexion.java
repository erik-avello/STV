package bd;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;
import java.sql.Connection; // Clase para conectar
import java.sql.Statement; // Clase para enviar consultas SQL
import java.sql.ResultSet; // Clase para obtener los datos o resultados de
                           // un select
import java.sql.SQLException; // Para manejar excepciones de SQL
import java.util.logging.Level;
import java.util.logging.Logger;

public class Conexion {
    private static Connection conexion; // con
    private Statement sentencia;  // sen
    private ResultSet resultado;  // rs

    public Conexion() {
    }
    
    private static Connection getCon(){
        if(conexion == null){
            try {
                MysqlDataSource mysql = new MysqlDataSource();//MySql Connector
                
                mysql.setServerName(DatosConexion.SERVER);//localhost
                mysql.setDatabaseName(DatosConexion.BD);//NombreBD
                mysql.setUser(DatosConexion.USER);//Usuario
                mysql.setPassword(DatosConexion.PASS);//Contraseña
                
                conexion = mysql.getConnection();//Instanciar variable conexion
            } catch (SQLException ex) {
                Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return conexion;
    }
    
    /**
    @param sql - Puede ser un Delete, Update o Insert 
     * @throws java.sql.SQLException 
    */
    public void ejecutar(String sql) throws SQLException {
        sentencia = getCon().createStatement();
        sentencia.executeUpdate(sql);
        sentencia.close();
    }
    
    /**
    @param select consulta select -Si o si retorna algo
    @return un opbjeto del Tipo ResultSet
    @throws SQLException 
    */
    public ResultSet ejecutarSelect(String select) throws SQLException{
        sentencia = getCon().createStatement();
        resultado = sentencia.executeQuery(select);
        return resultado;
    }
}