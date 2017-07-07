SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[colpenn_MailRecordsGetDateCountCountByBatchDateRange] (
  @From	datetime	= NULL
  , @To		datetime	= NULL  
)
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		Count(MAILRECORD_BATCHDATE)
	FROM 
		[dbo].[colpenn_MailRecords] 
	WHERE
		(@From IS NULL OR MAILRECORD_BATCHDATE >= @From)
		AND (@To IS NULL OR MAILRECORD_BATCHDATE <= @To)
	GROUP BY
		MAILRECORD_BATCHDATE
END
GO