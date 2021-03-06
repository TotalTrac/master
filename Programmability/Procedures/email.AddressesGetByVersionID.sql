﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[AddressesGetByVersionID]
	@ID	int
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
		, u.[Title]
		, a.[TargetId]		
		, a.[Type]
		, a.[VersionId]
		, a.[RowVersion]
	FROM 
		[email].[Addresses] AS a 
		INNER JOIN [dbo].[CampaignUsers] AS u
			ON a.[TargetId] = u.[Id]
	WHERE 
		a.[VersionId] = @ID;		
END
GO