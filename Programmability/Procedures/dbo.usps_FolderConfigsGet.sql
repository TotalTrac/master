SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usps_FolderConfigsGet]
	
AS
BEGIN
	
	SET NOCOUNT ON;

    SELECT
		[Id]
		, [ClientId]
		, [Created]
		, [CreatedById]
		, [IsActive]
		, [LettershopId]
		, [Path]
		, [ValidationFlags]
		, [RowVersion]
	FROM
		[dbo].[usps_FolderConfigs];
END
GO