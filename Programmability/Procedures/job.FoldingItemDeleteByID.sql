﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[FoldingItemDeleteByID] 
	@ID int
AS
BEGIN

	DELETE 
		job.FoldingItems 
	WHERE 
		ID = @ID;	

	IF @@ROWCOUNT > 0 
		RETURN 0
	ELSE
		RETURN 1;
		
END
GO