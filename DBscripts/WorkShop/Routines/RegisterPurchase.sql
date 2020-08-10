USE [Workshop]
GO

/** Object:  StoredProcedure [dbo].[RegisterPurchase]    Script Date: 08/08/2020 18:54:20 **/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RegisterPurchase] @user bigint,
                                          @subsidiary smallint
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
            DECLARE @distance FLOAT;
            IF (@subsidiary IS NULL)
                BEGIN
                    DECLARE @user_address GEOGRAPHY, @Lat int, @Lon int, @sql NVARCHAR(MAX);
                    DECLARE @geo TABLE
                                 (
                                     Lo int,
                                     La int
                                 );
                    SET @sql = 'SELECT * FROM OPENQUERY(CUSTOMER_SERVICE, ''call GetLocation(' +
                               CAST(@user AS NVARCHAR(50)) + ')'')';
                    INSERT INTO @geo EXEC (@sql);
                    SELECT @Lat = La, @Lon = Lo FROM @geo
                    SET @user_address =
                            geography::STGeomFromText('POINT(' + CAST(@Lon AS VARCHAR(20)) + ' ' + CAST(@Lat AS VARCHAR(20)) + ')', 4326);
                    SELECT TOP 1 @subsidiary = [idSubsidiary], @distance = [address].STDistance(@user_address)
                    FROM [dbo].[Subsidiary]
                    ORDER BY [address].STDistance(@user_address) ASC;
                END

            IF (@subsidiary = 1)
                EXEC Subsidiary_Alajuela.dbo.RegisterPurchase @user, NULL, 1, '';
            IF (@subsidiary = 2)
                EXEC Subsidiary_Alajuela.dbo.RegisterPurchase @user, NULL, 1, '';
            IF (@subsidiary = 3)
                EXEC Subsidiary_Alajuela.dbo.RegisterPurchase @user, NULL, 1, '';
        COMMIT
    END TRY
    BEGIN CATCH
        SELECT ERROR_MESSAGE()
        ROLLBACK
    END CATCH
END
GO