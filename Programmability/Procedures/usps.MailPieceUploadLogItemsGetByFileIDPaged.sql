SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[MailPieceUploadLogItemsGetByFileIDPaged]
	@ID				int
	, @Page			int
	, @RowsPerPage	int
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
	WHERE
		LOG_FILEID = @ID
	ORDER BY
		LOG_ID
	OFFSET ((@Page - 1) * @RowsPerPage) ROWS FETCH NEXT @RowsPerPage ROWS ONLY;
END
GO