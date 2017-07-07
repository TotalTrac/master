SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [StVincent].[OrderCreate]
	@Available		int
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
AS
BEGIN	
	SET NOCOUNT ON;
	    
	INSERT StVincent.[Orders]
	(
		ORDER_AVAILABLE
		, ORDER_CREATED
		, ORDER_CREATEDBYID
		, ORDER_DESIRED
		, ORDER_ERRORMESSAGE
		, ORDER_FILEFORMAT
		, ORDER_JOBID
		, ORDER_NAME
		, ORDER_ORDERID
		, ORDER_RETURNCODE
		, ORDER_STATUS
		, ORDER_URL
		, ORDER_USAGE
	)
	OUTPUT inserted.ORDER_ID AS [ID], inserted.ORDER_ROWVERSION AS [VERSION]
	VALUES
	(
		@Available
		, @Created
		, @CreatedByID
		, @Desired
		, @ErrorMessage
		, @FileFormat
		, @JobID
		, @Name
		, @OrderID
		, @ReturnCode
		, @Status
		, @URL
		, @Usage
	);

END
GO