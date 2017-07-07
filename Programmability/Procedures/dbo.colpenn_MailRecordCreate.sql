SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[colpenn_MailRecordCreate]
	@BatchDate			datetime	= NULL	
	, @CoverageCode		char(1)		= NULL
	, @Effort			char(1)		= NULL
	, @MailDate			datetime	= NULL
	, @PrintKey			nvarchar(7)	= NULL
	, @SourceCode1		nchar(1)
	, @SourceCode2		nchar(1)
	, @SourceCode3		nchar(1)
	, @SourceCode4		nchar(1)
	, @SourceCode5		nchar(1)
	, @SourceCode6		nchar(1)
	, @SourceCode7		nchar(1)
	, @SourceCode8		nchar(1)
	, @SourceCode9		nchar(1)
	, @SourceCode10		nchar(1)
	, @TransactionDate	datetime = NULL
AS
BEGIN
	SET NOCOUNT ON;
    
	INSERT [dbo].[colpenn_MailRecords]
	(
		MAILRECORD_BATCHDATE
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
	)
	OUTPUT inserted.MAILRECORD_ID AS ID, NULL AS [VERSION]
	VALUES
	(
		@BatchDate
		, @CoverageCode
		, @Effort
		, @MailDate
		, @PrintKey
		, @SourceCode1
		, @SourceCode2
		, @SourceCode3
		, @SourceCode4
		, @SourceCode5
		, @SourceCode6
		, @SourceCode7
		, @SourceCode8
		, @SourceCode9
		, @SourceCode10
		, @TransactionDate		
	);
	
	RETURN SCOPE_IDENTITY();
	
END
GO