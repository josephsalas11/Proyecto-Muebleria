USE [Workshop]
GO
/** Object:  StoredProcedure [dbo].[create_account]    Script Date: 09/08/2020 23:58:02 **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[create_account] @p_name varchar(50),@p_lastname varchar(50),@p_birthdate varchar(50), @p_address varchar(50),
    @p_email varchar(50),@p_username varchar(50), @p_password varchar(50)
    AS
    BEGIN
        BEGIN TRY
            BEGIN TRANSACTION account
                DECLARE @result varchar(MAX);
                SET @result = 'SELECT * FROM OPENQUERY(CUSTOMER_SERVICE, ''call create_account('''''+@p_name+''''','''''+@p_lastname+''''','''''+@p_birthdate+''''','''''+@p_address+''''','''''+@p_email+''''','''''+@p_username+''''','''''+@p_password+''''')'')';
                EXEC (@result);

            COMMIT TRANSACTION account
        END TRY
        BEGIN CATCH
            SELECT ERROR_MESSAGE()
            ROLLBACK TRANSACTION account
        END CATCH
    END



--     EXEC create_account @p_name = 'pablo',
--          @p_lastname = 'martinez',
--          @p_birthdate = '2020-01-01',
--          @p_address = 'Tejar',
--          @p_email = 'pmartinez@gamil.com',
--          @p_username = 'pablo123',
--          @p_password = 'pablo321';
--
--
--     EXEC create_account 'Marco', 'Perez', '1995-08-01', 'Tejar', 'mperez@gmail.com', 'mperez', 'mp1234';