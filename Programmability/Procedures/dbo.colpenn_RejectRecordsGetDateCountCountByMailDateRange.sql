SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[colpenn_RejectRecordsGetDateCountCountByMailDateRange] (
  @From	datetime	= NULL
  , @To		datetime	= NULL  
)
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		Count(REJECTRECORD_MAILDATE)
	FROM 
		[dbo].[colpenn_RejectRecords] 
	WHERE
		(@From IS NULL OR REJECTRECORD_MAILDATE >= @From)
		AND (@To IS NULL OR REJECTRECORD_MAILDATE <= @To)
	GROUP BY
		REJECTRECORD_MAILDATE
END
GO