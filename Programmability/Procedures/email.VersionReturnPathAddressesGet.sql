SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[VersionReturnPathAddressesGet] 
	@Substring nvarchar(255)
AS
BEGIN
	
    SET NOCOUNT ON;

	SELECT 
		DISTINCT ReturnPathAddress 
	FROM 
		[email].[Versions]
	WHERE 
		@Substring IS NULL OR @Substring = '' OR ReturnPathAddress LIKE @Substring + '%';
END
GO