SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[VersionsGetByUserID]
	@ID int
AS
BEGIN
	
	SET NOCOUNT ON;
    	
	SELECT
		w.[Id]
      ,w.[ActiveBegin]
      ,w.[ActiveEnd]
      ,w.[Created]
      ,w.[CreatedById]
      ,w.[CustomReportUrl]
      ,w.[DomainName]
      ,w.[IsMobile]
      ,w.[JobId]
      ,w.[Name]
      ,w.[TrackAnonymousEvents]
      ,w.[TypeId]
      ,w.[RowVersion]
	FROM 
		[web].[Versions] AS w
		INNER JOIN [job].[Jobs] j
			ON w.JobId = j.JOB_ID
		INNER JOIN [dbo].[Relationships] r
			ON j.JOB_CLIENTID = r.RELATIONSHIP_CLIENTID
			AND r.RELATIONSHIP_USERID = @ID;
END
GO