﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [file].[_DataGetByID] 
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		DATA_ID
		, DATA_DATA
		, DATA_METADATAID		
		, DATA_ROWVERSION	
	FROM 
		[file].[Data]
	WHERE 
		DATA_ID = @ID;
END
GO