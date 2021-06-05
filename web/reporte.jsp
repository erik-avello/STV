<%-- 
    Document   : reporte
    Created on : 31-01-2021, 3:52:59
    Author     : Santo Tomás
--%>

<%@page import="net.sf.jasperreports.engine.JasperCompileManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Driver"%>
<%@page import="java.sql.Connection"%>
<%@page import="bd.DatosConexion"%>
<%@page import="bd.Conexion"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.io.File"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <% 
            Connection con = null;
            try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/system","root","");
                } catch (Exception e) {
                }
            
            if(request.getParameter("tipo").equals("producto")){
                File reporte = new File(application.getRealPath("Reports/reporteProductos.jasper"));
                Map<String,Object> parametro = new HashMap<String, Object>();

                byte[] bytes = JasperRunManager.runReportToPdf(reporte.getPath(), parametro,con);
                response.setContentType("application/pdf");
                response.setContentLength(bytes.length);
                ServletOutputStream output = response.getOutputStream();
                response.getOutputStream();
                output.write(bytes,0,bytes.length);
                output.flush();

                output.close();
            }
            else{
                if(request.getParameter("tipo").equals("usuario")){
                    File reporte = new File(application.getRealPath("Reports/reporteUsuarios.jasper"));
                    Map<String,Object> parametro = new HashMap<String, Object>();

                    byte[] bytes = JasperRunManager.runReportToPdf(reporte.getPath(), parametro,con);
                    response.setContentType("application/pdf");
                    response.setContentLength(bytes.length);
                    ServletOutputStream output = response.getOutputStream();
                    response.getOutputStream();
                    output.write(bytes,0,bytes.length);
                    output.flush();

                    output.close();
                }
            }
            
            
        %>
    </body>
</html>
