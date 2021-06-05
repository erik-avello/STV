
CREATE TABLE user(
    id_user INT AUTO_INCREMENT,
    rut_user VARCHAR(13),
    nombre_user VARCHAR(50),
    apellido_user VARCHAR(50),
    pass_user VARCHAR(15),
    fechaNacimiento_user DATE,
    tipo_user INT,

    PRIMARY KEY(id_user)
    
);


CREATE TABLE tipo_producto(
    id_tipoProducto INT AUTO_INCREMENT,
    nombre_tipoProducto VARCHAR(50),
    PRIMARY KEY(id_tipoProducto)
);

CREATE TABLE producto(
    id_producto INT AUTO_INCREMENT,
    codigo_producto VARCHAR(100),
    nombre_producto VARCHAR(50),
    precio_producto FLOAT,
    stock_producto INT,
    tipo_producto INT,
    
    FOREIGN KEY(tipo_producto) REFERENCES tipo_producto(id_tipoProducto),
    PRIMARY KEY(id_producto)
    
);

CREATE TABLE venta(
    id_venta INT AUTO_INCREMENT,
    total_venta FLOAT, /*DATO PROVENIENTE DESDE DETALLE_VENTA*/
    fecha_venta DATE,
    
    PRIMARY KEY(id_venta)
);

CREATE TABLE detalle_venta(
    id_detalle_venta INT AUTO_INCREMENT,
    costo_detalle_venta FLOAT, /*COSTO PARA COMPRAR*/
    precio_detalle_venta FLOAT,/*PRECIO VENTA*/
    cantidad_detalle_venta INT,/*precio_detalle_venta * cantidad_detalle_venta = "total_venta" tabla VENTA */
    id_venta INT,
    id_producto INT,
    
    PRIMARY KEY(id_detalle_venta),
    FOREIGN KEY(id_venta) REFERENCES venta(id_venta),
    FOREIGN KEY(id_producto) REFERENCES producto(id_producto)
);

CREATE TABLE perdida(
    id_perdida INT AUTO_INCREMENT,
    fecha_perdida DATE,
    total_perdida INT, /*CUANTO ESTOY PERDIENDO?*/

    PRIMARY KEY(id_perdida)
);

CREATE TABLE detalle_perdida(
    id_detalle_perdida INT AUTO_INCREMENT,
    total_detalle_perdida FLOAT, /*TOTAL * CANTIDAD = "total_perdida" de tabla perdida */
    cantidad_detalle_perdida INT,/*TOTAL * CANTIDAD = "total_perdida" de tabla perdida */
    id_perdida INT,
    id_producto INT,

    PRIMARY KEY(id_detalle_perdida),
    FOREIGN KEY(id_perdida) REFERENCES perdida(id_perdida),
    FOREIGN KEY(id_producto) REFERENCES producto(id_producto)

);

CREATE TABLE compra(
    id_compra int AUTO_INCREMENT,
    fecha_compra int,
    total_compra int, /*DATO PROVENIENTE DESDE DETALLE_COMPRA*/
    PRIMARY KEY(id_compra)
);

CREATE TABLE detalle_compra(
    id_detalle_compra INT AUTO_INCREMENT,
    preciounitario_detalle_compra FLOAT, /*CUANTO ME CUESTA COMPRAR TAL COSA*/
    cantidad_detalle_compra INT, /*preciounitario_detalle_compra * cantidad_detalle_compra =  "total_compra" tabla COMPRA */
    id_compra INT,
    id_producto INT,

    PRIMARY KEY(id_detalle_compra),
    FOREIGN KEY(id_compra) REFERENCES compra(id_compra),
    FOREIGN KEY(id_producto) REFERENCES producto(id_producto)
);






--Drop table producto

--INSERT INTO producto VALUES (NULL,'2','Sprite','2000','10','3');

--INSERT INTO tipo_producto VALUES(NULL, 'Comida');
--INSERT INTO tipo_producto VALUES(NULL, 'Lácteos');
--INSERT INTO tipo_producto VALUES(NULL, 'Bebidas');

--select * from producto;
--select * from tipo_producto;
