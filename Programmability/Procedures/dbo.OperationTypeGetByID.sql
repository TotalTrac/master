﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[OperationTypeGetByID] 
	@ID int
AS
BEGIN
	SET NOCOUNT ON;
    
	SELECT 
		OPERATIONTYPE_ID
		, OPERATIONTYPE_DESCRIPTION
	FROM 
		[dbo].[OperationTypes]
	WHERE
		OPERATIONTYPE_ID = @ID
END
GO