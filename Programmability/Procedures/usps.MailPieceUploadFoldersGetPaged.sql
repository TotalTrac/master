SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[MailPieceUploadFoldersGetPaged]
	@Page			int,
	@RowsPerPage	int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		FOLDER_ID
		, FOLDER_PATH
		, FOLDER_ROWVERSION
	FROM
		[usps].[MailPieceUploadFolders]
	ORDER BY
		FOLDER_ID
	OFFSET ((@Page - 1) * @RowsPerPage) ROWS FETCH NEXT @RowsPerPage ROWS ONLY;
END
GO