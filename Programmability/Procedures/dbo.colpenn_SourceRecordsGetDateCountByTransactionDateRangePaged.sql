SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[colpenn_SourceRecordsGetDateCountByTransactionDateRangePaged] 
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
			ROW_NUMBER() OVER (ORDER BY SOURCERECORD_TRANSACTIONDATE) AS RESULTNUM
			, SOURCERECORD_TRANSACTIONDATE AS [DATE]
			, COUNT(*) AS [COUNT]
		FROM 
			[dbo].[colpenn_SourceRecords] 
		WHERE
			(@From IS NULL OR SOURCERECORD_TRANSACTIONDATE >= @From)
			AND (@To IS NULL OR SOURCERECORD_TRANSACTIONDATE <= @To)
		GROUP BY
			SOURCERECORD_TRANSACTIONDATE
	)	
	AS NumberResults
	WHERE RESULTNUM BETWEEN @StartRow AND @EndRow;
END
GO