SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ExceptionItemCreate] 
	@Data				nvarchar(MAX) = NULL
	, @DateTime			datetime
	, @ExceptionStack	nvarchar(MAX)
	, @HostName			nvarchar(50) = NULL
	, @IPAddress		varbinary(8)
	, @Message			nvarchar(MAX)
	, @Query			nvarchar(2000) = NULL
	, @ResponseStatus	int = NULL
	, @ServerName		nvarchar(50)
	, @Source			nvarchar(100)
	, @Target			nvarchar(500) = NULL
	, @Type				nvarchar(50)
	, @Url				nvarchar(4000) = NULL
	, @UserAgent		nvarchar(500) = NULL
	, @UserID			int	= NULL
AS
BEGIN

	SET NOCOUNT ON;
	
	INSERT Exceptions
	(
		EXCEPTION_DATA
		, EXCEPTION_DATETIME
		, EXCEPTION_EXCEPTIONSTACK
		, EXCEPTION_HOSTNAME
		, EXCEPTION_IPADDRESS
		, EXCEPTION_MESSAGE
		, EXCEPTION_QUERY
		, EXCEPTION_RESPONSESTATUS
		, EXCEPTION_SERVERNAME
		, EXCEPTION_SOURCE
		, EXCEPTION_TARGET
		, EXCEPTION_TYPE
		, EXCEPTION_URL
		, EXCEPTION_USERAGENT
		, EXCEPTION_USERID
	)
	OUTPUT
		inserted.EXCEPTION_ID AS ID, NULL AS [VERSION]
	VALUES
	(
		@Data
		, @DateTime
		, @ExceptionStack
		, @HostName
		, @IPAddress
		, @Message
		, @Query
		, @ResponseStatus
		, @ServerName
		, @Source
		, @Target
		, @Type
		, @Url
		, @UserAgent
		, @UserID
	);	
END
GO