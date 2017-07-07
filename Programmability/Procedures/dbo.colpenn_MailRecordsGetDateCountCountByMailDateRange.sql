SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[colpenn_MailRecordsGetDateCountCountByMailDateRange] (
  @From	datetime	= NULL
  , @To		datetime	= NULL  
)
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		Count(MAILRECORD_MAILDATE)
	FROM 
		[dbo].[colpenn_MailRecords] 
	WHERE
		(@From IS NULL OR MAILRECORD_MAILDATE >= @From)
		AND (@To IS NULL OR MAILRECORD_MAILDATE <= @To)
	GROUP BY
		MAILRECORD_MAILDATE
END
GO