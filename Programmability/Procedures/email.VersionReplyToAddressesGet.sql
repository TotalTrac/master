SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[VersionReplyToAddressesGet] 
	@Substring nvarchar(255)
AS
BEGIN
	
    SET NOCOUNT ON;

	SELECT 
		DISTINCT ReplyToAddress 
	FROM 
		[email].[Versions]
	WHERE 
		@Substring IS NULL OR @Substring = '' OR ReplyToAddress LIKE @Substring + '%';
END
GO