CREATE DATABASE system;
use system;

--drop database system;


CREATE TABLE tipo_usuario(
    id INT AUTO_INCREMENT,
    nombre_tipoUsuario VARCHAR(50) UNIQUE,
    PRIMARY KEY(id)
);

INSERT INTO TIPO_USUARIO VALUES(NULL, 'Administrador');
INSERT INTO TIPO_USUARIO VALUES(NULL, 'Trabajador');

CREATE TABLE user(
    id_user INT AUTO_INCREMENT,
    rut_user VARCHAR(13) UNIQUE,
    nombre_user VARCHAR(50),
    apellido_user VARCHAR(50),
    pass_user VARCHAR(15),
    tipo_usuario_fk INT,
    estado INT,

    PRIMARY KEY(id_user),
    FOREIGN KEY(tipo_usuario_fk) REFERENCES tipo_usuario(id)
    --tipo 1 es admin, tipo 2 es otro (privilegios según número)
    --Editar pass en un futuro
    --Estado 1 == disponible, 0 == no disponible.
);

--SELECT * FROM USER;

CREATE TABLE tipo_producto(
    id_tipoProducto INT AUTO_INCREMENT,
    nombre_tipoProducto VARCHAR(50) UNIQUE,
    PRIMARY KEY(id_tipoProducto)
);

CREATE TABLE producto(
    id_producto INT AUTO_INCREMENT,
    codigo_producto BIGINT UNSIGNED UNIQUE,
    nombre_producto VARCHAR(50),
    precio_producto FLOAT,
    stock_producto INT,
    tipo_producto INT,
    estado int,
    
    FOREIGN KEY(tipo_producto) REFERENCES tipo_producto(id_tipoProducto),
    PRIMARY KEY(id_producto)
     --RECORDAR QUE "idTipo_producto" referencia a tipo_producto pero su id, o sea que 
    --al momento de registrar productos debemos darle una id que sea coherente con
    --alguna id de tipo_producto, por ejemplo: 1 = bebestible, 2 = comida, etc...
    
);

--Boleta debe pertenecer a cliente y a su vez a un local

CREATE TABLE boleta(
    id_boleta INT AUTO_INCREMENT,
    fecha_boleta DATETIME,
    mediopago_boleta VARCHAR(100),
    total INT,
    rut_cliente VARCHAR(100), 
    PRIMARY KEY(id_boleta)
);

insert into BOLETA values(NULL,NOW(),'efectivo',17000, '20028993-5');

CREATE TABLE venta(
    id_venta INT AUTO_INCREMENT,
    id_producto_fk INT,
    id_boleta_fk INT,
    precio INT,
    cantidad INT,
    
    PRIMARY KEY(id_venta),
    FOREIGN KEY(id_producto_fk) REFERENCES producto(id_producto),
    FOREIGN KEY(id_boleta_fk) REFERENCES boleta(id_boleta)
);

INSERT INTO venta VALUES(NULL,'1','1',2); -- 4000
INSERT INTO venta VALUES(NULL,'2','1',4); -- 8000
INSERT INTO venta VALUES(NULL,'4','1',1); -- 5000
INSERT INTO VENTA VALUES(NULL,'99061443168567297',(SELECT MAX(id_boleta) FROM boleta), 2);

select max(id_boleta) from boleta;
select * from boleta;
select * from venta;

Drop table boleta;
Drop table venta;

SELECT venta.id_producto_fk, venta.cantidad
FROM venta, boleta
INNER JOIN venta ON venta.id_boleta_fk = boleta.id_boleta
WHERE boleta.id_boleta = select max(id_boleta) from boleta;

CREATE VIEW vista_ultima_boleta
AS
SELECT producto.nombre_producto, producto.precio_producto, venta.cantidad, boleta.fecha_boleta, boleta.mediopago_boleta, boleta.total AS 'Total'
FROM venta, boleta, producto
WHERE (venta.id_boleta_fk = boleta.id_boleta AND producto.id_producto = venta.id_producto_fk)
AND boleta.id_boleta = (SELECT MAX(id_boleta) FROM boleta);

select * from venta;

DROP VIEW vista_ultima_boleta;
select * from vista_ultima_boleta;

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
    fecha_compra DATETIME,
    id_producto_fk INT,
    cantidad INT, --En editar agregar o restarle a este campo de la tabla
    precio_unitario INT, --Campo que se rellena en "Costo adquisición"

    total_compra int, /*cantidad * precio_unitario*/

    PRIMARY KEY(id_compra),
    FOREIGN KEY(id_producto_fk) REFERENCES producto(id_producto)
);

-- select * from compra;

INSERT INTO compra VALUES(NULL, NOW(), 1, 2, 2000, 4000);

select compra.id_compra, compra.fecha_compra, producto.nombre_producto ,compra.cantidad, compra.precio_unitario, compra.total_compra
FROM compra, producto
WHERE (compra.id_producto_fk = producto.id_producto);

select * from compra;
select precio_unitario from compra where compra.id_producto_fk = 7;

/*UPDATE compra SET precio_unitario = 110, total_compra =  WHERE compra.id_producto_fk = 7;*/

select SUM(total_compra) FROM compra;
select SUM(total) from boleta;

select total_compra from compra;
select total from boleta;

select min(fecha_boleta) from boleta;
select max(fecha_boleta) from boleta;

select min(fecha_compra) from compra;
select max(fecha_compra) from compra;

select fecha_boleta from boleta where fecha_boleta between '2021-01-01' AND '2021-01-09';

Select (select sum(total) from boleta) - (select sum(total_compra) from compra) As "ganancia";

select REST();

select * from compra;
select * from producto;
--Drop table producto

INSERT INTO producto VALUES (NULL,UUID_SHORT(),'Sprite','2000','10','3',1);
INSERT INTO producto VALUES (NULL, IF(NULL, UUID_SHORT(), "123"),'Esparragos', 1000, 10, 3,1);
INSERT INTO producto VALUES (NULL,UUID_SHORT(),'Chocolate','2000','10','1',1);
INSERT INTO producto VALUES (NULL,UUID_SHORT(),'Alcohol','5000','10','2',1);

select * from producto;
INSERT INTO tipo_producto VALUES(NULL, 'Comida');
INSERT INTO tipo_producto VALUES(NULL, 'Lácteos');
INSERT INTO tipo_producto VALUES(NULL, 'Bebidas');

--select * from producto;
--select * from USER;
--DELETE FROM PRODUCTO;

INSERT INTO user VALUES(NULL,'111','Erik','Avello','123',1,1);
INSERT INTO user VALUES(NULL,'222','Antonio','Muñoz','123',2,1);

--select * from tipo_producto;

SELECT SUM(total) FROM boleta;
SELECT SUM() from compra;

--Total ventas por mes (aplica para gastos modificando los campos):
--RECORDAR SE PUEDE REEMPLAZAR MONTHNAME POR DAYOFWEEK O DAYOFMONTH (TRADUZCA)
--SELECT MONTHNAME( fecha_boleta ) AS Mes, SUM( total ) AS Total
--FROM boleta
--WHERE YEAR( fecha_boleta ) = '2021'
--GROUP BY Mes
--ORDER BY Mes ASC

--Ventas por semana
--SELECT   DAYOFWEEK(fecha_hora) as dia
--       , sum(total) as VentasDia
--  FROM ventas 
-- WHERE YEARWEEK(`fecha_hora`, 1) = YEARWEEK(CURDATE(), 1) 
-- group by DAYOFWEEK(fecha_hora)
-- ORDER BY DAYOFWEEK(fecha_hora)



SELECT * FROM producto WHERE id_producto = 6;

select * from tipo_producto;

DELETE FROM producto
WHERE id_producto = 6;
delete from compra where id_producto_fk = 6;

select * from user;
select * from producto;
UPDATE PRODUCTO SET estado = 1 WHERE id_producto = '2';
SELECT * FROM user WHERE estado = '1' AND rut_user LIKE '11-1' OR nombre_user LIKE '' OR apellido_user LIKE '';

SELECT producto.nombre_producto, producto.precio_producto, venta.cantidad, boleta.fecha_boleta, boleta.mediopago_boleta, boleta.total, boleta.rut_cliente FROM venta, boleta, producto WHERE (venta.id_boleta_fk = boleta.id_boleta AND producto.id_producto = venta.id_producto_fk) AND boleta.id_boleta = '1';
select * from venta;

SELECT TOP(1) id_producto, SUM(stock_producto) AS TotalQuantity
FROM producto
GROUP BY id_producto
ORDER BY TotalQuantity DESC;
