SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[colpenn_MailRecordsGetDateCountByBatchDateRangePaged] 
(
	@From			datetime	= NULL
	, @To			datetime	= NULL 
	, @Page			int
	, @RowsPerPage	int  
)
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @StartRow int,
			@EndRow int;

	SET @StartRow = ((@Page - 1) * @RowsPerPage) + 1;
	SET @EndRow = @StartRow + @RowsPerPage - 1;
		
	SELECT 
		[DATE] AS [DATE]
		, [COUNT] AS [COUNT]
	FROM 
	(
		SELECT 
			ROW_NUMBER() OVER (ORDER BY MAILRECORD_BATCHDATE) AS RESULTNUM
			, MAILRECORD_BATCHDATE AS [DATE]
			, COUNT(*) AS [COUNT]
		FROM 
			[dbo].[colpenn_MailRecords] 
		WHERE
			(@From IS NULL OR MAILRECORD_BATCHDATE >= @From)
			AND (@To IS NULL OR MAILRECORD_BATCHDATE <= @To)
		GROUP BY
			MAILRECORD_BATCHDATE
	)	
	AS NumberResults
	WHERE RESULTNUM BETWEEN @StartRow AND @EndRow;
END
GO