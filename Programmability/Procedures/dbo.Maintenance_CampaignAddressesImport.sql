SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Maintenance_CampaignAddressesImport]
	@FilePath	nvarchar(1024)
AS
BEGIN
	
	DECLARE @Sql nvarchar(2000);
	
	SET @Sql = 'BULK INSERT CampaignAddresses FROM ' + @FilePath + ' WITH ( FIELDTERMINATOR = '','', ROWTERMINATOR = ''\n'' );';
	
	EXEC(@Sql);
END
GO