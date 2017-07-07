SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[AddressesGetByEmailAddress]	
	@EmailAddress	nvarchar(320)
	, @IsSignoff	bit
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
	where
		u.[EmailAddress] = @EmailAddress
		AND u.[IsSignoff] = @IsSignoff;
END
GO