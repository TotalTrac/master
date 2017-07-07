SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usps_FolderConfigGetByLettershopIDByClientID]
	@LettershopID	int
	, @ClientID		int = NULL	
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
		[LettershopId] = @LettershopID
		AND (([ClientId] IS NULL AND @ClientID IS NULL) OR [ClientId] = @ClientID)
END
GO