SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[ForwardGetByID]
	@ID	int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT 
		Id,
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
		Id = @ID;
END
GO