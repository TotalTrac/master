SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [file].[_MetaDataCreate]
	@ContentTypeID	int	
	, @Description	nvarchar(200) = NULL		
	, @FileName		nvarchar(2000)
	, @FolderID		int
	, @IsCompressed	bit
	, @Size			int
	, @TypeID		int
	, @Uploaded		datetime
	, @UserID		int
AS
BEGIN
	
	SET NOCOUNT ON;
	
    INSERT [file].[MetaData]
	(
		METADATA_CONTENTTYPEID
		, METADATA_COMPRESSED		
		, METADATA_DESCRIPTION				
		, METADATA_FILENAME
		, METADATA_FOLDERID
		, METADATA_SIZE
		, METADATA_TYPEID
		, METADATA_UPLOADED
		, METADATA_USERID
	)
	OUTPUT
		inserted.METADATA_ID AS ID, inserted.METADATA_ROWVERSION AS [VERSION]
	VALUES
	(
		@ContentTypeID
		, @IsCompressed		
		, @Description
		, @FileName	
		, @FolderID	
		, @Size
		, @TypeID
		, @Uploaded
		, @UserID
	);
END
GO