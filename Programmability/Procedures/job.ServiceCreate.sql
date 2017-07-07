SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[ServiceCreate] 
	@Name			nvarchar(100)
	, @PriceMinimum	decimal(18, 2) = NULL
	, @RunRate		int = NULL
	, @ThirdParty	bit
	, @TypeID		INT
  , @Unit     INT
	, @UnitPrice	decimal(18, 5) = NULL
AS
BEGIN
	
	INSERT job.[Services]
	(
		[SERVICE_NAME],
		SERVICE_PRICEMINIMUM,
		SERVICE_RUNRATE,
		SERVICE_THIRDPARTY,
		SERVICE_TYPEID,
    SERVICE_UNIT,
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
    @Unit,
		@UnitPrice
	);
END
GO