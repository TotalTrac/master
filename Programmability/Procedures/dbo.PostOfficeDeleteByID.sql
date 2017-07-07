﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[PostOfficeDeleteByID]	
	@ID int
AS
BEGIN
    
	DELETE 
		[dbo].[PostOffices]
	WHERE
		POSTOFFICE_ID = @ID;

	IF @@ROWCOUNT > 0
		RETURN 0
	ELSE
		RETURN 1
	
END
GO