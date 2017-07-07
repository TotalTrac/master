SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[colpenn_RejectRecordCreate]	
	@Age				int				= NULL
	, @BatchDate		datetime		= NULL
	, @Birthdate		datetime		= NULL
	, @City				nvarchar(20)	= NULL
	, @CoverageCode		char(1)			= NULL
	, @Effort			char(1)			= NULL
	, @Flag				char(1)			= NULL
	, @FullName			nvarchar(50)	= NULL
	, @Gender			char(1)			= NULL
	, @MailDate			datetime		= NULL
	, @MemberNumber		nvarchar(7)		= NULL
	, @PhoneNumber		nvarchar(15)	= NULL
	, @PrintKey			nvarchar(7)		= NULL
	, @Reason			nvarchar(30)	= NULL
	, @ReferrerFullName	nvarchar(50)	= NULL
	, @ReferrerFlag		char(1)			= NULL		
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
	, @State			nvarchar(2)		= NULL
	, @Street1			nvarchar(40)	= NULL
	, @Street2			nvarchar(40)	= NULL
	, @TransactionDate	datetime		
	, @ZipCode			nchar(9)		= NULL
AS
BEGIN
	SET NOCOUNT ON;
    
	INSERT [dbo].[colpenn_RejectRecords]
	(
		REJECTRECORD_AGE
		, REJECTRECORD_BATCHDATE
		, REJECTRECORD_BIRTHDATE		
		, REJECTRECORD_CITY
		, REJECTRECORD_COVERAGECODE
		, REJECTRECORD_EFFORT
		, REJECTRECORD_FLAG
		, REJECTRECORD_FULLNAME
		, REJECTRECORD_GENDER
		, REJECTRECORD_MAILDATE
		, REJECTRECORD_MEMBERNUMBER
		, REJECTRECORD_PHONENUMBER
		, REJECTRECORD_PRINTKEY
		, REJECTRECORD_REASON
		, REJECTRECORD_REFERRERFLAG
		, REJECTRECORD_REFERRERFULLNAME		
		, REJECTRECORD_SOURCECODE1
		, REJECTRECORD_SOURCECODE2
		, REJECTRECORD_SOURCECODE3
		, REJECTRECORD_SOURCECODE4
		, REJECTRECORD_SOURCECODE5
		, REJECTRECORD_SOURCECODE6
		, REJECTRECORD_SOURCECODE7
		, REJECTRECORD_SOURCECODE8
		, REJECTRECORD_SOURCECODE9
		, REJECTRECORD_SOURCECODE10
		, REJECTRECORD_STATE
		, REJECTRECORD_STREET1
		, REJECTRECORD_STREET2
		, REJECTRECORD_TRANSACTIONDATE
		, REJECTRECORD_ZIPCODE
	)
	OUTPUT inserted.REJECTRECORD_ID AS ID, NULL AS [VERSION]
	VALUES
	(
		@Age
		, @BatchDate
		, @Birthdate
		, @City
		, @CoverageCode
		, @Effort
		, @Flag
		, @FullName
		, @Gender
		, @MailDate
		, @MemberNumber
		, @PhoneNumber
		, @PrintKey
		, @Reason
		, @ReferrerFlag
		, @ReferrerFullName		
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
		, @State
		, @Street1
		, @Street2
		, @TransactionDate
		, @ZipCode
	);
	
	RETURN SCOPE_IDENTITY();
	
END
GO