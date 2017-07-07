SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[colpenn_SummaryCountsGetByBatchDateRangePaged] (
	@Effort			char(1)
	, @From			datetime	= NULL
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
		[DATE]
		, EFFORT
		, REJECTRECORD_COUNT
		, MAILRECORD_COUNT
	FROM 
	(
		SELECT
			ROW_NUMBER() OVER (ORDER BY [DATE]) AS RESULTNUM
			, [DATE]
			, EFFORT
			, SUM(REJECTRECORD_COUNT) AS [REJECTRECORD_COUNT]
			, SUM(MAILRECORD_COUNT) AS [MAILRECORD_COUNT]
		FROM
			(		
				SELECT
					REJECTRECORD_BATCHDATE AS [DATE]
					, REJECTRECORD_EFFORT AS [EFFORT]
					, COUNT(*) AS [REJECTRECORD_COUNT]
					, 0 AS [MAILRECORD_COUNT]
				FROM 
					[dbo].[colpenn_RejectRecords] 
				WHERE
					(@From IS NULL OR REJECTRECORD_BATCHDATE >= @From)
					AND (@To IS NULL OR REJECTRECORD_BATCHDATE <= @To)
					AND (@Effort IS NULL OR @Effort = '' OR REJECTRECORD_EFFORT = @Effort)
				GROUP BY
					REJECTRECORD_BATCHDATE, REJECTRECORD_EFFORT
	
				UNION
				
				SELECT
					MAILRECORD_BATCHDATE AS [DATE]
					, MAILRECORD_EFFORT AS [EFFORT]
					, 0 AS [REJECTRECORD_COUNT]
					, COUNT(*) AS [MAILRECORD_COUNT]
				FROM 
					[dbo].[colpenn_MailRecords] 
				WHERE
					(@From IS NULL OR MAILRECORD_BATCHDATE >= @From)
					AND (@To IS NULL OR MAILRECORD_BATCHDATE <= @To)
					AND (@Effort IS NULL OR @Effort = '' OR MAILRECORD_EFFORT = @Effort)
				GROUP BY
					MAILRECORD_BATCHDATE, MAILRECORD_EFFORT
			) as X
		GROUP BY [DATE], [EFFORT]		
	)	
	AS NumberResults
	WHERE RESULTNUM BETWEEN @StartRow AND @EndRow;
END
GO