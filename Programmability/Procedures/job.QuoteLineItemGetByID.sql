SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[QuoteLineItemGetByID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		ID
		ADJUSTEDPRICE
    , Note       
		, QUANTITY		
		, QUOTEID		
		, SERVICEID	
    , [State]   
    , Unit
		, UNITPRICE	
	FROM
		[job].[QuoteLineItems]
	WHERE
		ID = @ID AND [State] != 2
END
GO