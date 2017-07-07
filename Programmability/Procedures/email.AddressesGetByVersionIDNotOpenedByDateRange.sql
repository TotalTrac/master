SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[AddressesGetByVersionIDNotOpenedByDateRange]	
	 @ID		int
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
		LEFT JOIN [email].[Opens] AS o
			ON a.[Id] = o.[AddressId]
	WHERE 
		a.[VersionId] = @ID
		AND u.[IsSignoff] = 0
		AND o.[Id] IS NULL
		AND ((@Start IS NULL OR o.[Datetime] >= @Start) AND (@End IS NULL OR o.[Datetime] <= @End));
END
GO