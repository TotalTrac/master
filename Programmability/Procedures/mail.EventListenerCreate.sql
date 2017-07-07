SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [mail].[EventListenerCreate]	
	@Events		int
	, @UserID	int
AS
BEGIN
	SET NOCOUNT ON;

    INSERT [mail].[EventListeners]
	(		
		EVENTLISTENER_EVENTS
		, EVENTLISTENER_USERID
	)
	OUTPUT inserted.EVENTLISTENER_ID AS [ID], inserted.EVENTLISTENER_ROWVERSION AS [VERSION]
	VALUES
	(
		@Events
		, @UserID
	);
END
GO