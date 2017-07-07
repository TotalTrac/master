SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ServiceCreate] 
	@Name			nvarchar(100)
	, @PriceMinimum	decimal(18, 2) = NULL
	, @RunRate		int = NULL
	, @ThirdParty	bit
	, @TypeID		int
	, @UnitPrice	decimal(18, 5) = NULL
AS
BEGIN
	
	INSERT [Services]
	(
		[SERVICE_NAME],
		SERVICE_PRICEMINIMUM,
		SERVICE_RUNRATE,
		SERVICE_THIRDPARTY,
		SERVICE_TYPEID,
		SERVICE_UNITPRICE
	)
	OUTPUT		
		inserted.SERVICE_ID AS ID, inserted.SERVICE_ROWVERSION AS [VERSION]
	VALUES
	(
		@Name,
		@PriceMinimum,
		@RunRate,
		@ThirdParty,
		@TypeID,
		@UnitPrice
	);
END
GO