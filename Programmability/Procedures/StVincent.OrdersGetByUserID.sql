﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [StVincent].[OrdersGetByUserID]
	@ID				int
AS
BEGIN	
	SET NOCOUNT ON;
	    
	SELECT
		ORDER_ID
		, ORDER_AVAILABLE
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
		, ORDER_ROWVERSION
	FROM 
		StVincent.[Orders]	
	WHERE
		ORDER_CREATEDBYID = @ID
	ORDER BY
		ORDER_ID;
END
GO