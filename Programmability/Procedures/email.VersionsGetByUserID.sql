SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[VersionsGetByUserID]
	@ID int
AS
BEGIN
	
	SET NOCOUNT ON;
    	
	SELECT
		e.[Id]
		, e.AutoResponseAlternateDay
		, e.AutoResponseDays
		, e.AutoResponseDontSend
		, e.AutoResponseTime		
		, e.FromAddress
		, e.FromDisplayName	
		, e.JobId	
		, e.LinksRegistered
		, e.MarkupText
		, e.Name
		, e.PlainText
		, e.ReplyToAddress
		, e.ReturnPathAddress
		, e.SubjectLine		
		, e.[RowVersion]
	FROM 
		[email].[Versions] AS e
		INNER JOIN [job].[Jobs] j
			ON e.JobId = j.JOB_ID
		INNER JOIN [dbo].[Relationships] r
			ON j.JOB_CLIENTID = r.RELATIONSHIP_CLIENTID
			AND r.RELATIONSHIP_USERID = @ID;
END
GO