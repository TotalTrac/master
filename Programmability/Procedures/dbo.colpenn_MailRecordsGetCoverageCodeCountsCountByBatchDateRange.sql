SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[colpenn_MailRecordsGetCoverageCodeCountsCountByBatchDateRange] (
  @Effort		char(1)		= NULL  
  , @DateFrom	datetime	= NULL
  , @DateTo		datetime	= NULL  
)
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		COUNT(*)
	FROM
	(
		SELECT
			MAILRECORD_COVERAGECODE
		FROM 
			[dbo].[colpenn_MailRecords] 
		WHERE
			(@Effort IS NULL OR @Effort = '' OR MAILRECORD_EFFORT = @Effort)
			AND (@DateFrom IS NULL OR MAILRECORD_BATCHDATE >= @DateFrom)
			AND (@DateTo IS NULL OR MAILRECORD_BATCHDATE <= @DateTo)
		GROUP BY
			MAILRECORD_COVERAGECODE
			, MAILRECORD_TRANSACTIONDATE
			, MAILRECORD_MAILDATE
			, MAILRECORD_EFFORT
	) c;
END
GO