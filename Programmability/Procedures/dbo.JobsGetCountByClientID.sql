SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[JobsGetCountByClientID]
	@ID	int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT 
		COUNT(m.JOB_ID) 
	FROM
		[dbo].[Jobs] AS m
		INNER JOIN [job].[Jobs] AS j
			ON m.JOB_JOBID = j.JOB_ID
	WHERE
		j.JOB_CLIENTID = @ID;
END
GO