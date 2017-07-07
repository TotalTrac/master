SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[VersionsGetByJobID]
	@ID int
AS
BEGIN
	
	SET NOCOUNT ON;
    
	SELECT
		Id
		, ActiveBegin
		, ActiveEnd
		, Created
		, CreatedById
		, CustomReportUrl
		, DomainName
		, IsMobile
		, JobId
		, Name
		, TrackAnonymousEvents
		, TypeId
		, [RowVersion]
	FROM 
		[web].[Versions] 
	WHERE 
		JobId = @ID;
END
GO