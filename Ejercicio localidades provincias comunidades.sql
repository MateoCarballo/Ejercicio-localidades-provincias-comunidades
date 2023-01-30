#------------------------------------------------------------------------------------------------------
#  1. Creación de la Base de Datos
#------------------------------------------------------------------------------------------------------
drop database if exists LocalidadesProvinciasComunidades;
create database LocalidadesProvinciasComunidades;
use LocalidadesProvinciasComunidades;
#------------------------------------------------------------------------------------------------------
#  2. Creación de las tablas
#------------------------------------------------------------------------------------------------------
create table localidades(
id_localidad 	int,
nombre 			varchar(50),
poblacion		int,
n_provincia		int
);

create table provincias(
n_provincia 	int,
nombre			varchar(25),
superficie		int,
id_capital		int,
id_comunidad	int		 
);

create table comunidades(
id_comunidad	int,
nombre			varchar(25),
id_capital		int,
max_provincias	int
);
#------------------------------------------------------------------------------------------------------
#  3. Creación de claves pimarias
#------------------------------------------------------------------------------------------------------
alter table localidades
modify id_localidad int primary key;

alter table provincias
modify n_provincia int primary key;

alter table comunidades
modify id_comunidad int primary key;

#------------------------------------------------------------------------------------------------------
#  4. Creación de claves foráneas
#------------------------------------------------------------------------------------------------------
alter table localidades
add constraint FK_localidades_provincias foreign key (n_provincia) 		references provincias(n_provincia);

alter table provincias
add constraint 	FK_provincias_localidades foreign key (id_capital) 		references localidades(id_localidad),
add constraint	FK_provincias_comunidades foreign key (id_comunidad)	        references comunidades(id_comunidad);

alter table comunidades
add constraint FK_comunidades_localidades foreign key (id_capital)		references localidades(id_localidad);

#------------------------------------------------------------------------------------------------------
#  5. Modificación de campos únicos
#------------------------------------------------------------------------------------------------------
alter table provincias
modify 	nombre 		varchar(25) unique,
modify	id_capital 	int 		unique;

alter table comunidades
modify	nombre 		varchar(25) unique,
modify	id_capital	int 		unique;
        
#------------------------------------------------------------------------------------------------------
#  6. Modificación de campos no nulos
#------------------------------------------------------------------------------------------------------
alter table localidades
modify	nombre		varchar(50) 		not null,
modify	n_provincia	int					not null;	

alter table provincias
modify	nombre			varchar(50)		not null,
modify	id_capital		int				not null,
modify	id_comunidad	int				not null;

alter table comunidades
modify	nombre			varchar(50)		not null,
modify	id_capital		int				not null;

#------------------------------------------------------------------------------------------------------
#  7. Renombra n_provincia por numero_provincia
#------------------------------------------------------------------------------------------------------
alter table localidades
rename column n_provincia to numero_provincias;

#change column n_provincia numero_provincia int;
#------------------------------------------------------------------------------------------------------
#  8. Renombra nombre por nombreLocalidad, nombreProvincia y nombreComunidad
#------------------------------------------------------------------------------------------------------
alter table localidades
rename column nombre to nombreLocalidad;

alter table provincias
rename column nombre to nommbreProvincia;

alter table comunidades
change column nombre nombreComunidad varchar(25);
#------------------------------------------------------------------------------------------------------
#  9. Renombra id_capital por capitalProvincia y capitalComunidad
#------------------------------------------------------------------------------------------------------
alter table provincias
rename column id_capital to capitalProvincia;

alter table comunidades
rename column id_capital to capitalComunidad;
#------------------------------------------------------------------------------------------------------
# 10. Muestra la descripción de las tres tablas.
#------------------------------------------------------------------------------------------------------
select * from localidades;
select * from provincias;
select * from comunidades;
