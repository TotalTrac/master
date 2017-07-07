SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [file].[_MetaDataUpdate]
	@ID				int
	, @ContentTypeID	int	
	, @Description	nvarchar(200) = NULL		
	, @FileName		nvarchar(2000)
	, @FolderID		int = NULL
	, @IsCompressed	bit
	, @Size			int
	, @TypeID		int
	, @Uploaded		datetime
	, @UserID		int
	, @Version		timestamp
AS
BEGIN
	
	SET NOCOUNT ON;
	
    UPDATE [file].[MetaData]
	SET
		METADATA_CONTENTTYPEID = @ContentTypeID
		, METADATA_COMPRESSED	= @IsCompressed
		
		, METADATA_DESCRIPTION	= @Description						
		, METADATA_FILENAME	= @FileName
		, METADATA_FOLDERID	= @FolderID
		, METADATA_SIZE		= @Size
		, METADATA_TYPEID		= @TypeID
		, METADATA_UPLOADED	= @Uploaded
		, METADATA_USERID		= @UserID	
	OUTPUT
		inserted.METADATA_ID AS ID, inserted.METADATA_ROWVERSION AS [VERSION]
	WHERE
		METADATA_ID = @ID
		AND METADATA_ROWVERSION = @Version;
END
GO