SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[LinkGetByVersionIDIndex]
	@ID		int,
	@Index	int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT 
		l.Id		
		, l.[Index]
		, l.[Text]
		, l.[Title]
		, l.[Url]
		, l.[VersionId]
		, l.[RowVersion]
	FROM 
		[email].[Links] as l
	WHERE
		(l.[VersionId] = @ID) AND
		(l.[Index] = @Index);	
END
GO