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
( [idSale]
, [idProduct]
, [salePercentage]
, [expirationDate]
, [description]
, [enable])
VALUES ( 1
       , 1
       , 5.0
       , '2020-09-08'
       , 'Rebaja de mueble'
       , 1)
GO

INSERT INTO [dbo].[UserPaymentMethod]
( [idUserPayment]
, [idPaymentMethod]
, [detail]
, [enable])
VALUES ( 1
       , 1
       , 'Tarjeta de credito'
       , 1)
GO

INSERT INTO [dbo].[Payment]
( [idPayment]
, [date]
, [result]
, [transaction]
, [amount]
, [idPaymentStatus]
, [idPaymentMethod])
VALUES ( 1
       , '2020-11-01'
       , 'Ejecutado'
       , 1
       , 30120.05
       , 1
       , 1)
GO


-- STOCK

-- Cartago
INSERT INTO [dbo].[Stock]
( [idStock]
, [idProduct]
, [quantity])
VALUES (1, 1, 32),
       (2, 2, 15),
       (3, 3, 16),
       (4, 4, 12),
       (5, 5, 3),
       (6, 6, 14),
       (7, 7, 17),
       (8, 8, 2),
       (9, 9, 22),
       (10, 10, 13),
       (11, 11, 32),
       (12, 12, 16),
       (13, 13, 18),
       (14, 14, 39),
       (15, 15, 12),
       (16, 16, 1),
       (17, 17, 14),
       (18, 18, 32),
       (19, 19, 36),
       (20, 20, 14),
       (21, 21, 14),
       (22, 22, 12),
       (23, 23, 32),
       (24, 24, 0),
       (25, 25, 23),
       (26, 26, 54),
       (27, 27, 0),
       (28, 28, 12),
       (29, 29, 5),
       (30, 30, 9),
       (31, 31, 9),
       (32, 32, 2)
GO

-- San Jose
INSERT INTO [dbo].[Stock]
( [idStock]
, [idProduct]
, [quantity])
VALUES (1, 1, 32),
       (2, 2, 15),
       (3, 3, 16),
       (4, 4, 12),
       (5, 5, 3),
       (6, 6, 14),
       (7, 7, 17),
       (8, 8, 2),
       (9, 9, 22),
       (10, 10, 13),
       (11, 11, 32),
       (12, 12, 16),
       (13, 13, 18),
       (14, 14, 39),
       (15, 15, 12),
       (16, 16, 1),
       (17, 17, 14),
       (18, 18, 32),
       (19, 19, 36),
       (20, 20, 14),
       (21, 21, 14),
       (22, 22, 12),
       (23, 23, 32),
       (24, 24, 0),
       (25, 25, 23),
       (26, 26, 54),
       (27, 27, 0),
       (28, 28, 12),
       (29, 29, 5),
       (30, 30, 9),
       (31, 31, 9),
       (32, 32, 2)
GO


--Alajuela
INSERT INTO [dbo].[Stock]
( [idStock]
, [idProduct]
, [quantity])
VALUES (1, 1, 32),
       (2, 2, 15),
       (3, 3, 16),
       (4, 4, 12),
       (5, 5, 3),
       (6, 6, 14),
       (7, 7, 17),
       (8, 8, 2),
       (9, 9, 22),
       (10, 10, 13),
       (11, 11, 32),
       (12, 12, 16),
       (13, 13, 18),
       (14, 14, 39),
       (15, 15, 12),
       (16, 16, 1),
       (17, 17, 14),
       (18, 18, 32),
       (19, 19, 36),
       (20, 20, 14),
       (21, 21, 14),
       (22, 22, 12),
       (23, 23, 32),
       (24, 24, 0),
       (25, 25, 23),
       (26, 26, 54),
       (27, 27, 0),
       (28, 28, 12),
       (29, 29, 5),
       (30, 30, 9),
       (31, 31, 9),
       (32, 32, 2)
GO