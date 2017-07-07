SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[MailPieceUploadLogItemsGetPaged]	
	@Page			int = NULL
	, @RowsPerPage	int = NULL
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @sql nvarchar(max);
		
	SELECT
		LOG_ID
		, LOG_DATETIME
		, LOG_FILEID						
		, LOG_MESSAGE
		, LOG_MESSAGETYPEID
		, LOG_RECORDNUMBER		
	FROM
		[usps].[MailPieceUploadLogItems]	
	ORDER BY
		LOG_ID
	OFFSET ((@Page - 1) * @RowsPerPage) ROWS FETCH NEXT @RowsPerPage ROWS ONLY;
END
GO