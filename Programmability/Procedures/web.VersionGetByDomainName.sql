SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[VersionGetByDomainName]
	@DomainName nvarchar(50)
AS
BEGIN
	
	SET NOCOUNT ON;
    
	SELECT TOP 1
		[Id]
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
		DomainName = @DomainName
	ORDER BY
		[Id] DESC;
END
GO