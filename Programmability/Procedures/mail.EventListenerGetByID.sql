﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [mail].[EventListenerGetByID]
	@ID			int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		EVENTLISTENER_ID		
		, EVENTLISTENER_EVENTS
		, EVENTLISTENER_USERID
		, EVENTLISTENER_ROWVERSION
	FROM
		[mail].[EventListeners]	
	WHERE
		EVENTLISTENER_ID = @ID;	
END
GO