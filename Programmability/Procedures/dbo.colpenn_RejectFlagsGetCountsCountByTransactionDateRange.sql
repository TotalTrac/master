SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[colpenn_RejectFlagsGetCountsCountByTransactionDateRange] (  
  @Effort		char(1)		= NULL
  , @DateFrom	datetime	= NULL
  , @DateTo		datetime	= NULL
  , @GroupByDate	bit = NULL  
)
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT COUNT(*) FROM (
		SELECT COUNT(*)	AS x	     
		FROM 
			[dbo].[colpenn_RejectRecords] AS r
		WHERE 
			(@DateFrom IS NULL OR r.REJECTRECORD_TRANSACTIONDATE >= @DateFrom) 
			AND (@DateTo IS NULL OR r.REJECTRECORD_TRANSACTIONDATE <= @DateTo)
			AND (@Effort IS NULL OR @Effort = '' OR r.REJECTRECORD_EFFORT = @Effort)
		GROUP BY
				r.REJECTRECORD_FLAG,
				r.REJECTRECORD_REASON,
				r.REJECTRECORD_EFFORT,
				CASE @GroupByDate WHEN 1 THEN r.REJECTRECORD_TRANSACTIONDATE END,
				CASE @GroupByDate WHEN 1 THEN r.REJECTRECORD_MAILDATE END,
				CASE @GroupByDate WHEN 1 THEN r.REJECTRECORD_BATCHDATE END
	) X;   
	
END
GO