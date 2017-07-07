SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[CampaignDeleteByID]
	@ID	int
AS
BEGIN

	SET NOCOUNT ON;
	
	DELETE 
		[email].[Campaigns]
	WHERE 
		Id = @ID;
	
	IF @@ROWCOUNT > 0
		RETURN 0;
	ELSE
		RETURN 1;
END
GO