SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[EstimateServiceItemCreate]
	@EstimateID			int
	, @Description		nvarchar(100)
	, @ExtendedPrice	decimal(18,5)
	, @Quantity			int
	, @ServiceName		nvarchar(50)
	, @ServiceTypeID	int
	, @UnitPrice		decimal(9,5)
AS
BEGIN

	SET NOCOUNT ON;
	
	INSERT [dbo].[EstimateServiceItems]
	(
		ESTIMATESERVICE_DESCRIPTION
		, ESTIMATESERVICE_ESTIMATEID
		, ESTIMATESERVICE_EXTENDEDPRICE
		, ESTIMATESERVICE_QUANTITY
		, ESTIMATESERVICE_SERVICENAME
		, ESTIMATESERVICE_SERVICETYPEID
		, ESTIMATESERVICE_UNITPRICE
	)
	OUTPUT
		inserted.ESTIMATESERVICE_ID AS ID, inserted.ESTIMATESERVICE_ROWVERSION AS [VERSION]
	VALUES
	(
		@Description
		, @EstimateID		
		, @ExtendedPrice
		, @Quantity
		, @ServiceName
		, @ServiceTypeID
		, @UnitPrice
	);
END
GO