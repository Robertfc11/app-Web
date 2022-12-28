drop database if exists fornitureweb;
create database fornitureweb;
use fornitureweb;

create table rol(
rol_cve_rol				int				not null	auto_increment	primary key,
rol_nombre				varchar (40)	not null,
rol_descripcion			varchar (150)		null
);

INSERT INTO `fornitureweb`.`rol` (`rol_cve_rol`, `rol_nombre`, `rol_descripcion`) VALUES ('1', 'admin', 'Tiene acceso a todos los registros y movimientos.');
INSERT INTO `fornitureweb`.`rol` (`rol_cve_rol`, `rol_nombre`, `rol_descripcion`) VALUES ('2', 'vendedor', 'Tiene acceso al inventario y movimientos de productos.');
INSERT INTO `fornitureweb`.`rol` (`rol_cve_rol`, `rol_nombre`, `rol_descripcion`) VALUES ('3', 'espectador', 'Solo puede visualizar el contenido de la tabla producto.');

select * from rol;


create table usuario (
usu_cve_usuario				int				not null	auto_increment primary key,
usu_password				varchar (40)	not null,
usu_nombre					varchar (25)	not	null,
usu_apellido_paterno		varchar (25)	not null,
usu_apellido_materno		varchar (25)		null,
usu_correo					varchar(40)		not null,
usu_telefono				varchar(15)		not null,		
usu_pais					varchar (40)	not null,
usu_estado					varchar (150)	not	null,
usu_colonia					varchar (150)	not null,
usu_calle					varchar (150)	not null,
usu_numero_exterior			varchar (5)		not null,
usu_numero_interior			varchar (5)			null,
rol_cve_rol				int				not null,
foreign key (rol_cve_rol) references rol(rol_cve_rol)
);

drop table if exists venta;
create table venta (
ven_cve_venta			int				not null	auto_increment primary key,
ven_total				decimal(6,2)	not null,
rol_cve_rol				int				not null,
usu_cve_usuario			int				not null,
foreign key (rol_cve_rol) references rol(rol_cve_rol),
foreign key (usu_cve_usuario) references usuario(usu_cve_usuario)
);

create table producto (
pro_cve_producto		int				not null	auto_increment primary key,
pro_nombre				varchar (50)	not null,
pro_descripcion			varchar (150)	not null,
pro_inventario			int				not null,
pro_precio				decimal(6,2)	not null
);

drop table if exists venta_has_producto;
create table venta_producto (
ven_cantidad			int				not null,
ven_cve_venta			int				not null,
pro_cve_producto		int				not null,
foreign key (pro_cve_producto) references producto(pro_cve_producto),
foreign key (ven_cve_venta) references venta(ven_cve_venta)
);

drop procedure if exists sp_Acceso;

delimiter $$
create procedure sp_Acceso
(
in usu varchar(15), -- usu= correo
in pwd varchar(15)  -- pwd = contraseña
)
begin
	if exists(  select u.usu_nombre, u.usu_apellido_paterno, u.usu_apellido_materno, u.usu_correo,
					   r.rol_nombre
				from   usuario u, rol r
				where  u.rol_cve_rol = r.rol_cve_rol
				and    u.usu_correo = usu
				and    u.usu_password = pwd   ) then
				
				-- Validación exitosa (usuario SI existe), se procede a enviar la bandera '1' + datos

				select '1', concat(u.usu_nombre, ' ', u.usu_apellido_paterno, ' ', u.usu_apellido_materno), 
					   u.usu_correo, r.rol_nombre
				from   usuario u, rol r
				where  u.rol_cve_rol = r.rol_cve_rol
				and    u.usu_correo = usu
				and    u.usu_password = pwd;

	else
				-- Validación fallida (usuario NO existe), se envía bandera '0'
				select '0';
	end if;
end $$

drop procedure if exists sp_DelProducto;
delimiter $$
create procedure sp_DelProducto
(
in id 			int
)
begin
	if exists(select pro_cve_producto from producto where pro_cve_producto = id ) then
			-- Validación correcta de complejo, se procede a eliminar (enviar código de exito)
			delete from producto where pro_cve_producto = id;
			select '1';
		else
			-- El complejo no existe(enviar código de error)
			select '-1';
		end if;
end $$

drop procedure if exists sp_InsProducto;
delimiter $$
create procedure sp_InsProducto
(
in nombre				varchar (50),
in descripcion			varchar (150),
in inventario			int,
in precio				decimal (6,2)
)
begin 
	if not exists (select pro_nombre from producto where pro_nombre = nombre) then 
			insert producto values (null, nombre, descripcion, inventario, precio);
			select '1';
		else
			-- EL nombre ya exixte, no se inserterá (enviar código de error)
			select '0';
		end if;
end $$

drop procedure if exists sp_UpdProducto;
delimiter $$
create procedure sp_UpdProducto
(
in id					int,
in nombre				varchar (50),
in descripcion			varchar (150),
in inventario			int,
in precio				decimal (6,2)
)
begin
	-- Definición de la validación 1: si el nombre aún no existe, se cambián los valores
   if exists (select pro_cve_producto from producto where pro_cve_producto = id) then
			update producto set 
				pro_nombre=nombre, 
				pro_descripcion=descripcion, 
				pro_inventario=inventario, 
				pro_precio=precio
				where pro_cve_producto=id;
			select '1';
        else 
			select '-1';
    end if;
end $$

select * from producto;
drop procedure if exists sp_InsUsuario;
delimiter $$
create procedure sp_InsUsuario
(
pasword				varchar (40),
nombre				varchar (25),
paterno				varchar (25),
materno				varchar (25),
correo				varchar(40),
telefono			varchar(15),		
pais				varchar (40),
estado				varchar (150),
colonia				varchar (150),
calle				varchar (150),
exterior			varchar (5),
interior			varchar (5),
rol					int
)
begin 
-- Definición de la validación 1: si no nombre no exixte aún, se insertarán los valores
		if not exists (select usu_correo from usuario where  usu_correo = correo ) then
			-- EL nombre ya exixte, no se inserterá (enviar código de error)
			insert usuario values (null, pasword, nombre, paterno, materno, correo, telefono, pais, estado, colonia, calle, exterior, interior, rol);
			select '1';
        else
			select '-1';
		end if;
end $$

drop procedure if exists sp_UpdUsuario;
delimiter $$
create procedure sp_UpdUsuario 
(
in	id					int,
in pasword				varchar (40),
in nombre				varchar (25),
in paterno				varchar (25),
in materno				varchar (25),
in correo				varchar(40),
in telefono				varchar(15),		
in pais					varchar (40),
in estado				varchar (150),
in colonia				varchar (150),
in calle				varchar (150),
in exterior				varchar (5),
in interior				varchar (5),
in rol					int
)
begin 
-- Definición de la validación 1: si no nombre no exixte aún, se insertarán los valores
	if exists (select usu_cve_usuario from usuario where  usu_cve_usuario=id ) then
			-- EL nombre ya exixte, no se inserterá (enviar código de error)
			update usuario set 
				usu_password= pasword,
				usu_nombre= nombre,
				usu_apellido_paterno =paterno,
				usu_apellido_materno= materno,
				usu_correo = correo,
				usu_telefono =telefono,		
				usu_pais =pais,
				usu_estado=estado,
				usu_colonia=colonia,
				usu_calle=calle,
				usu_numero_exterior=exterior,
				usu_numero_interior=interior,
				rol_cve_rol=rol
            where usu_cve_usuario=id;
			select '1';
        else
			select '-1';
		end if;
end $$

delimiter $$
create procedure sp_DelUsuario
(in id int
)
begin
	-- Definición de la validación 1.
		if exists(select usu_cve_usuario from usuario where usu_cve_usuario = id) then
			-- Validación correcta de complejo, se procede a eliminar (enviar código de exito)
			delete from usuario where usu_cve_usuario = id;
			select '1';
		else
			-- El complejo no existe(enviar código de error)
			select '-1';
		end if;
end $$
drop view if exists vw_usuario;

create view vw_usuario as
	select 
		usuario.usu_cve_usuario as Clave,
		concat (usuario.usu_nombre, ' ',usuario.usu_apellido_paterno, ' ',usuario.usu_apellido_materno ) as Nombre,
		usuario.usu_correo as Correo,
		usuario.usu_telefono as Telefono,		
		usuario.usu_pais as País,
		usuario.usu_estado as Estado,
		concat (usuario.usu_calle,' ',usuario.usu_numero_exterior,' int.', usuario.usu_numero_interior, ', Col. ', usuario.usu_colonia ) as Dirección,
		rol.rol_cve_rol as rol
	from usuario, rol
	where rol.rol_cve_rol = usuario.rol_cve_rol;

call sp_InsUsuario ('hola123', 'Nancy', 'Hernández','Sánchez', 'nanhersan@gmail.com', '7712173603', 'México', 'Hidalgo','Pri Chacón', 'Av. Olimpo',  '303','',1);
call sp_InsUsuario ('hola123', 'Nancy', 'Hernández','Sánchez', 'nanhn@gmail.com', '7712173603', 'México', 'Hidalgo','Pri Chacón', 'Av. Olimpo',  '303','',1);
call sp_InsUsuario ('hola123', 'Roberto', 'Flores','Cruz', 'robfcn@gmail.com', '771217543', 'México', 'Hidalgo','Campo de Tiro', 'Av. Olimpo',  '303','',2);
call sp_InsUsuario ('hola123', 'Arnold', 'Hernández','Pérz', 'arnhp@gmail.com', '7719873603', 'México', 'Hidalgo','Venta Prieta', 'Av. Olimpo',  '303','',2);
call sp_InsUsuario ('hola123', 'Marco', 'Martinez','Cruz', 'markito@gmail.com', '775217543', 'México', 'Hidalgo','El Palmar', 'Av. Olimpo',  '303','',3);
call sp_InsUsuario ('hola123', 'Victor', 'Hernández','Romero', 'vico@gmail.com', '7719873616', 'México', 'Hidalgo','Pitayas', 'Av. Olimpo',  '303','',3);

call sp_Acceso ('vico@gmail.com','hola123');

call sp_UpdUsuario (6,'adios987','Victor Jesús', 'Sandoval', 'Martinez','vico@gmail.com', '7946516562', 'España', 'Madrid', 'Griegos', 'Hércules', '92', '', 3);
   
call sp_InsProducto ('Sala modular Simplicity', 'Sala esquinera con estructura de madera industrializada, respaldo y asientos confortables con espumas de alta densidad.', 100, 7499.00);
call sp_InsProducto ('Cama Rosseta matrimonial', 'Cama matrimonial con espacio para zapatos elaborada en madera de pino, con un acojinamiento de hule espuma.', 130, 3799.00);
call sp_InsProducto ('Sillón Ocasional Norton Mostaza', 'Fabricado en estructura y brazos con madera de pino industrializada, asiento y respaldo con espuma de alta densidad que evita deformidades.', 120, 3999.00);
call sp_InsProducto ('Sofá Sala Irlanda Moderno Minimalista Lounge Retro', 'Estructura fabricada en madera de pino de ¾ de pulgada y laterales en panel aglomerado de pino.', 90, 4050.00);
call sp_InsProducto ('Escritorio Plegable Sira Estudio Sobrio', 'Con su superficie plegable es ideal en espacios reducidos o de transito, colócalo en tu habitación y has crecer tus ideas y proyectos.', 100, 2242.00);
call sp_InsProducto ('Mesa para Televisión Ryu Gris', 'Estilo contemporáneo y minimalista, fabricada en madera con jaladeras son metálicas, lo que le da gran estilo junto con su diseño asimétrico.', 267, 2799.00);

call sp_UpdProducto (1, 'Sala modular Simplicity', 'Sala esquinera con estructura de madera industrializada', 100, 7499.00);

INSERT INTO `fornitureweb`.`venta` (`ven_cve_venta`, `ven_total`, `rol_cve_rol`, `usu_cve_usuario`) VALUES (1, 7499.00, 2, 3);
INSERT INTO `fornitureweb`.`venta` (`ven_cve_venta`, `ven_total`, `rol_cve_rol`, `usu_cve_usuario`) VALUES (2, 2799.00, 2, 3);
INSERT INTO `fornitureweb`.`venta` (`ven_cve_venta`, `ven_total`, `rol_cve_rol`, `usu_cve_usuario`) VALUES (3, 3999.00, 2, 3);
INSERT INTO `fornitureweb`.`venta` (`ven_cve_venta`, `ven_total`, `rol_cve_rol`, `usu_cve_usuario`) VALUES (4, 6241.00, 2, 4);
INSERT INTO `fornitureweb`.`venta` (`ven_cve_venta`, `ven_total`, `rol_cve_rol`, `usu_cve_usuario`) VALUES (5, 3799.00, 2, 4);
INSERT INTO `fornitureweb`.`venta` (`ven_cve_venta`, `ven_total`, `rol_cve_rol`, `usu_cve_usuario`) VALUES (6, 4050.00, 2, 4);

select * from venta;
select * from venta_producto;
select * from producto;
select * from usuario;
select * from rol;

select * from vw_usuario where correo like '%vico@gmail.com%' and correo like '%sanchez%';
INSERT INTO `fornitureweb`.`venta_producto` (`ven_cantidad`, `ven_cve_venta`, `pro_cve_producto`) VALUES (1, 1, 1);
INSERT INTO `fornitureweb`.`venta_producto` (`ven_cantidad`, `ven_cve_venta`, `pro_cve_producto`) VALUES (1, 2, 6);
INSERT INTO `fornitureweb`.`venta_producto` (`ven_cantidad`, `ven_cve_venta`, `pro_cve_producto`) VALUES (1, 3, 3);
INSERT INTO `fornitureweb`.`venta_producto` (`ven_cantidad`, `ven_cve_venta`, `pro_cve_producto`) VALUES (1, 4, 5);
INSERT INTO `fornitureweb`.`venta_producto` (`ven_cantidad`, `ven_cve_venta`, `pro_cve_producto`) VALUES (1, 4, 3);
INSERT INTO `fornitureweb`.`venta_producto` (`ven_cantidad`, `ven_cve_venta`, `pro_cve_producto`) VALUES (1, 5, 2);
INSERT INTO `fornitureweb`.`venta_producto` (`ven_cantidad`, `ven_cve_venta`, `pro_cve_producto`) VALUES (1, 6, 4);