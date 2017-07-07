SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[SendsGetByAddressIDByStatus] 
	@ID			int
	, @Status	int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 			 
		s.Id 
		, s.AddressId		
		, s.[Send]
		, s.[Sent]
		, s.[Status]
		, s.[RowVersion]			
	FROM 
		[email].[Sends] AS s		
	WHERE
		(s.AddressId = @ID)
		AND (s.[Status] & @Status > 0)		
	ORDER BY
		s.Id;
	
END
GO