﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[UserGetPasswordByName] 
	@UserName NVarChar(50)
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		USER_PASSWORD 
	FROM 
		[dbo].[Users]
	WHERE 
		USER_USERNAME = @UserName;
END
GO