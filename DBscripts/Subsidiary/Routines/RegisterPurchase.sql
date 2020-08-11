-- USE [Subsidiary_Alajuela]
-- GO

/****** Object:  StoredProcedure [dbo].[RegisterPurchase]    Script Date: 09/08/2020 20:49:09 ******/
-- DROP PROCEDURE [dbo].[RegisterPurchase]
-- GO

/****** Object:  StoredProcedure [dbo].[RegisterPurchase]    Script Date: 09/08/2020 20:49:09 ******/
-- USE [Subsidiary_Alajuela]
-- GO
/** Object:  StoredProcedure [dbo].[RegisterPurchase]    Script Date: 10/08/2020 18:34:56 **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[RegisterPurchase]
    @user bigint,
        @employee int,
        @detail varchar(100),
        @discount decimal(9, 2)
    AS
    BEGIN
        BEGIN TRY
            BEGIN TRANSACTION
                DECLARE @id INT;
                SELECT @id = MAX(idPurchase) + 1 FROM [dbo].[Purchase]

                IF (@id IS NULL)
                    SET @id = 1;

                INSERT INTO [dbo].[Purchase](idPurchase, idUser, [date], idEmployee, tax, detail, discount)
                VALUES (@id, @user, GETDATE(), @employee, 0, @detail, @discount)
            COMMIT

            RETURN @id;
        END TRY
        BEGIN CATCH
            SELECT 'Subsidiary' + ERROR_MESSAGE()
            ROLLBACK
        END CATCH
    END

    --***********************************************************************************************--


/****** Object:  StoredProcedure [dbo].[RegisterPurchaseProduct]    Script Date: 09/08/2020 20:49:23 ******/
-- DROP PROCEDURE [dbo].[RegisterPurchaseProduct]
-- GO

/****** Object:  StoredProcedure [dbo].[RegisterPurchaseProduct]    Script Date: 09/08/2020 20:49:23 ******/
-- USE [Subsidiary_Alajuela]
-- GO

/****** Object:  StoredProcedure [dbo].[RegisterPurchaseProduct]    Script Date: 10/08/2020 13:18:23 ******/
-- DROP PROCEDURE [dbo].[RegisterPurchaseProduct]
-- GO

/** Object:  StoredProcedure [dbo].[RegisterPurchaseProduct]    Script Date: 10/08/2020 18:37:20 **/
    SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[RegisterPurchaseProduct]
    @purchase int,
        @products varchar(max),
        @coupon decimal(9, 2)
    AS
    SET NOCOUNT ON
    SET XACT_ABORT ON
    BEGIN TRAN
    DECLARE
        @params TABLE
                (
                    _value1 int,
                    _value2 int,
                    _value3 int,
                    _value4 int
                );

    INSERT INTO @params
    SELECT __row._value1, @purchase, __row._value2, [dbo].[GetCost](@coupon, __row._value2, __row._value1) as cost
    FROM STRING_SPLIT(@products, '_') _row
             CROSS APPLY [dbo].[Split](_row.value, ':') __row
    INSERT INTO [dbo].[PurchaseProduct] ([idProduct], [idPurchase], [quantity], [subtotal])
    SELECT _value1, _value2, _value3, _value4
    FROM @params

    -- Begin Return Select <- do not remove
--     SELECT [idPurchaseProduct], [idProduct], [idPurchase], [quantity], [subtotal]
--     FROM   [dbo].[PurchaseProduct]
    -- End Return Select <- do not remove

    COMMIT
    --***********************************************************************************************--

/****** Object:  UserDefinedFunction [dbo].[Split]    Script Date: 09/08/2020 20:50:09 ******/
-- DROP FUNCTION [dbo].[Split]
-- GO

/****** Object:  UserDefinedFunction [dbo].[Split]    Script Date: 09/08/2020 20:50:09 ******/
    SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[Split](@string0 VARCHAR(MAX), @Delimiter CHAR(1))
    RETURNS @result TABLE
                    (
                        _value1 INT,
                        _value2 INT
                    )
AS
BEGIN
    DECLARE @string1 NVARCHAR(255)
    DECLARE @pos INT

    SELECT @pos = CHARINDEX(@Delimiter, @string0)
    SELECT @string1 = SUBSTRING(@string0, 1, @pos - 1)

    SELECT @string0 = SUBSTRING(@string0, @pos + 1, LEN(@string0) - @pos)

    INSERT INTO @result VALUES (@string1, @string0)

    RETURN
END
GO


-- USE [Subsidiary_Alajuela]
-- GO

/****** Object:  UserDefinedFunction [dbo].[GetCost]    Script Date: 10/08/2020 13:20:26 ******/
-- DROP FUNCTION [dbo].[GetCost]
-- GO

/****** Object:  UserDefinedFunction [dbo].[GetCost]    Script Date: 10/08/2020 13:20:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[GetCost](@coupon decimal(9, 2),
                                @amount int,
                                @product bigint)
    RETURNS MONEY
AS
BEGIN
    DECLARE @sale decimal(9, 2), @result money;
    SELECT @sale = salePercentage FROM Sale WHERE idProduct = @product AND [enable] = 1
    IF (@sale IS NULL)
        SET @sale = 0;
    SELECT @result = finalCost * @amount * (1 - @coupon / 100 - @sale / 100 + 0.13)
    FROM Product
    WHERE idProduct = @product

    RETURN @result;
END

GO









