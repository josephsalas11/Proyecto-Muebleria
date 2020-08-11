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