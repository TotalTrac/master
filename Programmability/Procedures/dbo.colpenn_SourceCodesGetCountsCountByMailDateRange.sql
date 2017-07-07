﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[colpenn_SourceCodesGetCountsCountByMailDateRange] (  
  @Effort				char(1)	= NULL
  , @FulfillmentStatus	int = NULL
  , @SourceCode1		bit	= NULL
  , @SourceCode2		bit = NULL
  , @SourceCode3		bit = NULL
  , @SourceCode4		bit = NULL
  , @SourceCode5		bit = NULL
  , @SourceCode6		bit = NULL
  , @SourceCode7		bit = NULL
  , @SourceCode8		bit = NULL
  , @SourceCode9		bit = NULL
  , @SourceCode10		bit	= NULL
  , @DateFrom			datetime = NULL
  , @DateTo				datetime = NULL 
  , @GroupByDate		bit = NULL 
)
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT COUNT(*) FROM
	(
	SELECT 
		COUNT(t.EFFORT) AS x
	FROM 
	(
		SELECT 
			'1' AS RECORDTYPE			
			, m.MAILRECORD_EFFORT AS EFFORT
			, CASE @SourceCode1  WHEN 1 THEN MAILRECORD_SOURCECODE1 END AS SOURCECODE1
			, CASE @SourceCode2  WHEN 1 THEN MAILRECORD_SOURCECODE2 END AS SOURCECODE2
			, CASE @SourceCode3  WHEN 1 THEN MAILRECORD_SOURCECODE3 END AS SOURCECODE3
			, CASE @SourceCode4  WHEN 1 THEN MAILRECORD_SOURCECODE4 END AS SOURCECODE4
			, CASE @SourceCode5  WHEN 1 THEN MAILRECORD_SOURCECODE5 END AS SOURCECODE5
			, CASE @SourceCode6  WHEN 1 THEN MAILRECORD_SOURCECODE6 END AS SOURCECODE6
			, CASE @SourceCode7  WHEN 1 THEN MAILRECORD_SOURCECODE7 END AS SOURCECODE7
			, CASE @SourceCode8  WHEN 1 THEN MAILRECORD_SOURCECODE8 END AS SOURCECODE8
			, CASE @SourceCode9  WHEN 1 THEN MAILRECORD_SOURCECODE9 END AS SOURCECODE9
			, CASE @SourceCode10 WHEN 1 THEN MAILRECORD_SOURCECODE10 END AS SOURCECODE10
			, CASE @GroupByDate WHEN 1 THEN m.MAILRECORD_BATCHDATE END AS BATCHDATE
			, CASE @GroupByDate WHEN 1 THEN m.MAILRECORD_MAILDATE END AS MAILDATE
			, CASE @GroupByDate WHEN 1 THEN m.MAILRECORD_TRANSACTIONDATE END AS TRANSACTIONDATE
        FROM 
			colpenn_MailRecords AS m
        WHERE
			(@FulfillmentStatus IS NULL OR @FulfillmentStatus = 0 OR @FulfillmentStatus = 2)  
			AND (@DateFrom IS NULL OR m.MAILRECORD_MAILDATE >= @DateFrom) 
			AND (@DateTo IS NULL OR m.MAILRECORD_MAILDATE <= @DateTo)
			AND (@Effort IS NULL OR @Effort = '' OR m.MAILRECORD_EFFORT = @Effort)
         
         UNION ALL
         
		SELECT 
			'2' AS RECORDTYPE			
			, r.REJECTRECORD_EFFORT AS EFFORT
			, CASE @SourceCode1  WHEN 1 THEN r.REJECTRECORD_SOURCECODE1 END AS SOURCECODE1
			, CASE @SourceCode2  WHEN 1 THEN r.REJECTRECORD_SOURCECODE2 END AS SOURCECODE2
			, CASE @SourceCode3  WHEN 1 THEN r.REJECTRECORD_SOURCECODE3 END AS SOURCECODE3
			, CASE @SourceCode4  WHEN 1 THEN r.REJECTRECORD_SOURCECODE4 END AS SOURCECODE4
			, CASE @SourceCode5  WHEN 1 THEN r.REJECTRECORD_SOURCECODE5 END AS SOURCECODE5
			, CASE @SourceCode6  WHEN 1 THEN r.REJECTRECORD_SOURCECODE6 END AS SOURCECODE6
			, CASE @SourceCode7  WHEN 1 THEN r.REJECTRECORD_SOURCECODE7 END AS SOURCECODE7
			, CASE @SourceCode8  WHEN 1 THEN r.REJECTRECORD_SOURCECODE8 END AS SOURCECODE8
			, CASE @SourceCode9  WHEN 1 THEN r.REJECTRECORD_SOURCECODE9 END AS SOURCECODE9
			, CASE @SourceCode10 WHEN 1 THEN r.REJECTRECORD_SOURCECODE10 END AS SOURCECODE10
			, CASE @GroupByDate WHEN 1 THEN r.REJECTRECORD_BATCHDATE END AS BATCHDATE
			, CASE @GroupByDate WHEN 1 THEN r.REJECTRECORD_MAILDATE END AS MAILDATE
			, CASE @GroupByDate WHEN 1 THEN r.REJECTRECORD_TRANSACTIONDATE END AS TRANSACTIONDATE
        FROM 
			colpenn_RejectRecords AS r
         WHERE
			(@FulfillmentStatus IS NULL OR @FulfillmentStatus = 0 OR @FulfillmentStatus = 1)  
			AND (@DateFrom IS NULL OR r.REJECTRECORD_MAILDATE >= @DateFrom) 
			AND (@DateTo IS NULL OR r.REJECTRECORD_MAILDATE <= @DateTo)
			AND (@Effort IS NULL OR @Effort = '' OR r.REJECTRECORD_EFFORT = @Effort)
        ) t
	GROUP BY
			CASE @SourceCode1  WHEN 1 THEN SOURCECODE1  END,
			CASE @SourceCode2  WHEN 1 THEN SOURCECODE2  END,
			CASE @SourceCode3  WHEN 1 THEN SOURCECODE3  END,
			CASE @SourceCode4  WHEN 1 THEN SOURCECODE4  END,
			CASE @SourceCode5  WHEN 1 THEN SOURCECODE5  END,
			CASE @SourceCode6  WHEN 1 THEN SOURCECODE6  END,
			CASE @SourceCode7  WHEN 1 THEN SOURCECODE7  END,
			CASE @SourceCode8  WHEN 1 THEN SOURCECODE8  END,
			CASE @SourceCode9  WHEN 1 THEN SOURCECODE9  END,
			CASE @SourceCode10 WHEN 1 THEN SOURCECODE10 END,
			EFFORT,
			CASE @GroupByDate WHEN 1 THEN t.TRANSACTIONDATE END,
			CASE @GroupByDate WHEN 1 THEN t.MAILDATE END,
			CASE @GroupByDate WHEN 1 THEN t.BATCHDATE END
	) x
;
	
END
GO