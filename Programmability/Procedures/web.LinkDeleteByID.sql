﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[LinkDeleteByID]
	@ID	int	
AS
BEGIN
	
	SET NOCOUNT ON;
	   
    DELETE
		[web].[Links]
	WHERE
		LINK_ID = @ID;
		
	IF @@ROWCOUNT > 0
		RETURN 0;
	ELSE
		RETURN 1;		
END
GO