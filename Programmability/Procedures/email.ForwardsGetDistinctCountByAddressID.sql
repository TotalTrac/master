SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[ForwardsGetDistinctCountByAddressID] 
	@ID	int
AS
BEGIN
	SELECT 
		COUNT(DISTINCT(ForwarderId)) 
	FROM 
		[email].[Forwards]
	WHERE 
		ForwarderId = @ID;
END
GO