SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[colpenn_SourceRecordCreate]	
	@BirthdateCentury	nchar(2)	= NULL
	, @BirthdateDay		nchar(2)	= NULL
	, @BirthdateMonth	nchar(2)	= NULL
	, @BirthdateYear	nchar(2)	= NULL
	, @CallDateCentury	nchar(2)	= NULL
	, @CallDateDay		nchar(2)	= NULL
	, @CallDateMonth	nchar(2)	= NULL
	, @CallDateYear		nchar(2)	= NULL
	, @CallLetter		nchar(6)	= NULL
	, @CallTimeHour		nchar(2)	= NULL
	, @CallTimeMinute	nchar(2)	= NULL
	, @City				nchar(20)	= NULL
	, @CoverageCode		nchar(1)	= NULL
	, @CreativeCode		nchar(2)	= NULL
	, @FirstName		nchar(20)	= NULL
	, @Gender			nchar(1)	= NULL
	, @LastName			nchar(20)	= NULL
	, @LineOfBusiness	nchar(1)	= NULL			
	, @MemberNumber		nchar(7)	= NULL
	, @MiddleName		nchar(20)	= NULL
	, @PhoneArea		nchar(3)	= NULL
	, @PhoneExchange	nchar(3)	= NULL
	, @PhoneNumber		nchar(4)	= NULL
	, @ProductCode		nchar(2)	= NULL
	, @ReferrerFirst	nchar(20)	= NULL
	, @ReferrerLast		nchar(20)	= NULL
	, @ReferrerSuffix	nchar(4)	= NULL
	, @ReferrerTitle	nchar(4)	= NULL
	, @ReferrerUseINd	nchar(1)	= NULL
	, @RepId			nchar(9)	= NULL
	, @SeqNumber		nchar(7)	= NULL
	, @SourceCode1		nchar(1)	= NULL
	, @SourceCode2		nchar(1)	= NULL
	, @SourceCode3		nchar(1)	= NULL
	, @SourceCode4		nchar(1)	= NULL
	, @SourceCode5		nchar(1)	= NULL
	, @SourceCode6		nchar(1)	= NULL
	, @SourceCode7		nchar(1)	= NULL
	, @SourceCode8		nchar(1)	= NULL
	, @SourceCode9		nchar(1)	= NULL
	, @SourceCode10		nchar(1)	= NULL	
	, @State			nchar(2)	= NULL
	, @Street1			nchar(30)	= NULL
	, @Street2			nchar(30)	= NULL
	, @Suffix			nchar(4)	= NULL
	, @TimeZone			nchar(1)	= NULL
	, @Title			nchar(4)	= NULL
	, @TranType			nchar(1)	= NULL
	, @TransactionDate	datetime
	, @Zip4				nchar(4)	= NULL
	, @Zip5				nchar(5)	= NULL
AS
BEGIN
	SET NOCOUNT ON;
    
	INSERT [dbo].[colpenn_SourceRecords]
	(
		SOURCERECORD_BIRDTHDATECENTURY
		, SOURCERECORD_BIRTHDATEDAY
		, SOURCERECORD_BIRTHDATEMONTH
		, SOURCERECORD_BIRTHDATEYEAR
		, SOURCERECORD_CALLDATECENTURY
		, SOURCERECORD_CALLDATEDAY
		, SOURCERECORD_CALLDATEMONTH
		, SOURCERECORD_CALLDATEYEAR
		, SOURCERECORD_CALLLETTER
		, SOURCERECORD_CALLTIMEHOUR
		, SOURCERECORD_CALLTIMEMINUTE
		, SOURCERECORD_CITY
		, SOURCERECORD_COVERAGECODE
		, SOURCERECORD_CREATIVECODE
		, SOURCERECORD_FIRSTNAME
		, SOURCERECORD_GENDER
		, SOURCERECORD_LASTNAME
		, SOURCERECORD_LINEOFBUSINESS
		, SOURCERECORD_MEMBERNUMBER
		, SOURCERECORD_MIDDLENAME
		, SOURCERECORD_PHONEAREA
		, SOURCERECORD_PHONEEXCHANGE
		, SOURCERECORD_PHONENUMBER
		, SOURCERECORD_PRODUCTCODE
		, SOURCERECORD_REFERRERFIRST
		, SOURCERECORD_REFERRERLAST
		, SOURCERECORD_REFERRERSUFFIX
		, SOURCERECORD_REFERRERTITLE
		, SOURCERECORD_REFERRERUSEIND
		, SOURCERECORD_REPID
		, SOURCERECORD_SEQNUMBER
		, SOURCERECORD_SOURCECODE1
		, SOURCERECORD_SOURCECODE2
		, SOURCERECORD_SOURCECODE3
		, SOURCERECORD_SOURCECODE4
		, SOURCERECORD_SOURCECODE5
		, SOURCERECORD_SOURCECODE6
		, SOURCERECORD_SOURCECODE7
		, SOURCERECORD_SOURCECODE8
		, SOURCERECORD_SOURCECODE9
		, SOURCERECORD_SOURCECODE10		
		, SOURCERECORD_STATE
		, SOURCERECORD_STREET1
		, SOURCERECORD_STREET2
		, SOURCERECORD_SUFFIX
		, SOURCERECORD_TIMEZONE
		, SOURCERECORD_TITLE
		, SOURCERECORD_TRANTYPE
		, SOURCERECORD_TRANSACTIONDATE
		, SOURCERECORD_ZIP4
		, SOURCERECORD_ZIP5
	)
	OUTPUT inserted.SOURCERECORD_ID AS ID, NULL AS [VERSION]
	VALUES
	(
		@BirthdateCentury		
		, @BirthdateDay			
		, @BirthdateMonth		
		, @BirthdateYear		
		, @CallDateCentury		
		, @CallDateDay			
		, @CallDateMonth		
		, @CallDateYear			
		, @CallLetter			
		, @CallTimeHour			
		, @CallTimeMinute		
		, @City					
		, @CoverageCode			
		, @CreativeCode		
		, @FirstName			
		, @Gender				
		, @LastName				
		, @LineOfBusiness					
		, @MemberNumber			
		, @MiddleName			
		, @PhoneArea			
		, @PhoneExchange		
		, @PhoneNumber			
		, @ProductCode			
		, @ReferrerFirst		
		, @ReferrerLast			
		, @ReferrerSuffix		
		, @ReferrerTitle		
		, @ReferrerUseINd		
		, @RepId				
		, @SeqNumber			
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
		, @Suffix				
		, @TimeZone				
		, @Title				
		, @TranType
		, @TransactionDate				
		, @Zip4					
		, @Zip5						
	);	
END
GO