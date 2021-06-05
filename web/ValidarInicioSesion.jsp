<%-- 
    Document   : ValidarInicioSesion
    Created on : 14-may-2020, 2:17:45
    Author     : Erik
--%>
<%@page import="model.User"%>

<%
    HttpSession misession = (HttpSession) request.getSession();
    User usuario = (User) misession.getAttribute("sesion");
    
    if(usuario == null){
        request.getRequestDispatcher("index.jsp?m=validacion").forward(request, response);
    }
%>

