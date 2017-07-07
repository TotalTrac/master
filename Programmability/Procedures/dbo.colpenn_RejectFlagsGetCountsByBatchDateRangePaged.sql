﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[colpenn_RejectFlagsGetCountsByBatchDateRangePaged] (  
	@Effort			char(1)		= NULL
	, @DateFrom		datetime	= NULL
	, @DateTo		datetime	= NULL 
	, @GroupByDate	bit = NULL
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
		FLAG
		, REASON
		, EFFORT
		, [COUNT]
		, CASE @GroupByDate WHEN 1 THEN BATCHDATE END AS BATCHDATE
		, CASE @GroupByDate WHEN 1 THEN MAILDATE END AS MAILDATE
		, CASE @GroupByDate WHEN 1 THEN TRANSACTIONDATE END AS TRANSACTIONDATE				
	FROM 
	(
		SELECT 
			ROW_NUMBER() OVER (ORDER BY r.REJECTRECORD_FLAG) AS RESULTNUM
			, r.REJECTRECORD_FLAG AS FLAG
			, r.REJECTRECORD_REASON AS REASON
			, r.REJECTRECORD_EFFORT AS EFFORT
			, COUNT(*) AS [COUNT]
			, CASE @GroupByDate WHEN 1 THEN r.REJECTRECORD_BATCHDATE END AS BATCHDATE
			, CASE @GroupByDate WHEN 1 THEN r.REJECTRECORD_MAILDATE END AS MAILDATE
			, CASE @GroupByDate WHEN 1 THEN r.REJECTRECORD_TRANSACTIONDATE END AS TRANSACTIONDATE							
		FROM 
			[dbo].[colpenn_RejectRecords] AS r
		WHERE 
			(@DateFrom IS NULL OR r.REJECTRECORD_BATCHDATE >= @DateFrom) 
			AND (@DateTo IS NULL OR r.REJECTRECORD_BATCHDATE <= @DateTo)
			AND (@Effort IS NULL OR @Effort = '' OR r.REJECTRECORD_EFFORT = @Effort)			
		GROUP BY			
			r.REJECTRECORD_FLAG
			, r.REJECTRECORD_REASON
			, r.REJECTRECORD_EFFORT
			, CASE @GroupByDate WHEN 1 THEN r.REJECTRECORD_TRANSACTIONDATE END
			, CASE @GroupByDate WHEN 1 THEN r.REJECTRECORD_MAILDATE END
			, CASE @GroupByDate WHEN 1 THEN r.REJECTRECORD_BATCHDATE END 
	)
	AS NumberResults
	WHERE RESULTNUM BETWEEN @StartRow AND @EndRow;
	
END
GO