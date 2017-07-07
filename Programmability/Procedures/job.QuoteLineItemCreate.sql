SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[QuoteLineItemCreate]	
	@AdjustedPrice	decimal(15,5)
  , @Note       VARCHAR(MAX)
	, @Quantity		int
	, @QuoteID		int
	, @ServiceID	INT
  , @Unit       INT
  , @UnitPrice	decimal(15,5)	
AS
BEGIN
	SET NOCOUNT ON;
	
	INSERT [job].[QuoteLineItems]
	(	
		ADJUSTEDPRICE
    , Note       
		, QUANTITY		
		, QUOTEID		
		, SERVICEID	
    , [State]   
    , Unit
		, UNITPRICE	
	)
	OUTPUT inserted.ID AS [ID], inserted.[ROWVERSION] AS [VERSION]
	VALUES
	(	
		@AdjustedPrice
    , @Note
		, @Quantity
		, @QuoteID
		, @ServiceID
    , 0
    , @Unit
		, @UnitPrice
	);
END
GO