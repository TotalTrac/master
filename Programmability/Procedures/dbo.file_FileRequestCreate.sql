SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[file_FileRequestCreate] 
	@AccessKey		nvarchar(128)
	, @Created		datetime
	, @CreatedById	int
	, @FolderId		int
	, @Host			nvarchar(4000)
	, @Message		nvarchar(MAX)
	, @SubjectLine	nvarchar(500)
	, @UserId		int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	INSERT [dbo].[file_FileRequests]
	(
		[AccessKey]
		, [Created]
		, [CreatedById]
		, [FolderId]
		, [Host]
		, [Message]
		, [SubjectLine]
		, [UserId]
	)
	OUTPUT
		inserted.[Id] AS ID, NULL AS [VERSION]
	VALUES
	(
		@AccessKey
		, @Created
		, @CreatedById
		, @FolderId
		, @Host
		, @Message
		, @SubjectLine
		, @UserId
	);
END
GO