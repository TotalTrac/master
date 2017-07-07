SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [email].[ForwardsGetPending] 
	
AS
BEGIN
	
	SET NOCOUNT ON;
    
	SELECT 
		Id,		
		EmailAddress,
		Forwarded,
		ForwarderId,
		IpAddress,
		SendStatus,
		[Sent],
		VersionId,
		[RowVersion]
	FROM
		[email].[Forwards]
	WHERE
		(SendStatus = 0) AND
		([Sent] IS NULL)
	ORDER BY
		Id;
		
END
GO