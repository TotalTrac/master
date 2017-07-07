SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[SubscribersGetCount]
	
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		COUNT(s.Id)
	FROM 
		[email].[Subscribers] AS s;
END
GO