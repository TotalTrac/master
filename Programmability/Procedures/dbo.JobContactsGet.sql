﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[JobContactsGet] 
	
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		DISTINCT JOB_CONTACT 
	FROM 
		[dbo].[Jobs]
	ORDER BY
		JOB_CONTACT
END
GO