USE [Workshop]
GO
/** Object:  StoredProcedure [dbo].[RegisterPurchase]    Script Date: 13/08/2020 12:13:12 **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].GetStock
 @user bigint
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

		DECLARE @distance FLOAT, @sql NVARCHAR(MAX), @subsidiary smallint;

		DECLARE @user_address GEOGRAPHY, @Lat INT, @Lon INT, @purchase INT;
		DECLARE @geo TABLE(Lo int, La int);
		SET @sql = 'SELECT * FROM OPENQUERY(CUSTOMER_SERVICE, ''call GetLocation(' + CAST(@user AS NVARCHAR(50)) + ')'')';
		INSERT INTO @geo EXEC (@sql);
		SELECT @Lat = La, @Lon = Lo FROM @geo
		SET @user_address = geography::STGeomFromText('POINT(' + CAST(@Lon AS VARCHAR(20)) + ' ' + CAST(@Lat AS VARCHAR(20)) + ')', 4326);
		SELECT TOP 1 @subsidiary = [idSubsidiary], @distance = [address].STDistance(@user_address)
		FROM [dbo].[Subsidiary]
		ORDER BY [address].STDistance(@user_address) ASC;

		Select idProduct, quantity FROM Stock WHERE idSubsidiary = @subsidiary


		COMMIT
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE()
		ROLLBACK
	END CATCH
END



EXEC GetStock @user = 8;