function correcto() {
    swal("Correcto", "Operación completada de manera exitosa!", "success");
}

function error() {
    swal("Error", "Error al completar la operación!", "error");
}

function advertencia() {
    swal({
        title: "Advertencia",
        text: "¿Seguro que quiere eliminar este elemento?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    })
            .then((willDelete) => {
                if (willDelete) {
                    swal("Operación completada de manera exitosa!", {
                        icon: "success",
                    });
                } else {
                    swal("Operación cancelada");
                }
            });
}

function errorSesion() {
    swal("Error", "Ingrese sus datos correctamente!", "error");
}

function inicieSesion() {
    swal("Error", "Primero inicie sesión", "error");
}

function sesionCerrada() {
    swal("Correcto", "Sesion cerrada correctamente", "success");
}


