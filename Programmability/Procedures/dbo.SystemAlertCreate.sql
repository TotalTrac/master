SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[SystemAlertCreate]
	@DisplayEnd		datetime,
	@DisplayStart	datetime,	
	@Message		nvarchar(500),
	@Posted			datetime,
	@PostedByID		int,
	@Title			nvarchar(50)
AS
BEGIN

	SET NOCOUNT ON;
	
	INSERT [dbo].[SystemAlerts]
	(
		ALERT_DISPLAYEND,
		ALERT_DISPLAYSTART,
		ALERT_MESSAGE,
		ALERT_POSTED,
		ALERT_POSTEDBYID,
		ALERT_TITLE
	)
	OUTPUT		
		inserted.ALERT_ID AS ID, NULL AS [VERSION]
	VALUES
	(
		@DisplayEnd,
		@DisplayStart,
		@Message,
		@Posted,
		@PostedByID,
		@Title
	);
END
GO