SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[colpenn_RejectRecordsGetDateCountByBatchDateRangePaged] 
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
			ROW_NUMBER() OVER (ORDER BY REJECTRECORD_BATCHDATE) AS RESULTNUM
			, REJECTRECORD_BATCHDATE AS [DATE]
			, COUNT(*) AS [COUNT]
		FROM 
			[dbo].[colpenn_RejectRecords] 
		WHERE
			(@From IS NULL OR REJECTRECORD_BATCHDATE >= @From)
			AND (@To IS NULL OR REJECTRECORD_BATCHDATE <= @To)
		GROUP BY
			REJECTRECORD_BATCHDATE
	)	
	AS NumberResults
	WHERE RESULTNUM BETWEEN @StartRow AND @EndRow;
END
GO