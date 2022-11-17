create database final
GO
use ExFinal
GO

create table clientebd(
Cedula int not null,
Nombre varchar(45),
Apellido varchar(45),
Correo varchar(45),
Telefono varchar(45),
Direccion varchar(45),
Edad varchar(45),
Genero varchar(45),
constraint Pk_clientebd primary key (Cedula)
)

create table Pais(
Cod_pais int not null,
Nombre varchar(45),
constraint Pk_Pais primary key (Cod_pais)
)

create table Ciudad(
Cod_ciudad int not null,
Nombre varchar(45),
Pais_cod_pais int,
constraint Pk_Ciudad primary key (Cod_ciudad),
constraint fk_Ciudad_Pais foreign key (Pais_cod_pais) references Pais(Cod_pais)
)

create table Tienda(
Cod_tienda int not null,
Nombre varchar(45),
Ciudad_cod_ciudad int,
constraint Pk_Tienda primary key (Cod_tienda),
constraint fk_Tienda_Ciudad foreign key (Ciudad_cod_ciudad) references Ciudad(Cod_ciudad)
)

create table Factura(
Nro_factura int not null,
Fecha date,
Cod_tienda int, 
Tienda_cod_tienda int,
Cliente_cedula int,
constraint Pk_Factura primary key (Nro_factura),
constraint fk_Factura_Cliente foreign key (Cliente_cedula) references Cliente(Cedula),
constraint fk_Factura_Tienda foreign key (Tienda_cod_tienda) references Tienda(Cod_tienda)
)

create table Producto(
Referencia int not null,
Nombre varchar(45),
Valor int, 
constraint Pk_Producto primary key (Referencia)
)

create table Det_Factura(
Cantidad int not null,
Valor_uni date,
Valor_total int, 
Factura_nro_factura int,
Producto_referencia int,
constraint fk_Det_Factura_Factura foreign key (Factura_nro_factura) references Factura(Nro_factura),
constraint fk_Det_Factura_Producto foreign key (Producto_referencia) references Producto(Referencia)
)
select *from Producto 



