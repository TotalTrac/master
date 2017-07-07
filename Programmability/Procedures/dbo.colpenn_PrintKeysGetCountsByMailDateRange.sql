﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[colpenn_PrintKeysGetCountsByMailDateRange] (  
  @Effort		char(1)		= NULL
  , @DateFrom	datetime	= NULL
  , @DateTo		datetime	= NULL
  , @GroupByDate	bit = NULL  
)
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT		
		t.PRINTKEY
		, EFFORT
		, CASE @GroupByDate WHEN 1 THEN BATCHDATE END AS BATCHDATE
		, CASE @GroupByDate WHEN 1 THEN TRANSACTIONDATE END AS TRANSACTIONDATE
		, CASE @GroupByDate WHEN 1 THEN MAILDATE END AS MAILDATE				
		, COUNT(CASE WHEN t.RECORDTYPE = '1' THEN 1 END) AS MAILRECORDS
		, COUNT(CASE WHEN t.RECORDTYPE = '2' THEN 1 END) AS REJECTRECORDS
	FROM 
	(
		SELECT 
			'1' AS RECORDTYPE
			, m.MAILRECORD_PRINTKEY AS PRINTKEY
			, MAILRECORD_EFFORT AS EFFORT
			, m.MAILRECORD_BATCHDATE AS BATCHDATE
			, m.MAILRECORD_MAILDATE AS MAILDATE
			, m.MAILRECORD_TRANSACTIONDATE AS TRANSACTIONDATE
        FROM 
			[dbo].[colpenn_MailRecords] AS m
        WHERE 
			(@DateFrom IS NULL OR m.MAILRECORD_MAILDATE >= @DateFrom) 
			AND (@DateTo IS NULL OR m.MAILRECORD_MAILDATE <= @DateTo)
			AND (@Effort IS NULL OR @Effort = '' OR m.MAILRECORD_EFFORT = @Effort)
         
         UNION ALL
         
		SELECT 
			'2' AS RECORDTYPE
			, r.REJECTRECORD_PRINTKEY AS PRINTKEY
			, r.REJECTRECORD_EFFORT AS EFFORT
			, r.REJECTRECORD_BATCHDATE AS BATCHDATE 
			, r.REJECTRECORD_MAILDATE AS MAILDATE
			, r.REJECTRECORD_TRANSACTIONDATE AS TRANSACTIONDATE
        FROM 
			[dbo].[colpenn_RejectRecords] AS r
         WHERE 
			(@DateFrom IS NULL OR r.REJECTRECORD_MAILDATE >= @DateFrom) 
			AND (@DateTo IS NULL OR r.REJECTRECORD_MAILDATE <= @DateTo)
			AND (@Effort IS NULL OR @Effort = '' OR r.REJECTRECORD_EFFORT = @Effort)
        ) t
	GROUP BY
		PRINTKEY,
		EFFORT,
		CASE @GroupByDate WHEN 1 THEN t.TRANSACTIONDATE END,
		CASE @GroupByDate WHEN 1 THEN t.MAILDATE END,
		CASE @GroupByDate WHEN 1 THEN t.BATCHDATE END
	
END
GO