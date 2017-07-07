SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [file].[CommentFileUpdate]
	@ID					int
	, @ContentTypeID	int	
	, @Data				varbinary(MAX) = NULL
	, @Description		nvarchar(200) = NULL			
	, @IsCompressed		bit
	, @Name				nvarchar(2000)
	, @Size				int
	, @TypeID			int
	, @Uploaded			datetime
	, @Version			timestamp
AS
BEGIN
	
	SET NOCOUNT ON;
	
    UPDATE [file].[CommentFiles]
	SET
		FILE_CONTENTTYPEID	= @ContentTypeID
		, FILE_COMPRESSED	= @IsCompressed
		-- ONLY UPDATE FILE_DATA IF @Data IS NOT NULL
		, FILE_DATA			= COALESCE(@Data, FILE_DATA)
		, FILE_DESCRIPTION	= @Description						
		, [FILE_NAME]		= @Name
		, FILE_SIZE			= @Size
		, FILE_TYPEID		= @TypeID
		, FILE_UPLOADED		= @Uploaded
		
	OUTPUT
		inserted.[FILE_ID] AS ID, inserted.FILE_ROWVERSION AS [VERSION]
	WHERE
		[FILE_ID] = @ID
		AND FILE_ROWVERSION = @Version;
END
GO