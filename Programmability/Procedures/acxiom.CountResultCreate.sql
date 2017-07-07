SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [acxiom].[CountResultCreate]
	@Created		datetime = NULL
	, @CreatedByID	int = NULL
	, @CountID		int
    , @OrderID		int = NULL    
AS
BEGIN
	SET NOCOUNT ON;

	INSERT [acxiom].[CountResults]
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