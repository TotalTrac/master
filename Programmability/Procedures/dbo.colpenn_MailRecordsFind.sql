SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[colpenn_MailRecordsFind]
	@BatchDateFrom			datetime	= NULL	
	, @BatchDateTo			datetime	= NULL	
	, @CoverageCode			char(1)		= NULL
	, @Effort				char(1)		= NULL
	, @MailDateFrom			datetime	= NULL
	, @MailDateTo			datetime	= NULL
	, @PrintKey				nvarchar(7)	= NULL
	, @SourceCode1			nchar(1)	= NULL
	, @SourceCode2			nchar(1)	= NULL
	, @SourceCode3			nchar(1)	= NULL
	, @SourceCode4			nchar(1)	= NULL
	, @SourceCode5			nchar(1)	= NULL
	, @SourceCode6			nchar(1)	= NULL
	, @SourceCode7			nchar(1)	= NULL
	, @SourceCode8			nchar(1)	= NULL
	, @SourceCode9			nchar(1)	= NULL
	, @SourceCode10			nchar(1)	= NULL
	, @TransactionDateFrom	datetime	= NULL
	, @TransactionDateTo	datetime	= NULL
AS
BEGIN
	SET NOCOUNT ON;
    
	SELECT
		MAILRECORD_ID
		, MAILRECORD_BATCHDATE
		, MAILRECORD_COVERAGECODE
		, MAILRECORD_EFFORT
		, MAILRECORD_MAILDATE
		, MAILRECORD_PRINTKEY 
		, MAILRECORD_SOURCECODE1
		, MAILRECORD_SOURCECODE2
		, MAILRECORD_SOURCECODE3
		, MAILRECORD_SOURCECODE4
		, MAILRECORD_SOURCECODE5
		, MAILRECORD_SOURCECODE6
		, MAILRECORD_SOURCECODE7
		, MAILRECORD_SOURCECODE8
		, MAILRECORD_SOURCECODE9
		, MAILRECORD_SOURCECODE10
		, MAILRECORD_TRANSACTIONDATE		
	FROM
		[dbo].[colpenn_MailRecords]
	WHERE
		(@BatchDateFrom IS NULL OR MAILRECORD_BATCHDATE >= @BatchDateFrom)
		 AND (@BatchDateTo IS NULL OR MAILRECORD_BATCHDATE <= @BatchDateTo)
		 AND (@CoverageCode IS NULL OR @CoverageCode = '' OR MAILRECORD_COVERAGECODE = @CoverageCode)
		 AND (@Effort IS NULL OR @Effort = '' OR MAILRECORD_EFFORT = @Effort)
		 AND (@MailDateFrom IS NULL OR MAILRECORD_MAILDATE >= @MailDateFrom)
		 AND (@MailDateTo IS NULL OR MAILRECORD_MAILDATE <= @MailDateTo)
		 AND (@SourceCode1 IS NULL OR @SourceCode1 = '' OR MAILRECORD_SOURCECODE1 = @SourceCode1)
		 AND (@SourceCode2 IS NULL OR @SourceCode2 = '' OR MAILRECORD_SOURCECODE2 = @SourceCode2)
		 AND (@SourceCode3 IS NULL OR @SourceCode3 = '' OR MAILRECORD_SOURCECODE3 = @SourceCode3)
		 AND (@SourceCode4 IS NULL OR @SourceCode4 = '' OR MAILRECORD_SOURCECODE4 = @SourceCode4)
		 AND (@SourceCode5 IS NULL OR @SourceCode5 = '' OR MAILRECORD_SOURCECODE5 = @SourceCode5)
		 AND (@SourceCode6 IS NULL OR @SourceCode6 = '' OR MAILRECORD_SOURCECODE6 = @SourceCode6)
		 AND (@SourceCode7 IS NULL OR @SourceCode7 = '' OR MAILRECORD_SOURCECODE7 = @SourceCode7)
		 AND (@SourceCode8 IS NULL OR @SourceCode8 = '' OR MAILRECORD_SOURCECODE8 = @SourceCode8)
		 AND (@SourceCode9 IS NULL OR @SourceCode9 = '' OR MAILRECORD_SOURCECODE9 = @SourceCode9)
		 AND (@SourceCode10 IS NULL OR @SourceCode10 = '' OR MAILRECORD_SOURCECODE10 = @SourceCode10)
		 AND (@TransactionDateFrom IS NULL OR MAILRECORD_TRANSACTIONDATE >= @TransactionDateFrom)
		 AND (@TransactionDateTo IS NULL OR MAILRECORD_TRANSACTIONDATE <= @TransactionDateTo)
	ORDER BY
		MAILRECORD_ID;	
	
END
GO