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
                DECLARE @result varchar(MAX);
                DECLARE @userID varchar(50);

                SET @result = 'SELECT * FROM OPENQUERY(CUSTOMER_SERVICE, ''call create_account(''''' + @p_name +
                              ''''',''''' + @p_lastname + ''''',''''' + @p_birthdate + ''''',''''' + @p_address +
                              ''''',''''' + @p_email + ''''',''''' + @p_username + ''''',''''' + @p_password +
                              ''''')'')';
                EXEC (@result);

                SET @userID = (SELECT * FROM OPENQUERY(CUSTOMER_SERVICE, 'SELECT MAX(idUser) FROM `user`'))

                EXEC [Subsidiary_Alajuela].dbo.sp_create_user @userID, @p_name, @p_lastname, null;
                EXEC [Subsidiary_SanJose].dbo.sp_create_user @userID, @p_name, @p_lastname, null;
                EXEC [Subsidiary_Cartago].dbo.sp_create_user @userID, @p_name, @p_lastname, null;

        END TRY
        BEGIN CATCH
            SELECT ERROR_MESSAGE()
        END CATCH
    END


    EXEC create_account 'name', 'lastname', '1995-08-01', 'Tejar', 'mperez@gmail.com', 'username', 'password';
--     EXEC create_account @p_name = 'juanpa', @p_lastname = 'martinez', @p_birthdate = '2020-8-4', @p_address= 'Tejar', @p_email='jpmb1220@gmail.com', @p_username = 'username', @p_password = 'password'