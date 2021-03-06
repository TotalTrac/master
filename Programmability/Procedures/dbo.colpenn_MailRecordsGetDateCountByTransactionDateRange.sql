﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[colpenn_MailRecordsGetDateCountByTransactionDateRange] (
  @From	datetime	= NULL
  , @To		datetime	= NULL  
)
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		MAILRECORD_TRANSACTIONDATE AS [DATE]
		, COUNT(*) AS [COUNT]
	FROM 
		[dbo].[colpenn_MailRecords] 
	WHERE
		(@From IS NULL OR MAILRECORD_TRANSACTIONDATE >= @From)
		AND (@To IS NULL OR MAILRECORD_TRANSACTIONDATE <= @To)
	GROUP BY
		MAILRECORD_TRANSACTIONDATE
END
GO