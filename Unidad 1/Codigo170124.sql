
--PRACTICA 2--

create database Practica2
go

 
CREATE TABLE tblcliente(
   idCliente int not null,
   nombre varchar(100) not null,
   direccion varchar(100),
   tel varchar(20) not null, 
   constraint pk_tblcliente
   primary key(idCliente),
   constraint unique_nombre
   unique(nombre)
)
go

 
CREATE TABLE tbempleado(
   idEmpleado int not null,
   nombre varchar(50) not null,
   apellidos varchar(50) not null,
   direccion varchar(100),
   sexo char(1) not null,
   salario decimal(10,2) not null,
   constraint pk_tblempleado
   primary key(idEmpleado),
   constraint chk_salario
  check(salario>=400 and salario<=50000),
)
go

create table tblVenta(
 idVenta int not null,  
 fecha date not null, 
 idcliente int not null,
 idempleado int not null,
  constraint pk_tblVenta
   primary key(idVenta),
  constraint fk_tblcliente
  foreign key(idcliente)
  references tblcliente(clienteId),
  constraint fk_tblempleado
  foreign key(idempleado)
  references tbempleado(idEmpleado)
)


CREATE TABLE tblproducto(
   idProducto int not null,
   descripcion varchar(200) not null,
   existencia int not null,
   precioUnitario decimal(10,2) not null, 
   constraint pk_tblproducto
   primary key (idProducto),
   constraint unique_descripcion
   unique(descripcion)
)
go

create table detalle_Venta(
  idVenta int not null,
  idProducto int not null,
  precio decimal(10,2) not null,
  cantidad int not null, 
  constraint pk_detalle_venta
  primary key(idVenta,idProducto),
  constraint fk_tblVenta
  foreign key(idVenta)
  references tblVenta(idVenta),
  constraint fk_tblproducto
  foreign key(idProducto)
  references tblproducto(idProducto),
)
go