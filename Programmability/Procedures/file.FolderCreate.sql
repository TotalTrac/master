SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [file].[FolderCreate]
	@Created		datetime
	, @CreatedByID	int
	, @Description	nvarchar(200) = NULL		
	, @Name			nvarchar(100)
	, @FolderID		int = NULL	
	, @UserID		int
AS
BEGIN
	
	SET NOCOUNT ON;
	
    INSERT [file].[Folders]
	(
		FOLDER_CREATED
		, FOLDER_CREATEDBYID
		, FOLDER_DESCRIPTION
		, FOLDER_NAME
		, FOLDER_FOLDERID
		, FOLDER_USERID
	)
	OUTPUT
		inserted.FOLDER_ID AS ID, inserted.FOLDER_ROWVERSION AS [VERSION]
	VALUES
	(
		@Created
		, @CreatedByID
		, @Description
		, @Name	
		, @FolderID
		, @UserID
	);
END
GO