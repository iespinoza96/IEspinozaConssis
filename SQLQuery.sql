CREATE DATABASE IEspinozaConssis
GO
USE IEspinozaConssis
GO
CREATE TABLE Productos
(IdProducto int Primary Key IDENTITY (1,1),
Descripcion varchar(50),
PrecioUnitario money
)
insert into Productos Values('CocaCola',15)
insert into Productos Values('Pepsi',12)
insert into Productos Values('Jarrito',10)
GO
CREATE TABLE Proveedores
(IdProveedor int Primary key identity,
RazonSocial varchar(50),
Direccion varchar(100),
Telefono varchar(20)
)
insert into Proveedores Values('CocaCola','direccion','1111')
insert into Proveedores Values('Pepsi','direccion', '222')
insert into Proveedores Values('Jarrito','direccion', '33333')

GO
CREATE TABLE Facturas
(FolioFactura varchar(10) primary key,
Fecha datetime,
IdProveedor int FOREIGN KEY REFERENCES Proveedores(IdProveedor),
)
insert into Facturas values ('folio01',GETDATE(),1)
insert into Facturas values ('folio02',GETDATE(),2)
insert into Facturas values ('folio03',GETDATE(),1)
GO
CREATE TABLE DetalleFacruras
(FolioFactira varchar(10) FOREIGN KEY REFERENCES Facturas(FolioFactura),
IdProducto int FOREIGN KEY REFERENCES Productos(IdProducto),
Cantidad int
)
insert into DetalleFacruras values ('Folio01',1,5)
insert into DetalleFacruras values ('Folio02',2,5)
insert into DetalleFacruras values ('Folio03',3,5)
GO

SELECT 
	Facturas.Fecha,
	Proveedores.RazonSocial,
	Proveedores.Direccion,
	Proveedores.Telefono
FROM Proveedores
	INNER JOIN Facturas ON Proveedores.IdProveedor = Facturas.IdProveedor
Where 
	Facturas.FolioFactura between 'Folio01' and 'Folio02'

SELECT
	DetalleFacruras.IdProducto,
	DetalleFacruras.Cantidad,
	Productos.Descripcion,
	Productos.PrecioUnitario,
	(DetalleFacruras.Cantidad * Productos.PrecioUnitario) as Importe
FROM DetalleFacruras 
	INNER JOIN Productos ON Productos.IdProducto = DetalleFacruras.IdProducto
WHERE 
	DetalleFacruras.FolioFactira='Folio02'

SELECT 
	(DetalleFacruras.Cantidad*Productos.PrecioUnitario) AS Importe
FROM DetalleFacruras
	INNER JOIN Productos ON DetalleFacruras.IdProducto = PRODUCTOS.IdProducto
WHERE 
	DetalleFacruras.FolioFactira BETWEEN 'Folio01' and 'Folio02'

SELECT 
	Proveedores.IdProveedor, 
	Proveedores.RazonSocial, 
	SUM(Productos.PrecioUnitario*DetalleFacruras.Cantidad) AS Importe
FROM Proveedores
	INNER JOIN Facturas ON Facturas.IdProveedor = Proveedores.IdProveedor
	INNER JOIN DetalleFacruras ON DetalleFacruras.FolioFactira = FACTURAS.FolioFactura
	INNER JOIN Productos ON Productos.IdProducto = DetalleFacruras.IdProducto
GROUP BY 
	Proveedores.IdProveedor, Proveedores.RazonSocial