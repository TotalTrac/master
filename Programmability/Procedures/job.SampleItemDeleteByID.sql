﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[SampleItemDeleteByID] 
	@ID int
AS
BEGIN
	
	SET NOCOUNT ON;
	
    DELETE
		job.[SampleItems]
    WHERE 
		ID = @ID;

	IF @@ROWCOUNT > 0
		RETURN 0;
	ELSE
		RETURN 1;
	
END
GO