SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [file].[CommentFileCreate]
	@ContentTypeID	int	
	, @Data			varbinary(MAX)
	, @Description	nvarchar(200) = NULL
	, @IsCompressed	bit
	, @Name			nvarchar(2000)
	, @Size			int
	, @TypeID		int
	, @Uploaded		datetime
AS
BEGIN
	
	SET NOCOUNT ON;
	
    INSERT [file].[CommentFiles]
	(
		FILE_CONTENTTYPEID
		, FILE_COMPRESSED		
		, FILE_DATA
		, FILE_DESCRIPTION				
		, [FILE_NAME]
		, FILE_SIZE
		, FILE_TYPEID
		, FILE_UPLOADED
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
		, @Size
		, @TypeID
		, @Uploaded
	);
END
GO