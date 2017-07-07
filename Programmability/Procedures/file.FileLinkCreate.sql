SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [file].[FileLinkCreate]
	@Created		datetime
	, @CreatedByID	int
	, @EmailAddress	nvarchar(320)
	, @FileID		int
	, @Key			char(100)	
AS
BEGIN
	SET NOCOUNT ON;
	
	INSERT [file].[FileLinks]
	(
		LINK_CREATED
		, LINK_CREATEDBYID
		, LINK_EMAILADDRESS
		, LINK_FILEID
		, LINK_KEY		
	)
	OUTPUT inserted.LINK_ID AS [ID], NULL AS [Version]
	VALUES
	(
		@Created
		, @CreatedByID
		, @EmailAddress
		, @FileID
		, @Key		
	);
END
GO