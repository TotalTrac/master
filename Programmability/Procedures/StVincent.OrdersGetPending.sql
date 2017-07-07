SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [StVincent].[OrdersGetPending]
	
AS
BEGIN	
	SET NOCOUNT ON;
	    

	UPDATE --TOP (@BatchSize)  
		StVincent.[Orders] WITH (ROWLOCK, UPDLOCK, READPAST)
	SET
		ORDER_STATUS = 2048
	OUTPUT
		inserted.ORDER_ID
		, inserted.ORDER_AVAILABLE
		, inserted.ORDER_CREATED
		, inserted.ORDER_CREATEDBYID
		, inserted.ORDER_DESIRED
		, inserted.ORDER_ERRORMESSAGE
		, inserted.ORDER_FILEFORMAT
		, inserted.ORDER_JOBID
		, inserted.ORDER_NAME
		, inserted.ORDER_ORDERID
		, inserted.ORDER_RETURNCODE
		, inserted.ORDER_STATUS
		, inserted.ORDER_URL
		, inserted.ORDER_USAGE
		, inserted.ORDER_ROWVERSION
	WHERE
		ORDER_STATUS = 0 
		OR ORDER_STATUS = 1;	
END
GO