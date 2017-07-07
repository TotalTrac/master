SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[VersionCreate]
	@Begin					datetime = NULL		
	, @Created				datetime
	, @CreatedById			int
	, @CustomReportUrl		nvarchar(200) = NULL
	, @DomainName			nvarchar(50)
	, @End					datetime = NULL
	, @IsMobile				bit
	, @JobID				int
	, @Name					nvarchar(100)
	, @TrackAnonymousEvents	bit	
	, @TypeID				int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	INSERT [web].[Versions]
	(	ActiveBegin
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
	)
	OUTPUT
		inserted.[Id] AS ID, inserted.[RowVersion] AS [VERSION]
	VALUES
	(	
		@Begin		
		, @End
		, @Created
		, @CreatedById
		, @CustomReportUrl
		, @DomainName		
		, @IsMobile
		, @JobID
		, @Name
		, @TrackAnonymousEvents
		, @TypeID
	);
END
GO