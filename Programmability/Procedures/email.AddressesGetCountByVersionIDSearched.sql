SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[AddressesGetCountByVersionIDSearched]
	@ID	int
  , @SearchText	nvarchar(320)
AS
BEGIN

	SET NOCOUNT ON;

	SELECT 
		COUNT(a.[Id]) 
	FROM 
		[email].[Addresses] AS a
		INNER JOIN [dbo].[CampaignUsers] AS u
			ON a.[TargetId] = u.[Id]
	WHERE 
		(a.[VersionId] = @ID) AND
		(u.[IsSignOff] = 0) AND
		(
			u.[EmailAddress] LIKE '%' + @SearchText + '%'
			OR u.[FirstName] LIKE '%' + @SearchText + '%'
			OR u.[LastName] LIKE '%' + @SearchText + '%'
		);		
END
GO