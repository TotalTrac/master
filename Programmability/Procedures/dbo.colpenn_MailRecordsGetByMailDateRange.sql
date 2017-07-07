﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[colpenn_MailRecordsGetByMailDateRange]
	@From	datetime = NULL
	, @To	datetime = NULL
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
		@From IS NULL OR MAILRECORD_MAILDATE >= @From
		AND @To IS NULL OR MAILRECORD_MAILDATE <= @To
	ORDER BY
		MAILRECORD_ID;
END
GO