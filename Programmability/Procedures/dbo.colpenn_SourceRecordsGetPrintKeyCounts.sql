﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[colpenn_SourceRecordsGetPrintKeyCounts]
	@BatchDate			bit = NULL
	, @MailDate			bit = NULL
	, @TransactionDate	bit = NULL
	
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @SourceRecords TABLE
	(		
		PRINTKEY			nvarchar(7)
		, BATCHDATE			datetime NULL
		, MAILDATE			datetime NULL
		, TRANSACTIONDATE	datetime NULL
	)
	
	INSERT INTO @SourceRecords
	(
		PRINTKEY
		, BATCHDATE
		, MAILDATE
		, TRANSACTIONDATE
	)
	SELECT REJECTRECORD_PRINTKEY, NULL, NULL, REJECTRECORD_TRANSACTIONDATE FROM [dbo].[colpenn_colpenn_RejectRecords];
	
	INSERT INTO @SourceRecords
	(
		PRINTKEY
		, BATCHDATE
		, MAILDATE
		, TRANSACTIONDATE
	)
	SELECT MAILRECORD_PRINTKEY, MAILRECORD_BATCHDATE, MAILRECORD_MAILDATE, MAILRECORD_TRANSACTIONDATE FROM [dbo].[colpenn_MailRecords];
	
    SELECT 
		COUNT(*) AS PRINTKEY_COUNT
		, PRINTKEY		
		, NULL AS PRINTKEY_EFFORT
		, CASE @TransactionDate WHEN 1 THEN TRANSACTIONDATE END AS PRINTKEY_TRANSACTIONDATE
		, CASE @BatchDate WHEN 1 THEN BATCHDATE END AS PRINTKEY_BATCHDATE
		, CASE @MailDate WHEN 1 THEN MAILDATE END AS PRINTKEY_MAILDATE
	FROM
		@SourceRecords
	GROUP BY
		PRINTKEY
		, CASE @TransactionDate WHEN 1 THEN TRANSACTIONDATE END
		, CASE @BatchDate WHEN 1 THEN BATCHDATE END
		, CASE @MailDate WHEN 1 THEN MAILDATE END	
	;
END
GO