SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [web].[EventListenerCreate] 
	@Events			int
	, @PageID		int
	, @UserID		int
AS
BEGIN
	SET NOCOUNT ON;

    INSERT 
		[web].[EventListeners]
	(
		EVENTLISTENER_EVENTS
		, EVENTLISTENER_PAGEID
		, EVENTLISTENER_USERID
	)
	OUTPUT
		inserted.EVENTLISTENER_ID AS ID, inserted.EVENTLISTENER_ROWVERSION AS [VERSION]
	VALUES
	(
		@Events
		, @PageID
		, @UserID
	);
END
GO