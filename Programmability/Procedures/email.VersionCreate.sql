SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[VersionCreate]
	@AutoResponseAlternateDay	int = NULL
	, @AutoResponseDays			int = NULL
	, @AutoResponseDontSend		int = NULL
	, @AutoResponseTime			time(0) = NULL
	, @FromAddress				nvarchar(320)
	, @FromDisplayName			nvarchar(50)
	, @JobID					int	
	, @LinksRegistered			datetime = NULL
	, @MarkupText				nvarchar(MAX)
	, @Name						nvarchar(100)
	, @PlainText				nvarchar(MAX)
	, @ReplyToAddress			nvarchar(320)
	, @ReturnPathAddress		nvarchar(320)
	, @SubjectLine				nvarchar(100)	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	INSERT [email].[Versions]
	(
		AutoResponseAlternateDay
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
	)
	OUTPUT
		inserted.Id AS ID, inserted.[RowVersion] AS [VERSION]
	VALUES
	(
		@AutoResponseAlternateDay
		, @AutoResponseDays
		, @AutoResponseDontSend
		, @AutoResponseTime		
		, @FromAddress
		, @FromDisplayName
		, @JobID
		, @LinksRegistered
		, @MarkupText
		, @Name
		, @PlainText
		, @ReplyToAddress
		, @ReturnPathAddress
		, @SubjectLine		
	);	
END
GO