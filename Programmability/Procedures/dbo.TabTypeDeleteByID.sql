﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[TabTypeDeleteByID]
	@ID int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	DELETE 
		[dbo].[TabTypes]
	WHERE
		TABTYPE_ID = @ID

	IF @@ROWCOUNT > 0 
		RETURN 0;
	ELSE
		RETURN 1;	    
	
END
GO