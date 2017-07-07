﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[PostageTypeGetByID] 
	@ID int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		POSTAGETYPE_ID
		, POSTAGETYPE_ATTRIBUTES
		, POSTAGETYPE_NAME
	FROM 
		[dbo].[PostageTypes]
	WHERE 
		POSTAGETYPE_ID = @ID;
END
GO