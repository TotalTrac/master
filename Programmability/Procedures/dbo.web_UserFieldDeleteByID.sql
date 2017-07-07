SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[web_UserFieldDeleteByID] 	
	@ID int
AS
BEGIN
	
	SET NOCOUNT ON;

	DELETE 
		[dbo].[CampaignUserFields]	
	WHERE
		Id = @ID;

	IF @@ROWCOUNT > 0 
		RETURN 0;
	ELSE
		RETURN 1;

END
GO