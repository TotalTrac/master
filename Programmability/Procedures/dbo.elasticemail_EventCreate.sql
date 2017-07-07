SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[elasticemail_EventCreate] 
	@Account		nvarchar(320)
	, @Category		nvarchar(50) = NULL
	, @Channel		nvarchar(200) = NULL		
	, @DateTime		datetime
	, @Postback		nvarchar(MAX)
	, @SendId		int
	, @Status		nvarchar(50)
	, @Subject		nvarchar(100)
	, @Target		nvarchar(500) = NULL
	, @To			nvarchar(320)
	, @Transaction	char(36)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	INSERT [dbo].[elasticemail_Events]
	(
		[Account]
		, [Category]
		, [Channel]
		, [DateTime]
		, [Postback]
		, [SendId]
		, [Status]
		, [Subject]
		, [Target]
		, [To]
		, [Transaction]	
	) 
	OUTPUT
		inserted.[ID] AS ID, NULL AS [VERSION]
	VALUES 
	(		
		@Account
		, @Category
		, @Channel
		, @DateTime
		, @Postback
		, @SendId
		, @Status
		, @Subject
		, @Target
		, @To
		, @Transaction
	);
END
GO