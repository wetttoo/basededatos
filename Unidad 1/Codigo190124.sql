CREATE  DATABASE Practica3 
go 


USE Practica3
go

create table categoria ( 
categoriaId int not null,
numero int not null,
descripcion varchar(50) not null,
constraint pk_categoria
primary key (categoriaId, numero)
)
go

create table producto(
productoId int not null,
descripcion varchar(100) not null,
precio decimal(10,2) not null,
stock int not null,
categoriaId int not null,
numeroInventario int not null,
constraint pk_producto
primary key(productoId),
constraint fk_producto_categoria
foreign key (categoriaId, numeroInventario)
references categoria (categoriaId, numero)
)
go

create table pruebaCalculado ( 
id int not null identity(1,1), 
nombre varchar(50), 
precio decimal(10,2) not null, 
existencia int not null,
importe as 
(precio * existencia), 
constraint pk_pruebacalculo 
primary key(id)
)

select * from pruebaCalculado
insert into pruebaCalculado
values ('Chanclonas',345,4)