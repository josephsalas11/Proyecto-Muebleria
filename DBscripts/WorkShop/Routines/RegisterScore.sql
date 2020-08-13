ALTER PROCEDURE [dbo].[RegisterScore]
    @subsidiary smallint,
    @comment varchar(100),
    @value tinyint
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION

            DECLARE @delivery int;
            SET @delivery =(SELECT max(idDelivery) FROM Delivery)

            IF (@subsidiary = 1)
                EXEC Subsidiary_Cartago.dbo.RegisterScore @delivery, @comment, @value;
            IF (@subsidiary = 2)
                EXEC Subsidiary_SanJose.dbo.RegisterScore @delivery, @comment, @value;
            IF (@subsidiary = 3)
                EXEC Subsidiary_Alajuela.dbo.RegisterScore @delivery, @comment, @value;

        COMMIT
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE()
        ROLLBACK
    END CATCH
END
GO