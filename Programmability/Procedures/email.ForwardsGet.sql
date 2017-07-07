SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[ForwardsGet]
	
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
	ORDER BY 
		Id;
END
GO