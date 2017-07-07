﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[colpenn_RejectRecordGetByID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		REJECTRECORD_ID
		, REJECTRECORD_AGE
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
    FROM
		[dbo].[colpenn_RejectRecords]
	WHERE
		REJECTRECORD_ID = @ID;
END
GO