SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CampaignUserGetByID] 
	@ID	int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT 		
	    [Id]
		, [CampaignId]
		, [City]
		, [CompanyName]
		, [Country]
		, [EmailAddress]
		, [FirstName]
		, [IsSignoff]
		, [LastName]
		, [Phone]
		, [PostalCode]
		, [Region]
		, [Salt]
		, [StreetAddress1]
		, [StreetAddress2]
		, [Title]
		, [RowVersion]
		FROM
			[dbo].[CampaignUsers]
		WHERE
			[Id] = @Id;
	

END
GO