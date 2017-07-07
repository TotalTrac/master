﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[colpenn_SourceRecordGetByID]	
	@ID		int
AS
BEGIN
	SET NOCOUNT ON;
    
	SELECT
		SOURCERECORD_ID
		, SOURCERECORD_BIRDTHDATECENTURY
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
	FROM
		[dbo].[colpenn_SourceRecords]
	WHERE
		SOURCERECORD_ID = @ID;
	
END
GO