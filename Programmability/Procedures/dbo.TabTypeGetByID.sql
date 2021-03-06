﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[TabTypeGetByID] 
	@ID int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		TABTYPE_ID
		, TABTYPE_NAME
		, TABTYPE_ROWVERSION
	FROM 
		[dbo].[TabTypes]
	 WHERE 
		TABTYPE_ID = @ID;
END
GO