CREATE PROCEDURE [dbo].[UpdateStock] @product bigint,
                                     @value int
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
            UPDATE Stock
            SET quantity = quantity - @value
            WHERE idProduct = @product

            EXEC Workshop.dbo.UpdateStock @product, @value
        COMMIT
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE()
        ROLLBACK
    END CATCH
END