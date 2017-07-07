SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[LinkCreate]	
	@Index			int
	, @Text			nvarchar(200) = NULL
	, @Title		nvarchar(100) = NULL
	, @Url			nvarchar(500)
	, @VersionID	int
AS
BEGIN

	SET NOCOUNT ON;
	
	INSERT [email].[Links]
	(		
		[Index]
		, [Text]
		, [Title]
		, [Url]
		, [VersionId]
	)
	OUTPUT
		inserted.Id AS ID, inserted.[RowVersion] AS [VERSION]
	VALUES
	(		
		@Index
		, @Text
		, @Title
		, @Url
		, @VersionID
	);
END
GO