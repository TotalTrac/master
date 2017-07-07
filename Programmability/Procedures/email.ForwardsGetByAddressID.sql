SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[ForwardsGetByAddressID]
	@ID	int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT 
		Id,
		VersionId,
		EmailAddress
		Forwarded,
		ForwarderId,
		IpAddress,
		SendStatus,
		[Sent],
		[RowVersion]
	FROM 
		[email].[Forwards]
	WHERE
		ForwarderId = @ID
	ORDER BY 
		Id;
END
GO