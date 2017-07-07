SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[PunchesGetOpenByUsername]	
	@Username	nvarchar(100)
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
		AND STOPTIME IS NULL;
	
END
GO