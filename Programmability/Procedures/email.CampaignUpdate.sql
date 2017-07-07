SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[CampaignUpdate]
	@ID					int
	, @CampaignID		int = NULL	
	, @ClientID			int
	, @Created			datetime
	, @Name				nvarchar(100)
	, @Version			timestamp
AS
BEGIN
	
	SET NOCOUNT ON;
	
	UPDATE [email].[Campaigns]
	SET		
		CampaignId = @CampaignID
		, ClientId	= @ClientID
		, Created	= @Created
		, Name		= @Name	
	OUTPUT
		inserted.Id AS ID, inserted.[RowVersion] AS [VERSION]
	WHERE
		(Id = @ID) 
		AND ([RowVersion] = @Version);	
END
GO