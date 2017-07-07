SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [file].[FileCreate]
	@ContentTypeID	int	
	, @Data			varbinary(MAX)
	, @Description	nvarchar(200) = NULL
	, @FolderID		int
	, @IsCompressed	bit
	, @Name			nvarchar(2000)
	, @Size			int
	, @TypeID		int
	, @Uploaded		datetime
	, @UserID		int
AS
BEGIN
	
	SET NOCOUNT ON;
	
    INSERT [file].[Files]
	(
		FILE_CONTENTTYPEID
		, FILE_COMPRESSED		
		, FILE_DATA
		, FILE_DESCRIPTION				
		, [FILE_NAME]
		, FILE_FOLDERID
		, FILE_SIZE
		, FILE_TYPEID
		, FILE_UPLOADED
		, FILE_USERID
	)
	OUTPUT
		inserted.[FILE_ID] AS ID, inserted.FILE_ROWVERSION AS [VERSION]
	VALUES
	(
		@ContentTypeID
		, @IsCompressed		
		, @Data
		, @Description
		, @Name	
		, @FolderID	
		, @Size
		, @TypeID
		, @Uploaded
		, @UserID
	);
END
GO