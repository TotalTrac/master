SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[SendsGetPending]
	@BatchSize	int	 = 5000
AS
BEGIN
	
	SET NOCOUNT ON;
		
	UPDATE TOP (@BatchSize)  
		[email].[Sends] WITH (ROWLOCK, UPDLOCK, READPAST)
	SET
		[Status] = 1
	OUTPUT
		inserted.Id
		, inserted.AddressId
		, inserted.[Send]
		, inserted.[Sent]
		, inserted.[Status]
		, inserted.[RowVersion]		
	WHERE
		([Send] <= GETUTCDATE())
		AND	[Status] = 0;	
END
GO