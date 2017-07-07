SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[web_UserFieldCreate]	
	@Name		nvarchar(100)
	, @UserID	int
	, @Value	sql_variant = NULL
AS
BEGIN
	SET NOCOUNT ON;
		
	INSERT [dbo].[CampaignUserFields]
	(		
		Name
		, UserId
		, Value
	)
	OUTPUT inserted.Id AS [ID], inserted.[RowVersion] AS [VERSION]
	VALUES
	(	
		@Name
		, @UserID
		, @Value
	);
END
GO