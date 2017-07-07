SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[VersionUpdate]
	@ID							int	
	, @AutoResponseAlternateDay	int = NULL
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
	, @Version					timestamp
AS
BEGIN
	
	SET NOCOUNT ON;
	
	UPDATE [email].[Versions]
	SET	
		AutoResponseAlternateDay	= @AutoResponseAlternateDay	
		, AutoResponseDays			= @AutoResponseDays
		, AutoResponseDontSend		= @AutoResponseDontSend
		, AutoResponseTime			= @AutoResponseTime		
		, FromAddress				= @FromAddress
		, FromDisplayName			= @FromDisplayName
		, JobId						= @JobID	
		, LinksRegistered			= @LinksRegistered
		, MarkupText				= @MarkupText
		, Name						= @Name
		, PlainText					= @PlainText
		, ReplyToAddress			= @ReplyToAddress
		, ReturnPathAddress			= @ReturnPathAddress
		, SubjectLine				= @SubjectLine		
	OUTPUT
		inserted.Id AS ID, inserted.[RowVersion] AS [VERSION]
	WHERE
		(Id = @ID) AND 
		([RowVersion] = @Version);	
END
GO