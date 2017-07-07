SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[AddressesGetUnsent]
	@FilterBy		int
	, @ID			int
	, @IsSignoff	bit
AS
BEGIN
	SET NOCOUNT ON;
	
	-- @FilterBy
	-- 0 = Campaign
	-- 1 = Version

	DECLARE @sql nvarchar(MAX);

	SELECT @sql = 'SELECT 
			a.Id				
			, a.CompanyName
			, a.CustomField1
			, a.CustomField2
			, a.CustomField3
			, a.CustomField4
			, a.CustomField5
			, a.EmailAddress
			, a.FirstName
			, a.LastName
			, a.MarkupText
			, a.Salt					
			, a.SignOff		
			, a.[Type]
			, a.VersionId		
			, a.[RowVersion]
		FROM 
			[email].[Addresses] AS a';
	
	SELECT @sql = @sql +
		CASE @FilterBy 
			WHEN 0 THEN
				 ' INNER JOIN [email].[Versions] AS v ON a.VersionId = v.Id'
			WHEN 1 THEN
				''
		END

	IF @IsSignoff = 0 
		SELECT @sql = @sql + ' LEFT JOIN [email].[Sends] AS s ON a.Id = s.AddressId WHERE s.Id IS NULL AND'
	ELSE
		SELECT @sql = @sql + ' WHERE';

	SELECT @sql = @sql + ' @IsSignoff = a.SignOff';

	SELECT @sql = @sql +
		CASE @FilterBy 
			WHEN 0 THEN
				' AND v.CampaignId = @ID'
			WHEN 1 THEN
				' AND a.VersionId = @ID'
		END
		
		

	DECLARE @paramlist  nvarchar(4000);
	SELECT @paramlist = '@ID int, @IsSignoff bit';

	EXEC sp_executesql @sql, @paramlist, @ID, @IsSignoff;	
END
GO