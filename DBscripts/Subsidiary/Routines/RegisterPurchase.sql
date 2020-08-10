-- USE [Subsidiary_Alajuela]
-- GO

/** Object:  StoredProcedure [dbo].[RegisterPurchase]    Script Date: 08/08/2020 18:54:59 **/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RegisterPurchase]
    @user bigint,
    @employee int,
    @payment int,
    @detail varchar(100)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION

            DECLARE @id INT;
            SELECT @id = MAX(idPurchase) FROM [dbo].[Purchase]

            IF (@id IS NULL)
                SET @id = 1;

            INSERT INTO [dbo].[Purchase](idPurchase, idUser, [date], idEmployee, idPayment, tax, detail)
            VALUES (@id, @user, GETDATE(), @employee, @payment, 0, @detail)

        COMMIT
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE()
        ROLLBACK
    END CATCH
END
GO