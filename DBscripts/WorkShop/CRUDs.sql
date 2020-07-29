--Workshop CRUDs-----------------------------------------------------------------------

USE [Workshop];
GO

IF OBJECT_ID('[dbo].[sp_read_job]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_read_job] 
END 
GO
CREATE PROC [dbo].[sp_read_job] 
    @idJob tinyint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [idJob], [name], [description], [enable]
	FROM   [dbo].[Job]
	WHERE  ([idJob] = @idJob OR @idJob IS NULL) 

	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_create_job]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_create_job] 
END 
GO
CREATE PROC [dbo].[sp_create_job] 
    @idJob tinyint,
    @name nvarchar(50),
    @description nvarchar(100),
    @enable bit
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Job] ([idJob], [name], [description], [enable])
	SELECT @idJob, @name, @description, @enable
	
	
	SELECT [idJob], [name], [description], [enable]
	FROM   [dbo].[Job]
	WHERE  [idJob] = @idJob
	
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_update_job]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_update_job] 
END 
GO
CREATE PROC [dbo].[sp_update_job] 
    @idJob tinyint,
    @name nvarchar(50),
    @description nvarchar(100),
    @enable bit
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Job]
	SET    [name] = @name, [description] = @description, [enable] = @enable
	WHERE  [idJob] = @idJob
	
	
	SELECT [idJob], [name], [description], [enable]
	FROM   [dbo].[Job]
	WHERE  [idJob] = @idJob	
	

	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_delete_job]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_delete_job] 
END 
GO
CREATE PROC [dbo].[sp_delete_job] 
    @idJob tinyint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Job]
	WHERE  [idJob] = @idJob

	COMMIT
GO
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

USE [Workshop];
GO

IF OBJECT_ID('[dbo].[sp_read_category]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_read_category] 
END 
GO
CREATE PROC [dbo].[sp_read_category] 
    @idCategory tinyint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [idCategory], [name], [description], [enable] 
	FROM   [dbo].[Category] 
	WHERE  ([idCategory] = @idCategory OR @idCategory IS NULL) 

	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_create_category]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_create_category] 
END 
GO
CREATE PROC [dbo].[sp_create_category] 
    @idCategory tinyint,
    @name nvarchar(50),
    @description nvarchar(100),
    @enable bit
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Category] ([idCategory], [name], [description], [enable])
	SELECT @idCategory, @name, @description, @enable
	
	
	SELECT [idCategory], [name], [description], [enable]
	FROM   [dbo].[Category]
	WHERE  [idCategory] = @idCategory
	
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_update_category]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_update_category] 
END 
GO
CREATE PROC [dbo].[sp_update_category] 
    @idCategory tinyint,
    @name nvarchar(50),
    @description nvarchar(100),
    @enable bit
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Category]
	SET    [name] = @name, [description] = @description, [enable] = @enable
	WHERE  [idCategory] = @idCategory
	
	
	SELECT [idCategory], [name], [description], [enable]
	FROM   [dbo].[Category]
	WHERE  [idCategory] = @idCategory	
	

	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_delete_category]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_delete_category] 
END 
GO
CREATE PROC [dbo].[sp_delete_category] 
    @idCategory tinyint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Category]
	WHERE  [idCategory] = @idCategory

	COMMIT
GO
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

USE [Workshop];
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

	SELECT [idProduct], [idCategory], [name], [description], [manufacturingDate], [productionCost], [finalCost], [enable] 
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
    @idCategory tinyint,
    @name nvarchar(100),
    @description nvarchar(200),
    @manufacturingDate date,
    @productionCost money,
    @finalCost money,
    @enable bit
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Product] ([idProduct], [idCategory], [name], [description], [manufacturingDate], [productionCost], [finalCost], [enable])
	SELECT @idProduct, @idCategory, @name, @description, @manufacturingDate, @productionCost, @finalCost, @enable
	
	
	SELECT [idProduct], [idCategory], [name], [description], [manufacturingDate], [productionCost], [finalCost], [enable]
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
    @idCategory tinyint,
    @name nvarchar(100),
    @description nvarchar(200),
    @manufacturingDate date,
    @productionCost money,
    @finalCost money,
    @enable bit
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Product]
	SET    [idCategory] = @idCategory, [name] = @name, [description] = @description, [manufacturingDate] = @manufacturingDate, [productionCost] = @productionCost, [finalCost] = @finalCost, [enable] = @enable
	WHERE  [idProduct] = @idProduct
	
	
	SELECT [idProduct], [idCategory], [name], [description], [manufacturingDate], [productionCost], [finalCost], [enable]
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
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
--Product------------------------------------------------------------------------------

USE [Workshop];
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

	SELECT [idProduct], [idCategory], [name], [description], [photo], [manufacturingDate], [productionCost], [finalCost], [enable]
	FROM   [dbo].[Product] 
	WHERE  ([idProduct] = @idProduct OR @idProduct IS NULL) 

	COMMIT
GO

IF OBJECT_ID('[dbo].[sp_read_product_by_category]') IS NOT NULL
    BEGIN
        DROP PROC [dbo].[sp_read_product_by_category]
    END
GO
CREATE PROC [dbo].[sp_read_product_by_category]
@idCategory bigint
AS
    SET NOCOUNT ON
    SET XACT_ABORT ON

    BEGIN TRAN

SELECT [idProduct], [idCategory], [name], [description], [photo], [manufacturingDate], [productionCost], [finalCost], [enable]
FROM   [dbo].[Product]
WHERE  ([idProduct] = @idCategory OR @idCategory IS NULL)

    COMMIT
GO


IF OBJECT_ID('[dbo].[sp_create_product]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_create_product] 
END 
GO
CREATE PROC [dbo].[sp_create_product] 
    @idProduct bigint,
    @idCategory tinyint,
    @name nvarchar(100),
    @description nvarchar(300),
    @photo nvarchar(200),
    @manufacturingDate date,
    @productionCost money,
    @finalCost money,
    @enable bit
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Product] ([idProduct], [idCategory], [name], [description],[photo], [manufacturingDate], [productionCost], [finalCost], [enable])
	SELECT @idProduct, @idCategory, @name, @description, @photo, @manufacturingDate, @productionCost, @finalCost, @enable
	
	-- Begin Return Select <- do not remove
	SELECT [idProduct], [idCategory], [name], [description], [photo],[manufacturingDate], [productionCost], [finalCost], [enable]
	FROM   [dbo].[Product]
	WHERE  [idProduct] = @idProduct
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_update_product]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_update_product] 
END 
GO
CREATE PROC [dbo].[sp_update_product] 
    @idProduct bigint,
    @idCategory tinyint,
    @name nvarchar(100),
    @description nvarchar(300),
    @photo varchar(200),
    @manufacturingDate date,
    @productionCost money,
    @finalCost money,
    @enable bit
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Product]
	SET    [idCategory] = @idCategory, [name] = @name, [description] = @description, [photo] = @photo, [manufacturingDate] = @manufacturingDate, [productionCost] = @productionCost, [finalCost] = @finalCost, [enable] = @enable
	WHERE  [idProduct] = @idProduct
	
	-- Begin Return Select <- do not remove
	SELECT [idProduct], [idCategory], [name], [description], [manufacturingDate], [productionCost], [finalCost], [enable]
	FROM   [dbo].[Product]
	WHERE  [idProduct] = @idProduct	
	-- End Return Select <- do not remove

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
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

--Subsidiary-------------------------------------------------------------------------------
USE [Workshop];
GO

IF OBJECT_ID('[dbo].[sp_read_subsidiary]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_read_subsidiary] 
END 
GO
CREATE PROC [dbo].[sp_read_subsidiary] 
    @idSubsidiary smallint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [idSubsidiary], [name], [address], [provincia] 
	FROM   [dbo].[Subsidiary] 
	WHERE  ([idSubsidiary] = @idSubsidiary OR @idSubsidiary IS NULL) 

	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_create_subsidiary]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_create_subsidiary] 
END 
GO
CREATE PROC [dbo].[sp_create_subsidiary] 
    @idSubsidiary smallint,
    @name nvarchar(100),
    @address geography,
    @provincia varchar(50)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Subsidiary] ([idSubsidiary], [name], [address], [provincia])
	SELECT @idSubsidiary, @name, @address, @provincia
	
	
	SELECT [idSubsidiary], [name], [address], [provincia]
	FROM   [dbo].[Subsidiary]
	WHERE  [idSubsidiary] = @idSubsidiary
	
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_update_subsidiary]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_update_subsidiary] 
END 
GO
CREATE PROC [dbo].[sp_update_subsidiary] 
    @idSubsidiary smallint,
    @name nvarchar(100),
    @address geography,
    @provincia varchar(50)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Subsidiary]
	SET    [name] = @name, [address] = @address, [provincia] = @provincia
	WHERE  [idSubsidiary] = @idSubsidiary
	

	SELECT [idSubsidiary], [name], [address], [provincia]
	FROM   [dbo].[Subsidiary]
	WHERE  [idSubsidiary] = @idSubsidiary	


	COMMIT
GO
IF OBJECT_ID('[dbo].[sp_delete_subsidiary]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[sp_delete_subsidiary] 
END 
GO
CREATE PROC [dbo].[sp_delete_subsidiary] 
    @idSubsidiary smallint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Subsidiary]
	WHERE  [idSubsidiary] = @idSubsidiary

	COMMIT
GO
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------


