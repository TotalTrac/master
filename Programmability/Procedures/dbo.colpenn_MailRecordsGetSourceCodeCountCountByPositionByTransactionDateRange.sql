SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[colpenn_MailRecordsGetSourceCodeCountCountByPositionByTransactionDateRange] (
  @Effort			char(1) = NULL
  , @SourceCode1	bit	= NULL
  , @SourceCode2	bit = NULL
  , @SourceCode3	bit = NULL
  , @SourceCode4	bit = NULL
  , @SourceCode5	bit = NULL
  , @SourceCode6	bit = NULL
  , @SourceCode7	bit = NULL
  , @SourceCode8	bit = NULL
  , @SourceCode9	bit = NULL
  , @SourceCode10	bit	= NULL
  , @DateFrom		datetime = NULL
  , @DateTo			datetime = NULL  
)
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT COUNT(*) FROM
	(
	SELECT				
		COUNT(MAILRECORD_SOURCECODE1) AS c
	FROM 
		[dbo].[colpenn_MailRecords] 
	WHERE
		(@Effort IS NULL OR @Effort = '' OR MAILRECORD_EFFORT = @Effort)
		AND (@DateFrom IS NULL OR MAILRECORD_TRANSACTIONDATE >= @DateFrom)
		AND (@DateTo IS NULL OR MAILRECORD_TRANSACTIONDATE <= @DateTo)
	GROUP BY
		MAILRECORD_EFFORT,
		CASE @SourceCode1  WHEN 1 THEN MAILRECORD_SOURCECODE1 END,
		CASE @SourceCode2  WHEN 1 THEN MAILRECORD_SOURCECODE2 END,
		CASE @SourceCode3  WHEN 1 THEN MAILRECORD_SOURCECODE3 END,
		CASE @SourceCode4  WHEN 1 THEN MAILRECORD_SOURCECODE4 END,
		CASE @SourceCode5  WHEN 1 THEN MAILRECORD_SOURCECODE5 END,
		CASE @SourceCode6  WHEN 1 THEN MAILRECORD_SOURCECODE6 END,
		CASE @SourceCode7  WHEN 1 THEN MAILRECORD_SOURCECODE7 END,
		CASE @SourceCode8  WHEN 1 THEN MAILRECORD_SOURCECODE8 END,
		CASE @SourceCode9  WHEN 1 THEN MAILRECORD_SOURCECODE9 END,
		CASE @SourceCode10 WHEN 1 THEN MAILRECORD_SOURCECODE10 END
	) c;
END
GO