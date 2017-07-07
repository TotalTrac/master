SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[SendsGet]
	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT 
		Id
		, AddressId		
		, [Send]
		, [Sent]
		, [Status]
		, [RowVersion] 
	FROM 
		[email].[Sends]
	ORDER BY 
		Id;
END
GO