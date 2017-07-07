SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[LinkGetByID]
	@ID	int
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
	WHERE
		Id = @ID;
	
END
GO