SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[VersionFromDisplayNamesGet] 
	@Substring nvarchar(255)
AS
BEGIN
	
    SET NOCOUNT ON;

	SELECT 
		DISTINCT FromDisplayName 
	FROM 
		[email].[Versions]
	WHERE	
		@Substring IS NULL OR @Substring = '' OR FromDisplayName LIKE @Substring + '%';
END
GO