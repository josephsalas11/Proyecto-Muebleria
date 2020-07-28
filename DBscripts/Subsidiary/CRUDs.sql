--CRUDs Subsidiary 

--Score------------------------------------------------------
CREATE PROCEDURE sp_create_score
(
	@idScore int, @comment varchar(100), @value tinyint
)
AS
BEGIN

    SET NOCOUNT ON

   
    INSERT INTO dbo.Score ([idScore],[comment],[value])
	VALUES (@idScore,@comment,@value)
END
GO


CREATE PROCEDURE sp_read_score
( @idScore int
)
AS
BEGIN

    SET NOCOUNT ON
   
    SELECT * FROM dbo.Score
    WHERE Score.idScore = @idScore
END
GO


CREATE PROCEDURE sp_update_score
( @idScore int, @comment varchar(100),@value tinyint
)
AS
BEGIN

    SET NOCOUNT ON
   
    UPDATE Score
	SET idScore = @idScore,
	comment = @comment,
	value = @value
	WHERE idScore = @idScore
END
GO

CREATE PROCEDURE sp_delete_score
( @idScore int
)
AS
BEGIN

    SET NOCOUNT ON
   
	DELETE FROM Score
	WHERE idScore = @idScore
END
GO
-----------------------------------------------------------

--Stock----------------------------------------------------

CREATE PROCEDURE sp_create_stock
(
	@idStock int, @idProduct bigint, @quantity int
)
AS
BEGIN

    SET NOCOUNT ON

   
    INSERT INTO dbo.Stock([idStock],[idProduct],[quantity])
	VALUES (@idStock,@idProduct,@quantity)
END
GO


CREATE PROCEDURE sp_read_stock
(
	@idStock int
)
AS
BEGIN

    SET NOCOUNT ON

   
    SELECT * FROM Stock WHERE idStock = @idStock
END
GO

CREATE PROCEDURE sp_update_stock
( @idStock int, @idProduct bigint,@quantity int
)
AS
BEGIN

    SET NOCOUNT ON
   
    UPDATE Stock
	SET idStock = @idStock,
	idProduct = @idProduct,
	quantity = @quantity
	WHERE idStock = @idStock
END
GO

CREATE PROCEDURE sp_delete_stock
( @idStock int
)
AS
BEGIN

    SET NOCOUNT ON
   
	DELETE FROM Stock
	WHERE idStock = @idStock
END
GO
----------------------------------------------------

--Sale---------------------------------------------

CREATE PROCEDURE sp_create_sale
(
	@idSale int, @idProduct bigint, @salePercentage decimal(9,2), @expirationDate date,
	@description varchar(100), @enable bit
)
AS
BEGIN

    SET NOCOUNT ON

   
    INSERT INTO dbo.Sale([idSale],[idProduct],[salePercentage],[expirationDate],[description],[enable])
	VALUES (@idSale,@idProduct,@salePercentage,@expirationDate,@description,@enable)
END
GO

CREATE PROCEDURE sp_read_sale
(
	@idSale int
)
AS
BEGIN

    SET NOCOUNT ON

   
    SELECT * FROM dbo.Sale WHERE idSale = @idSale
END
GO

CREATE PROCEDURE sp_update_sale
( @idSale int, @idProduct bigint, @salePercentage decimal(9,2), @expirationDate date,
	@description varchar(100), @enable bit
)
AS
BEGIN

    SET NOCOUNT ON
   
    UPDATE Sale
	SET idSale = @idSale,
	idProduct = @idProduct,
	salePercentage = @salePercentage,
	expirationDate = @expirationDate,
	description = @description,
	enable  = @enable
	WHERE idSale = @idSale
END
GO

CREATE PROCEDURE sp_delete_sale
( @idSale int
)
AS
BEGIN

    SET NOCOUNT ON
   
	DELETE FROM Sale
	WHERE idSale = @idSale
END
GO

--Delivery-------------------------------------------------------------------------
IF OBJECT_ID('[dbo].[sp_read_Delivery]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_read_Delivery] 
END 
GO
CREATE PROC [dbo].[sp_read_Delivery] 
    @idDelivery int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [idDelivery], [idPurchase], [idStatus], [shippingDate], [receptionDate], [active], [idScore] 
	FROM   [dbo].[Delivery] 
	WHERE  ([idDelivery] = @idDelivery OR @idDelivery IS NULL) 

	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_create_Delivery]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_create_Delivery] 
END 
GO
CREATE PROC [dbo].[sp_create_Delivery] 
    @idDelivery int,
    @idPurchase int,
    @idStatus tinyint,
    @shippingDate datetime,
    @receptionDate datetime,
    @active bit,
    @idScore int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Delivery] ([idDelivery], [idPurchase], [idStatus], [shippingDate], [receptionDate], [active], [idScore])
	SELECT @idDelivery, @idPurchase, @idStatus, @shippingDate, @receptionDate, @active, @idScore
	
	
	SELECT [idDelivery], [idPurchase], [idStatus], [shippingDate], [receptionDate], [active], [idScore]
	FROM   [dbo].[Delivery]
	WHERE  [idDelivery] = @idDelivery
	
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_update_Delivery]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_update_Delivery] 
END 
GO
CREATE PROC [dbo].[sp_update_Delivery] 
    @idDelivery int,
    @idPurchase int,
    @idStatus tinyint,
    @shippingDate datetime,
    @receptionDate datetime,
    @active bit,
    @idScore int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Delivery]
	SET    [idPurchase] = @idPurchase, [idStatus] = @idStatus, [shippingDate] = @shippingDate, [receptionDate] = @receptionDate, [active] = @active, [idScore] = @idScore
	WHERE  [idDelivery] = @idDelivery
	
	
	SELECT [idDelivery], [idPurchase], [idStatus], [shippingDate], [receptionDate], [active], [idScore]
	FROM   [dbo].[Delivery]
	WHERE  [idDelivery] = @idDelivery	
	

	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_delete_Delivery]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_delete_Delivery] 
END 
GO
CREATE PROC [dbo].[sp_delete_Delivery] 
    @idDelivery int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Delivery]
	WHERE  [idDelivery] = @idDelivery

	COMMIT
GO

--Product------------------------------------------------------------------------------
USE [Subsidiary];
GO

IF OBJECT_ID('[dbo].[sp_read_product]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_read_product] 
END 
GO
CREATE PROC [dbo].[sp_read_product] 
    @idProduct bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [idProduct], [name], [category], [description], [productionCost], [manufacturingDate], [finalCost], [enable] 
	FROM   [dbo].[Product] 
	WHERE  ([idProduct] = @idProduct OR @idProduct IS NULL) 

	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_create_product]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_create_product] 
END 
GO
CREATE PROC [dbo].[sp_create_product] 
    @idProduct bigint,
    @name nvarchar(100),
    @category nvarchar(50),
    @description nvarchar(200),
    @productionCost money,
    @manufacturingDate date,
    @finalCost money,
    @enable bit
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Product] ([idProduct], [name], [category], [description], [productionCost], [manufacturingDate], [finalCost], [enable])
	SELECT @idProduct, @name, @category, @description, @productionCost, @manufacturingDate, @finalCost, @enable
	
	
	SELECT [idProduct], [name], [category], [description], [productionCost], [manufacturingDate], [finalCost], [enable]
	FROM   [dbo].[Product]
	WHERE  [idProduct] = @idProduct
	
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_update_product]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_update_product] 
END 
GO
CREATE PROC [dbo].[sp_update_product] 
    @idProduct bigint,
    @name nvarchar(100),
    @category nvarchar(50),
    @description nvarchar(200),
    @productionCost money,
    @manufacturingDate date,
    @finalCost money,
    @enable bit
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Product]
	SET    [name] = @name, [category] = @category, [description] = @description, [productionCost] = @productionCost, [manufacturingDate] = @manufacturingDate, [finalCost] = @finalCost, [enable] = @enable
	WHERE  [idProduct] = @idProduct
	
	
	SELECT [idProduct], [name], [category], [description], [productionCost], [manufacturingDate], [finalCost], [enable]
	FROM   [dbo].[Product]
	WHERE  [idProduct] = @idProduct	
	

	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_delete_product]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_delete_product] 
END 
GO
CREATE PROC [dbo].[sp_delete_product] 
    @idProduct bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Product]
	WHERE  [idProduct] = @idProduct

	COMMIT
GO
---------------------------------------------------------------------------------------------------------

--Purshase----------------------------------------------------------------------------------------------

USE [Subsidiary];
GO

IF OBJECT_ID('[dbo].[sp_read_purchase]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_read_purchase] 
END 
GO
CREATE PROC [dbo].[sp_read_purchase] 
    @idPurchase int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [idPurchase], [idUser], [date], [idEmployee], [idPayment], [subTotal], [discount], [tax], [total], [detail] 
	FROM   [dbo].[Purchase] 
	WHERE  ([idPurchase] = @idPurchase OR @idPurchase IS NULL) 

	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_create_purchase]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_create_purchase] 
END 
GO
CREATE PROC [dbo].[sp_create_purchase] 
    @idPurchase int,
    @idUser bigint,
    @date datetime,
    @idEmployee int = NULL,
    @idPayment int,
    @subTotal money,
    @discount money,
    @tax money,
    @total money,
    @detail varchar(100) = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Purchase] ([idPurchase], [idUser], [date], [idEmployee], [idPayment], [subTotal], [discount], [tax], [total], [detail])
	SELECT @idPurchase, @idUser, @date, @idEmployee, @idPayment, @subTotal, @discount, @tax, @total, @detail
	
	
	SELECT [idPurchase], [idUser], [date], [idEmployee], [idPayment], [subTotal], [discount], [tax], [total], [detail]
	FROM   [dbo].[Purchase]
	WHERE  [idPurchase] = @idPurchase
	
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_update_purchase]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_update_purchase] 
END 
GO
CREATE PROC [dbo].[sp_update_purchase] 
    @idPurchase int,
    @idUser bigint,
    @date datetime,
    @idEmployee int = NULL,
    @idPayment int,
    @subTotal money,
    @discount money,
    @tax money,
    @total money,
    @detail varchar(100) = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Purchase]
	SET    [idUser] = @idUser, [date] = @date, [idEmployee] = @idEmployee, [idPayment] = @idPayment, [subTotal] = @subTotal, [discount] = @discount, [tax] = @tax, [total] = @total, [detail] = @detail
	WHERE  [idPurchase] = @idPurchase
	
	
	SELECT [idPurchase], [idUser], [date], [idEmployee], [idPayment], [subTotal], [discount], [tax], [total], [detail]
	FROM   [dbo].[Purchase]
	WHERE  [idPurchase] = @idPurchase	
	

	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_delete_purchase]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_delete_purchase] 
END 
GO
CREATE PROC [dbo].[sp_delete_purchase] 
    @idPurchase int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Purchase]
	WHERE  [idPurchase] = @idPurchase

	COMMIT
GO
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

--Payment-------------------------------------------------------------------------------
USE [Subsidiary];
GO

IF OBJECT_ID('[dbo].[sp_read_payment]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_read_payment] 
END 
GO
CREATE PROC [dbo].[sp_read_payment] 
    @idPayment int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [idPayment], [date], [codeResult], [result], [transaction], [response], [reference], [amount], [idPaymentStatus], [idPaymentMethod] 
	FROM   [dbo].[Payment] 
	WHERE  ([idPayment] = @idPayment OR @idPayment IS NULL) 

	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_create_payment]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_create_payment] 
END 
GO
CREATE PROC [dbo].[sp_create_payment] 
    @idPayment int,
    @date datetime,
    @codeResult tinyint,
    @result tinyint,
    @transaction bigint,
    @response nvarchar(MAX),
    @reference bigint,
    @amount money,
    @idPaymentStatus tinyint,
    @idPaymentMethod bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Payment] ([idPayment], [date], [codeResult], [result], [transaction], [response], [reference], [amount], [idPaymentStatus], [idPaymentMethod])
	SELECT @idPayment, @date, @codeResult, @result, @transaction, @response, @reference, @amount, @idPaymentStatus, @idPaymentMethod
	
	
	SELECT [idPayment], [date], [codeResult], [result], [transaction], [response], [reference], [amount], [idPaymentStatus], [idPaymentMethod]
	FROM   [dbo].[Payment]
	WHERE  [idPayment] = @idPayment
	
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_update_payment]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_update_payment] 
END 
GO
CREATE PROC [dbo].[sp_update_payment] 
    @idPayment int,
    @date datetime,
    @codeResult tinyint,
    @result tinyint,
    @transaction bigint,
    @response nvarchar(MAX),
    @reference bigint,
    @amount money,
    @idPaymentStatus tinyint,
    @idPaymentMethod bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Payment]
	SET    [date] = @date, [codeResult] = @codeResult, [result] = @result, [transaction] = @transaction, [response] = @response, [reference] = @reference, [amount] = @amount, [idPaymentStatus] = @idPaymentStatus, [idPaymentMethod] = @idPaymentMethod
	WHERE  [idPayment] = @idPayment
	

	SELECT [idPayment], [date], [codeResult], [result], [transaction], [response], [reference], [amount], [idPaymentStatus], [idPaymentMethod]
	FROM   [dbo].[Payment]
	WHERE  [idPayment] = @idPayment	
	

	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_delete_payment]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_delete_payment] 
END 
GO
CREATE PROC [dbo].[sp_delete_payment] 
    @idPayment int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Payment]
	WHERE  [idPayment] = @idPayment

	COMMIT
GO
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------


