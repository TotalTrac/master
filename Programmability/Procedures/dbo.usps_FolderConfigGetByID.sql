SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usps_FolderConfigGetByID]
	@ID int
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
		[dbo].[usps_FolderConfigs]
	WHERE
		[Id] = @ID;
END
GO