SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[ServiceUpdate]
	@ID int 
	, @Name NVarChar(100)
	, @PriceMinimum decimal(18, 2) = NULL
	, @RunRate int = NULL
	, @ThirdParty bit
	, @TypeID int
	, @UnitPrice decimal(18, 5) = NULL
	, @Version timestamp
AS
BEGIN
		
	UPDATE [Services]
	SET
		[SERVICE_NAME] = @Name,
		SERVICE_PRICEMINIMUM = @PriceMinimum,
		SERVICE_RUNRATE = @RunRate,
		SERVICE_THIRDPARTY = @ThirdParty,
		SERVICE_TYPEID = @TypeID,
		SERVICE_UNITPRICE = @UnitPrice
	OUTPUT		
		inserted.SERVICE_ID AS ID, inserted.SERVICE_ROWVERSION AS [VERSION]
	WHERE
		(SERVICE_ID = @ID) AND
		(SERVICE_ROWVERSION = @Version);
END
GO