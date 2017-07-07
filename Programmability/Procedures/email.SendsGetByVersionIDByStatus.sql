SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[SendsGetByVersionIDByStatus] 
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
		INNER JOIN [email].[Addresses] AS a
			ON s.AddressId = a.Id		
	WHERE
		(s.[Status] & @Status > 0) AND
		(a.VersionId = @ID)
	ORDER BY
		s.Id;	
END
GO