﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[colpenn_SourceRecordsGetDateCountCountByTransactionDateRange] (
  @From	datetime	= NULL
  , @To		datetime	= NULL  
)
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		Count(SOURCERECORD_TRANSACTIONDATE)
	FROM 
		[dbo].[colpenn_SourceRecords] 
	WHERE
		(@From IS NULL OR SOURCERECORD_TRANSACTIONDATE >= @From)
		AND (@To IS NULL OR SOURCERECORD_TRANSACTIONDATE <= @To)
	GROUP BY
		SOURCERECORD_TRANSACTIONDATE
END
GO