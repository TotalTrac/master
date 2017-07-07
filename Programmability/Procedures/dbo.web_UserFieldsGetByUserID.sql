SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[web_UserFieldsGetByUserID]
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
	INNER JOIN
		[web].[Users] ON [web].[Users].[USER_TARGETID] = [dbo].[CampaignUserFields].[UserId]
	WHERE
		UserId = @ID;
			
END
GO