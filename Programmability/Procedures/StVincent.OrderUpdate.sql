SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [StVincent].[OrderUpdate]
	@ID				int
	, @Available		int
	, @Created		datetime
	, @CreatedByID	int
	, @Desired		int
	, @ErrorMessage	nvarchar(500) = NULL
	, @FileFormat	int
	, @JobID		int
	, @Name			nvarchar(100)
	, @OrderID		char(20)
	, @ReturnCode	int = NULL
	, @Status		int = NULL
	, @URL			nvarchar(500) = NULL
	, @Usage		int
	, @Version		timestamp
AS
BEGIN	
	SET NOCOUNT ON;
	    
	UPDATE 
		StVincent.[Orders]
	SET
		ORDER_AVAILABLE			= @Available
		, ORDER_CREATED			= @Created
		, ORDER_CREATEDBYID		= @CreatedByID
		, ORDER_DESIRED			= @Desired
		, ORDER_ERRORMESSAGE	= @ErrorMessage
		, ORDER_FILEFORMAT		= @FileFormat
		, ORDER_JOBID			= @JobID
		, ORDER_NAME			= @Name
		, ORDER_ORDERID			= @OrderID
		, ORDER_RETURNCODE		= @ReturnCode
		, ORDER_STATUS			= @Status
		, ORDER_URL				= @URL
		, ORDER_USAGE			= @Usage	
	OUTPUT inserted.ORDER_ID AS [ID], inserted.ORDER_ROWVERSION AS [VERSION]
	WHERE
		ORDER_ID = @ID
		AND ORDER_ROWVERSION = @Version;

END
GO