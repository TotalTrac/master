SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[AddressesGetByVersionIDNotClickedByDateRange]	
	 @ID	int
	 , @Start	datetime
	 , @End		datetime
AS
BEGIN
	SET NOCOUNT ON;
        
	SELECT 
		a.[Id]
		, u.[City]
		, u.[CompanyName]
		, u.[Country]		
		, u.[EmailAddress]
		, u.[FirstName]
		, u.[IsSignoff]
		, u.[LastName]				
		, a.[MarkupText]
		, u.[Phone]
		, u.[PostalCode]
		, a.[PlainText]
		, u.[Region]
		, u.[Salt]
		, u.[StreetAddress1]
		, u.[StreetAddress2]
		, a.[Type]
		, a.[VersionId]
		, a.[RowVersion]
	FROM 
		[email].[Addresses] AS a 
		INNER JOIN [dbo].[CampaignUsers] AS u
			ON a.[TargetId] = u.[Id]
		LEFT JOIN [email].[Clicks] AS c
			ON a.[Id] = c.[AddressId]
	WHERE 
		(a.[VersionId] = @ID)
		AND (u.[IsSignoff] = 0)
		AND (c.[Id] IS NULL)
		AND ((@Start IS NULL OR c.[Datetime] >= @Start)	AND (@End IS NULL OR c.[Datetime] <= @End));		
END
GO