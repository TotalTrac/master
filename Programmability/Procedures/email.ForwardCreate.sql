SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[ForwardCreate]	
	@EmailAddress	nvarchar(320)
	, @Forwarded	datetime
	, @ForwarderID	int
	, @IPAddress	varbinary(8)	
	, @SendStatus	int
	, @Sent			datetime = NULL	
	, @VersionID	int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	INSERT [email].[Forwards]
	(		
		EmailAddress
		, Forwarded		
		, ForwarderId
		, IpAddress
		, SendStatus
		, [Sent]
		, VersionId
	)
	OUTPUT
		inserted.Id AS ID, inserted.[RowVersion] AS [VERSION]
	VALUES
	(		
		@EmailAddress
		, @Forwarded
		, @ForwarderID
		, @IPAddress
		, @SendStatus
		, @Sent
		, @VersionID
	);
END
GO