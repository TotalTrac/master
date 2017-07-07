﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[colpenn_CoverageCodesGetCountsByMailDateRangePaged] (  
	@Effort			char(1)	= NULL
	, @DateFrom		datetime = NULL
	, @DateTo		datetime = NULL
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
		COVERAGECODE
		, EFFORT
		, CASE @GroupByDate WHEN 1 THEN BATCHDATE END AS BATCHDATE
		, CASE @GroupByDate WHEN 1 THEN MAILDATE END AS MAILDATE
		, CASE @GroupByDate WHEN 1 THEN TRANSACTIONDATE END AS TRANSACTIONDATE
		, MAILRECORDS
		, REJECTRECORDS
	FROM 
	(
		SELECT 
			ROW_NUMBER() OVER (ORDER BY t.COVERAGECODE) AS RESULTNUM
			, t.COVERAGECODE AS COVERAGECODE
			, t.EFFORT AS EFFORT
			, CASE @GroupByDate WHEN 1 THEN t.BATCHDATE END AS BATCHDATE
			, CASE @GroupByDate WHEN 1 THEN t.MAILDATE END AS MAILDATE
			, CASE @GroupByDate WHEN 1 THEN t.TRANSACTIONDATE END AS TRANSACTIONDATE	
			, COUNT(CASE WHEN t.RECORDTYPE = '1' THEN 1 END) AS MAILRECORDS
			, COUNT(CASE WHEN t.RECORDTYPE = '2' THEN 1 END) AS REJECTRECORDS
		FROM 
		(
			SELECT 
				'1' AS RECORDTYPE
				, m.MAILRECORD_COVERAGECODE AS COVERAGECODE
				, m.MAILRECORD_EFFORT AS EFFORT
				, CASE @GroupByDate WHEN 1 THEN m.MAILRECORD_BATCHDATE END AS BATCHDATE
				, CASE @GroupByDate WHEN 1 THEN m.MAILRECORD_MAILDATE END AS MAILDATE
				, CASE @GroupByDate WHEN 1 THEN m.MAILRECORD_TRANSACTIONDATE END AS TRANSACTIONDATE
			FROM 
				colpenn_MailRecords AS m
			WHERE 
				(@DateFrom IS NULL OR m.MAILRECORD_MAILDATE >= @DateFrom) 
				AND (@DateTo IS NULL OR m.MAILRECORD_MAILDATE <= @DateTo)
				AND (@Effort IS NULL OR @Effort = '' OR m.MAILRECORD_EFFORT = @Effort)
	         
			 UNION ALL
	         
			SELECT 
				'2' AS RECORDTYPE
				, r.REJECTRECORD_COVERAGECODE AS COVERAGECODE
				, r.REJECTRECORD_EFFORT AS EFFORT
				, CASE @GroupByDate WHEN 1 THEN r.REJECTRECORD_BATCHDATE END AS BATCHDATE
				, CASE @GroupByDate WHEN 1 THEN r.REJECTRECORD_MAILDATE END AS MAILDATE
				, CASE @GroupByDate WHEN 1 THEN r.REJECTRECORD_TRANSACTIONDATE END AS TRANSACTIONDATE
			FROM 
				colpenn_RejectRecords AS r
			 WHERE 
				(@DateFrom IS NULL OR r.REJECTRECORD_MAILDATE >= @DateFrom) 
				AND (@DateTo IS NULL OR r.REJECTRECORD_MAILDATE <= @DateTo)
				AND (@Effort IS NULL OR @Effort = '' OR r.REJECTRECORD_EFFORT = @Effort)
			) t
		GROUP BY
			COVERAGECODE,
			EFFORT,
			CASE @GroupByDate WHEN 1 THEN t.TRANSACTIONDATE END,
			CASE @GroupByDate WHEN 1 THEN t.MAILDATE END,
			CASE @GroupByDate WHEN 1 THEN t.BATCHDATE END
	)
	AS NumberResults
	WHERE RESULTNUM BETWEEN @StartRow AND @EndRow;
	
END
GO