SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[SubscribersGetCountByClientID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		COUNT(s.Id)
	FROM 
		[email].[Subscribers] AS s
	WHERE				
		s.ClientId = @ID;
END
GO