﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[ServiceDeleteByID] 
	@ID int
AS
BEGIN

	DELETE 
		job.[Services]
	WHERE 
		SERVICE_ID = @ID;

	IF @@ROWCOUNT > 0
		RETURN 0;
	ELSE
		RETURN 1;
END
GO