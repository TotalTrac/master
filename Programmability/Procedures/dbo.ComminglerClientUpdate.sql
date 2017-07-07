SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ComminglerClientUpdate]
	@ID					int
	, @ClientID			int
	, @ComminglerID		int
	, @NonProfitRate	decimal(4,3)
	, @StandardRate		decimal(4,3)
	, @Value			int
	, @Version			timestamp
AS

BEGIN
		
	SET NOCOUNT ON;
		
	UPDATE [dbo].[ComminglerClients]	
	SET
		COMMINGLERCLIENT_CLIENTID			= @ClientID
		, COMMINGLERCLIENT_COMMINGLERID		= @ComminglerID
		, COMMINGLERCLIENT_NONPROFITRATE	= @NonProfitRate
		, COMMINGLERCLIENT_STANDARDRATE		= @StandardRate
		, COMMINGLERCLIENT_VALUE			= @Value	
	OUTPUT
		inserted.COMMINGLERCLIENT_ID AS ID, inserted.COMMINGLERCLIENT_ROWVERSION AS [VERSION]
	WHERE
		COMMINGLERCLIENT_ID = @ID
		AND COMMINGLERCLIENT_ROWVERSION = @Version
END
GO