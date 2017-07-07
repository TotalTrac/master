SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[PostageRequestCreate]
	@AmountRequested	decimal(11,2)
	, @ClientID			int
	, @Expected			date = NULL
	, @MailingID		int = NULL
	, @Notes			nvarchar(1000) = NULL
	, @Requested		datetime
	, @RequestedByID	int	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	INSERT [usps].[PostageRequests]
	(
		AMOUNTREQUESTED
		, CLIENTID
		, EXPECTED		
		, MAILINGID
		, NOTES
		, REQUESTED
		, REQUESTEDBYID		
	)
	OUTPUT		
		inserted.ID AS ID, inserted.[ROWVERSION] AS [VERSION]
	VALUES
	(
		@AmountRequested
		, @ClientID
		, @Expected		
		, @MailingID
		, @Notes
		, @Requested
		, @RequestedByID		
	);
END
GO