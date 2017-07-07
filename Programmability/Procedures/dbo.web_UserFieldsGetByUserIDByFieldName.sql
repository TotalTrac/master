SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[web_UserFieldsGetByUserIDByFieldName]
	@ID		int
	, @Name	nvarchar(100)
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
		[USER_ID] = @ID
		AND Name = @Name
			
END
GO