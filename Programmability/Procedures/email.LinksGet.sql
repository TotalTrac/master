SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[LinksGet]
	
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		Id
		, [VersionId]
		, [Index]		
		, [Text]
		, [Title]
		, [Url]
		, [RowVersion] 
	FROM 
		[email].[Links]
	ORDER BY 
		Id;
END
GO