INSERT INTO [User] (idUser, name, lastname, address)
VALUES (1, 'juanpa', 'martinez', geography::Point(9.867027, -83.937984, 4326));

INSERT INTO Employee (idEmployee, [user], photo)
VALUES (1, 1, '')


-----------

USE [Subsidiary_Cartago]
GO

INSERT INTO [dbo].[PaymentMethod]
( [idPaymentMethod]
, [name]
, [detail]
, [enable])
VALUES (1, 'Tarjeta de credito', 'Pago con tarjeta de credito ', 1)
GO


INSERT INTO [dbo].[PaymentStatus]
( [idPaymentStatus]
, [name]
, [description]
, [enable])
VALUES (1, 'Procesado', 'Pago procesado', 1)
GO


INSERT INTO [dbo].[Sale]
([idSale]
,[idProduct]
,[salePercentage]
,[expirationDate]
,[description]
,[enable])
VALUES
(1
,1
,5.0
,'2020-09-08'
,'Rebaja de mueble'
,1)
GO

INSERT INTO [dbo].[UserPaymentMethod]
([idUserPayment]
,[idPaymentMethod]
,[detail]
,[enable])
VALUES
(1
,1
,'Tarjeta de credito'
,1)
GO

INSERT INTO [dbo].[Payment]
([idPayment]
,[date]
,[result]
,[transaction]
,[amount]
,[idPaymentStatus]
,[idPaymentMethod])
VALUES
(1
,'2020-11-01'
,'Ejecutado'
,1
,30120.05
,1
,1)
GO


-- STOCK

INSERT INTO [dbo].[Stock]
([idStock]
,[idProduct]
,[quantity])
VALUES
(1,1,32),(2,1,15),(3,1,16),(4,2,12),(5,2,3),(6,2,14),
(7,3,17),(8,3,2),(9,3,22),(10,4,13),(11,4,32),(12,4,16),
(13,5,18),(14,5,39),(15,5,12),(16,6,1),(17,6,14),(18,6,32),
(19,7,36),(20,7,14),(21,7,14),(22,8,12),(23,8,32),(24,8,1)
GO