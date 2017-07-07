SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ComminglerClientCreate]
	@ClientID			int
	, @ComminglerID		int
	, @NonProfitRate	decimal(4,3)
	, @StandardRate		decimal(4,3)
	, @Value			int
AS

BEGIN
		
	SET NOCOUNT ON;
		
	INSERT [dbo].[ComminglerClients]	
	(
		COMMINGLERCLIENT_CLIENTID
		, COMMINGLERCLIENT_COMMINGLERID
		, COMMINGLERCLIENT_NONPROFITRATE
		, COMMINGLERCLIENT_STANDARDRATE
		, COMMINGLERCLIENT_VALUE
	)
	OUTPUT
		inserted.COMMINGLERCLIENT_ID AS ID, inserted.COMMINGLERCLIENT_ROWVERSION AS [VERSION]
	VALUES
	(
		@ClientID
		, @ComminglerID
		, @NonProfitRate
		, @StandardRate
		, @Value
	);
END
GO