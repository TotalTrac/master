﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [site].[LogonDeleteByID] 
	@ID int
AS
BEGIN
	
	DELETE 
		[site].[Logons]
	WHERE 
		LOGON_ID = @ID;

	IF @@ROWCOUNT > 0
		RETURN 0
	ELSE 
		RETURN 1;
END
GO