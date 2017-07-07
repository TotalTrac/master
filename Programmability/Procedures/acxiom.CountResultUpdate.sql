SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [acxiom].[CountResultUpdate]
	@ID				int
	, @Created		datetime = NULL
	, @CreatedByID	int = NULL
	, @CountID		int
    , @OrderID		int = NULL    
	, @Version		timestamp
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [acxiom].[CountResults]
	SET
		COUNT_COUNTID		= @CountID
		, COUNT_ORDERID		= @OrderID		
	OUTPUT inserted.COUNT_ID AS [ID], inserted.COUNT_ROWVERSION AS [VERSION]
	WHERE
		COUNT_ID = @ID
		AND COUNT_ROWVERSION = @Version;
END
GO