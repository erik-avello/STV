<html>
    <head>
        <!--MATERIALIZE-->
        <link type="text/css" rel="stylesheet" href="Style/materialize/css/formulario.css">
        <link type="text/css" rel="stylesheet" href="Style/materialize/css/materialize.min.css"  media="screen,projection"/>
        <script type="text/javascript" src="Style/materialize/js/jquery-3.2.1.min.js"></script>        
        <script type="text/javascript" src="Style/materialize/js/materialize.min.js"></script>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel=stylesheet type="text/css" href="css_InicioSesion.css">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="Style/materialize/js/sweetAlertFunciones.js"></script>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>TODO supply a title</title>
    </head>

    <body>

        <div class="valign-wrapper formulario"> 

            <div class="card-panel">

                <span class="red-text text-darken-2">

                    <form action="iniciar_sesion.do" method="POST">
                        <h2 class="center-align">Inicio sesión</h2>

                        <div class="input-field col s12">
                            <i class="material-icons prefix">perm_identity</i>
                            <input id="user" type="text" name="txtUsuario" required>
                            <label for="user">Rut usuario</label>
                        </div>

                        <div class="input-field col s12">     
                            <i class="material-icons prefix">lock_outline</i>
                            <input id="password" type="password" name="txtContrasenia" required>
                            <label for="password">Contraseña</label>
                        </div>

                        <div align="center">
                            <button type="submit" name="inicio" class="btn col s12 red" >Iniciar Sesión
                                <i class="material-icons right">send</i>
                            </button>

                        </div>

                    </form>
                </span>
            </div>



        </div>


        <div>
            <%
                String mensaje = request.getParameter("m");
                if (mensaje != null) {
                    if (mensaje.equals("1")) {%>
            <script type="text/javascript">
                var mensaje = <%= mensaje%>
                if (mensaje == "1") {
                    errorSesion();
                }
            </script>  

            <%} else if (mensaje.equals("validacion")) {%>
            <script type="text/javascript">
                var mensaje = <%= mensaje%>
                if (mensaje == "validacion") {
                    inicieSesion();
                }
            </script>  
            <%} else if (mensaje.equals("3")) {%>
            <script type="text/javascript">
                var mensaje = <%= mensaje%>
                if (mensaje == "3") {
                    sesionCerrada();
                }
            </script> 
            <%} 
                }
            %>
        </div>


    </body>
</html>