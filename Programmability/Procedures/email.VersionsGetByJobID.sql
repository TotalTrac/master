SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[VersionsGetByJobID]
	@ID	int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT 
		Id
		, AutoResponseAlternateDay
		, AutoResponseDays
		, AutoResponseDontSend
		, AutoResponseTime		
		, FromAddress
		, FromDisplayName
		, JobId		
		, LinksRegistered
		, MarkupText
		, Name
		, PlainText
		, ReplyToAddress
		, ReturnPathAddress
		, SubjectLine		
		, [RowVersion]
	FROM 
		[email].[Versions]
	WHERE 
		JobId = @ID;
	
END
GO