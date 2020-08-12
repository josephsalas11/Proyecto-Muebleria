CREATE PROCEDURE GetUserContact
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
            SELECT * FROM OPENQUERY(CUSTOMER_SERVICE, 'call GetUserContact()');
        COMMIT
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE()
        ROLLBACK
    END CATCH
END


EXEC GetUserContact;