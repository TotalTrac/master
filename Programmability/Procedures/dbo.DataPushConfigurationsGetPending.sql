SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[DataPushConfigurationsGetPending] 
	
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @Now datetime = GETUTCDATE();

    UPDATE [dbo].[DataPushConfigurations]
	SET
		[LastRun] = @Now
	OUTPUT
		inserted.[Id]
		, inserted.[HostName]
		, inserted.[Interval]
		, inserted.[LastRun]
		, inserted.[Password]
		, inserted.[ProviderType]
		, inserted.[Settings]
		, inserted.[Start]
		, inserted.[Username]
		, inserted.[RowVersion]
	WHERE
		[Start] < @Now
		AND ([LastRun] IS NULL OR DATEDIFF(MINUTE, [LastRun], @Now) >= [Interval]);
END
GO