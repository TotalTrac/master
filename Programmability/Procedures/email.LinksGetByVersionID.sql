SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[LinksGetByVersionID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		Id
		, [Index]
		, [Text]
		, [Title]
		, [Url]
		, [VersionId]
		, [RowVersion] 
	FROM 
		[email].[Links]
	WHERE
		[VersionId] = @ID
	ORDER BY 
		Id;
END
GO