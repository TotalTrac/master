﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[colpenn_MailRecordsGetDateCountByMailDateRangePaged] 
(
	@From			datetime	= NULL
	, @To			datetime	= NULL 
	, @Page			int
	, @RowsPerPage	int  
)
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @StartRow int,
			@EndRow int;

	SET @StartRow = ((@Page - 1) * @RowsPerPage) + 1;
	SET @EndRow = @StartRow + @RowsPerPage - 1;
		
	SELECT 
		[DATE] AS [DATE]
		, [COUNT] AS [COUNT]
	FROM 
	(
		SELECT 
			ROW_NUMBER() OVER (ORDER BY MAILRECORD_MAILDATE) AS RESULTNUM
			, MAILRECORD_MAILDATE AS [DATE]
			, COUNT(*) AS [COUNT]
		FROM 
			[dbo].[colpenn_MailRecords] 
		WHERE
			(@From IS NULL OR MAILRECORD_MAILDATE >= @From)
			AND (@To IS NULL OR MAILRECORD_MAILDATE <= @To)
		GROUP BY
			MAILRECORD_MAILDATE
	)	
	AS NumberResults
	WHERE RESULTNUM BETWEEN @StartRow AND @EndRow;
END
GO