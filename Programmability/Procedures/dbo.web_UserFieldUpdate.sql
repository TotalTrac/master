SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[web_UserFieldUpdate]	
	@ID				int
	, @Name			nvarchar(100)
	, @UserID		int
	, @Value		sql_variant = NULL
	, @Version		timestamp
AS
BEGIN
	SET NOCOUNT ON;
	
	UPDATE [dbo].[CampaignUserFields]
	SET		
		Name		= @Name
		, UserId	= @UserId
		, Value		= @Value	
	OUTPUT inserted.Id AS [ID], inserted.[RowVersion] AS [VERSION]
	WHERE 
		(Id = @ID) AND
		([Rowversion] = @Version);	
END
GO