SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[PostageRequestsGetByClientID]
	@ID int
AS
BEGIN
	SET NOCOUNT ON;
    
	SELECT
		pr.ID
		, pr.AMOUNTREQUESTED
		, pr.CLIENTID
		, pr.EXPECTED		
		, pr.MAILINGID
		, pr.NOTES
		, pr.REQUESTED
		, pr.REQUESTEDBYID
		, pr.[ROWVERSION]
	FROM 
		[usps].[PostageRequests] AS pr 
		INNER JOIN [dbo].[Jobs] AS m
			ON pr.MAILINGID = m.JOB_ID
		INNER JOIN [job].[Jobs] AS j
			ON m.JOB_JOBID = j.JOB_ID
	WHERE	
		j.JOB_CLIENTID = @ID
	ORDER BY
		pr.ID;	
END
GO