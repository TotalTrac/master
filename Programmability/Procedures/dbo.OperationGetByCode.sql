﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[OperationGetByCode] 
	@Code int
AS
BEGIN
	SET NOCOUNT ON;
    
	SELECT 
		OPERATION_ID
		, OPERATION_CODE
		, OPERATION_CUTOFF
		, OPERATION_DESCRIPTION
		, OPERATION_MACHINEID
		, OPERATION_MAILLEVELID
		, OPERATION_MAILPHASEID
		, OPERATION_MAILTYPEID
		, OPERATION_OPERATIONTYPEID
		, OPERATION_PROCESSTYPEID
	FROM 
		[dbo].[Operations]
	WHERE
		OPERATION_CODE = @Code
END
GO