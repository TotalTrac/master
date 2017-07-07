SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[ForwardsGetCountByAddressID] 
	@ID int
AS
BEGIN
	
    SELECT 
		COUNT(Id) 
	FROM 
		[email].[Forwards]
	WHERE
		ForwarderId = @ID;
END
GO