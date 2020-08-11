SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
    ALTER PROCEDURE [dbo].[RegisterPurchase]
        @user bigint,
        @subsidiary smallint,
        @products varchar(max),
        @coupon nvarchar(max)
    AS
    BEGIN
        BEGIN TRY

                DECLARE @distance FLOAT, @sql NVARCHAR(MAX);

                DECLARE @temCoupon decimal(9,2);
                SET @temCoupon = CAST(@coupon AS decimal(9,2));

                IF (@subsidiary IS NULL)
                    BEGIN
                        DECLARE @user_address GEOGRAPHY, @Lat INT, @Lon INT, @purchase INT;
                        DECLARE @geo TABLE(Lo int, La int);
                        SET @sql = 'SELECT * FROM OPENQUERY(CUSTOMER_SERVICE, ''call GetLocation(' + CAST(@user AS NVARCHAR(50)) + ')'')';
                        INSERT INTO @geo EXEC (@sql);
                        SELECT @Lat = La, @Lon = Lo FROM @geo
                        SET @user_address = geography::STGeomFromText('POINT(' + CAST(@Lon AS VARCHAR(20)) + ' ' + CAST(@Lat AS VARCHAR(20)) + ')', 4326);
                        SELECT TOP 1 @subsidiary = [idSubsidiary], @distance = [address].STDistance(@user_address)
                        FROM [dbo].[Subsidiary]
                        ORDER BY [address].STDistance(@user_address) ASC;
                    END

                IF (@subsidiary = 1)
                    EXEC @purchase = Subsidiary_Cartago.dbo.RegisterPurchase @user, NULL,  '', @temCoupon;
                IF (@subsidiary = 2)
                    EXEC @purchase = Subsidiary_SanJose.dbo.RegisterPurchase @user, NULL,  '', @temCoupon;
                IF (@subsidiary = 3)
                    EXEC @purchase = Subsidiary_Alajuela.dbo.RegisterPurchase @user, NULL,  '', @temCoupon;

                IF (@subsidiary = 1)
                    EXEC Subsidiary_Cartago.dbo.RegisterPurchaseProduct @purchase, @products, @temCoupon;
                IF (@subsidiary = 2)
                    EXEC Subsidiary_Cartago.dbo.RegisterPurchaseProduct @purchase, @products, @temCoupon;
                IF (@subsidiary = 3)
                    EXEC Subsidiary_Cartago.dbo.RegisterPurchaseProduct @purchase, @products, @temCoupon;


            SELECT @subsidiary AS 'idSubsidiary';
        END TRY
        BEGIN CATCH
            SELECT 'Workshop: ' + ERROR_MESSAGE()
        END CATCH
    END

--
--        EXEC RegisterPurchase @user = 6, @subsidiary=null, @products = '1:2_2:2_3:3', @coupon= '3.5';
--        EXEC RegisterPayment   @idPurchase=1, @amount=5000, @idPaymentMethod=1, @idSubsidiary=1;







