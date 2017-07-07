SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[LinkUpdate]
	@ID				int	
	, @Index		int
	, @Text			nvarchar(200) = NULL
	, @Title		nvarchar(100) = NULL
	, @Url			nvarchar(500)
	, @VersionID	int
	, @Version		timestamp
AS
BEGIN

	SET NOCOUNT ON;
	
	UPDATE 
		[email].[Links]
	SET		
		[Index]			= @Index
		, [Text]			= @Text
		, [Title]		= @Title
		, [Url]			= @Url
		, [VersionId]	= @VersionID
	OUTPUT
		inserted.Id AS ID, inserted.[RowVersion] AS [VERSION]
	WHERE
		(Id = @ID) 
		AND ([RowVersion] = @Version);		
END
GO