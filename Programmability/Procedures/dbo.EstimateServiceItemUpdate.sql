SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[EstimateServiceItemUpdate]
	@ID					int
	, @Description		nvarchar(100)
	, @EstimateID		int	
	, @ExtendedPrice	decimal (18,5)
	, @Quantity			int
	, @ServiceName		nvarchar(50)
	, @ServiceTypeID	int
	, @UnitPrice		decimal (9,5)
	, @Version			timestamp
AS
BEGIN

	SET NOCOUNT ON;

	UPDATE
		[dbo].[EstimateServiceItems]
	SET
		ESTIMATESERVICE_DESCRIPTION		= @Description
		, ESTIMATESERVICE_ESTIMATEID	= @EstimateID
		, ESTIMATESERVICE_EXTENDEDPRICE = @ExtendedPrice
		, ESTIMATESERVICE_QUANTITY		= @Quantity
		, ESTIMATESERVICE_SERVICENAME	= @ServiceName
		, ESTIMATESERVICE_SERVICETYPEID = @ServiceTypeID
		, ESTIMATESERVICE_UNITPRICE		= @UnitPrice
	OUTPUT
		inserted.ESTIMATESERVICE_ID AS ID, inserted.ESTIMATESERVICE_ROWVERSION AS [VERSION]
	WHERE 
		(ESTIMATESERVICE_ID = @ID)
		 AND (ESTIMATESERVICE_ROWVERSION = @Version);
END
GO