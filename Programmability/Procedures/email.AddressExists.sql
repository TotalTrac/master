SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[AddressExists]
	@VersionID		int
	, @EmailAddress	nvarchar(320)
AS
BEGIN
	SET NOCOUNT ON;
    
	IF EXISTS (
		SELECT TOP 1
			a.[Id]
		FROM 
			[email].[Addresses]	AS a
			INNER JOIN [dbo].[CampaignUsers] AS u
				ON a.[TargetId] = u.[Id]		
		WHERE
			a.[VersionId] = @VersionID			
			AND u.[EmailAddress] = @EmailAddress
	)			
		RETURN 1;
	ELSE
		RETURN 0;
END
GO