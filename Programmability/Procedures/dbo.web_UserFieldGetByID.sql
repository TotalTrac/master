SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[web_UserFieldGetByID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		Id		
		, Name
		, UserId
		, Value
		, [RowVersion]
	FROM
		[dbo].[CampaignUserFields]
	WHERE
		Id = @ID;
			
END
GO