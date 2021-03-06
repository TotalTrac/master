﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ComminglerClientGetByComminglerIDByValue]	
	@ComminglerID	int
	, @Value		int
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT 
		COMMINGLERCLIENT_ID
		, COMMINGLERCLIENT_CLIENTID
		, COMMINGLERCLIENT_COMMINGLERID
		, COMMINGLERCLIENT_NONPROFITRATE
		, COMMINGLERCLIENT_STANDARDRATE
		, COMMINGLERCLIENT_VALUE
		, COMMINGLERCLIENT_ROWVERSION
	FROM 
		[dbo].[ComminglerClients]
	WHERE
		(COMMINGLERCLIENT_VALUE = @Value)
		AND ((COMMINGLERCLIENT_COMMINGLERID = @ComminglerID));
END
GO