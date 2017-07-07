SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [email].[ForwardGetNextUnsent]
	
AS
BEGIN
	
	SET NOCOUNT ON;

    SELECT TOP 1
		Id
		VersionId,
		EmailAddress,
		Forwarded,
		ForwarderId,
		IpAddress,
		SendStatus,
		[Sent],
		[RowVersion]
    FROM
		[email].[Forwards]
	WHERE
		(SendStatus = 0) AND
		([Sent] = NULL);
END
GO