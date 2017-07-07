SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[CampaignCreate]
	@CampaignID		int	= NULL
	, @ClientID		int
	, @Created		datetime
	, @Name			nvarchar(100)	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	INSERT Campaigns
	(
		CampaignId			
		, ClientId
		, Created
		, Name
	)
	OUTPUT
		inserted.Id AS ID, inserted.[RowVersion] AS [VERSION]
	VALUES
	(
		@CampaignID		
		, @ClientID
		, @Created
		, @Name
	);
END
GO