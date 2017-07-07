SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[PunchesGetByUsername]	
	@Username	nvarchar(100)
	, @From		datetime = NULL
	, @To		datetime = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		ID		
		, JOBID
		, MACHINENAME
		, STARTTIME
		, STOPTIME
		, USERNAME
		, [ROWVERSION]
	FROM
		[job].[Punches]
	WHERE
		USERNAME = @Username
		AND (@From IS NULL OR STARTTIME >= @From)
		AND (@To IS NULL OR STARTTIME <= @To);	
END
GO