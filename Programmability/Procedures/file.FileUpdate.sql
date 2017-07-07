SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [file].[FileUpdate]
	@ID					int
	, @ContentTypeID	int	
	, @Data				varbinary(MAX) = NULL
	, @Description		nvarchar(200) = NULL			
	, @FolderID			int = NULL
	, @IsCompressed		bit
	, @Name				nvarchar(2000)
	, @Size				int
	, @TypeID			int
	, @Uploaded			datetime
	, @UserID			int
	, @Version			timestamp
AS
BEGIN
	
	SET NOCOUNT ON;
	
    UPDATE [file].[Files]
	SET
		FILE_CONTENTTYPEID	= @ContentTypeID
		, FILE_COMPRESSED	= @IsCompressed
		-- ONLY UPDATE FILE_DATA IF @Data IS NOT NULL
		, FILE_DATA			= COALESCE(@Data, FILE_DATA)
		, FILE_DESCRIPTION	= @Description						
		, [FILE_NAME]		= @Name
		, FILE_FOLDERID		= @FolderID
		, FILE_SIZE			= @Size
		, FILE_TYPEID		= @TypeID
		, FILE_UPLOADED		= @Uploaded
		, FILE_USERID		= @UserID	
	OUTPUT
		inserted.[FILE_ID] AS ID, inserted.FILE_ROWVERSION AS [VERSION]
	WHERE
		[FILE_ID] = @ID
		AND FILE_ROWVERSION = @Version;
END
GO