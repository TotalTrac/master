﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[colpenn_MailRecordsGetSourceCodeCountByPositionByMailDateRange] (
  @Effort			nchar(1) = NULL
  , @SourceCode1	bit	= NULL
  , @SourceCode2	bit = NULL
  , @SourceCode3	bit = NULL
  , @SourceCode4	bit = NULL
  , @SourceCode5	bit = NULL
  , @SourceCode6	bit = NULL
  , @SourceCode7	bit = NULL
  , @SourceCode8	bit = NULL
  , @SourceCode9	bit = NULL
  , @SourceCode10	bit	= NULL
  , @DateFrom		datetime = NULL
  , @DateTo			datetime = NULL  
)
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		MAILRECORD_EFFORT AS SOURCECODEEFFORT
		, COUNT(*) AS SOURCECODECOUNT,
		CASE @SourceCode1  WHEN 1 THEN MAILRECORD_SOURCECODE1 END AS SOURCECODE1,
		CASE @SourceCode2  WHEN 1 THEN MAILRECORD_SOURCECODE2  END AS SOURCECODE2,
		CASE @SourceCode3  WHEN 1 THEN MAILRECORD_SOURCECODE3  END AS SOURCECODE3,
		CASE @SourceCode4  WHEN 1 THEN MAILRECORD_SOURCECODE4  END AS SOURCECODE4,
		CASE @SourceCode5  WHEN 1 THEN MAILRECORD_SOURCECODE5  END AS SOURCECODE5,
		CASE @SourceCode6  WHEN 1 THEN MAILRECORD_SOURCECODE6  END AS SOURCECODE6,
		CASE @SourceCode7  WHEN 1 THEN MAILRECORD_SOURCECODE7  END AS SOURCECODE7,
		CASE @SourceCode8  WHEN 1 THEN MAILRECORD_SOURCECODE8  END AS SOURCECODE8,
		CASE @SourceCode9  WHEN 1 THEN MAILRECORD_SOURCECODE9  END AS SOURCECODE9,
		CASE @SourceCode10 WHEN 1 THEN MAILRECORD_SOURCECODE10 END AS SOURCECODE10
	FROM 
		[dbo].[colpenn_MailRecords] 
	WHERE
		(@Effort IS NULL OR @Effort = '' OR MAILRECORD_EFFORT = @Effort)
		AND (@DateFrom IS NULL OR MAILRECORD_MAILDATE >= @DateFrom)
		AND (@DateTo IS NULL OR MAILRECORD_MAILDATE <= @DateTo)
	GROUP BY
		MAILRECORD_EFFORT,
		CASE @SourceCode1  WHEN 1 THEN MAILRECORD_SOURCECODE1  END,
		CASE @SourceCode2  WHEN 1 THEN MAILRECORD_SOURCECODE2  END,
		CASE @SourceCode3  WHEN 1 THEN MAILRECORD_SOURCECODE3  END,
		CASE @SourceCode4  WHEN 1 THEN MAILRECORD_SOURCECODE4  END,
		CASE @SourceCode5  WHEN 1 THEN MAILRECORD_SOURCECODE5  END,
		CASE @SourceCode6  WHEN 1 THEN MAILRECORD_SOURCECODE6  END,
		CASE @SourceCode7  WHEN 1 THEN MAILRECORD_SOURCECODE7  END,
		CASE @SourceCode8  WHEN 1 THEN MAILRECORD_SOURCECODE8  END,
		CASE @SourceCode9  WHEN 1 THEN MAILRECORD_SOURCECODE9  END,
		CASE @SourceCode10 WHEN 1 THEN MAILRECORD_SOURCECODE10 END
END
GO