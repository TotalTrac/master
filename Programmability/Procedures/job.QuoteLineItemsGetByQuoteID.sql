SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[QuoteLineItemsGetByQuoteID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		ID
		, ADJUSTEDPRICE
    , Note       
		, QUANTITY		
		, QUOTEID		
		, SERVICEID	
    , [State]   
    , Unit
		, UNITPRICE	
    , [RowVersion]
	FROM
		[job].[QuoteLineItems]
	WHERE
		QUOTEID = @ID AND [State] != 2
END
GO