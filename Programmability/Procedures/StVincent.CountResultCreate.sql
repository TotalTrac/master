SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [StVincent].[CountResultCreate]
	@Created		datetime = NULL
	, @CreatedByID	int = NULL
	, @CountID		int
    , @OrderID		int = NULL    
AS
BEGIN
	SET NOCOUNT ON;

	INSERT StVincent.[CountResults]
	(
		COUNT_CREATED
		, COUNT_CREATEDBYID
		, COUNT_COUNTID
		, COUNT_ORDERID		
	)
	OUTPUT inserted.COUNT_ID AS [ID], inserted.COUNT_ROWVERSION AS [VERSION]
	VALUES
	(
		@Created
		, @CreatedByID
		, @CountID
		, @OrderID		
	);
END
GO