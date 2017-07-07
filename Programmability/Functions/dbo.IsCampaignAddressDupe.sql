SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE FUNCTION [dbo].[IsCampaignAddressDupe]
(
	@ID				int	
	, @EmailAddress	nvarchar(320)
	, @Signoff		bit
	, @Type			int
)
RETURNS bit
AS
BEGIN
	
	-- we want to allow dupes for AutoResponse
	-- and Notification Address
	IF (@Type = 4) OR (@Type = 5) OR (@Signoff = 1)
		RETURN 0;
		
	IF EXISTS(
		SELECT 
			TOP 1 CAMPAIGNADDRESS_ID 
		FROM 
			[dbo].[CampaignAddresses]
		WHERE
			CAMPAIGNADDRESS_CAMPAIGNVERSIONID = @ID
			AND CAMPAIGNADDRESS_EMAILADDRESS = @EmailAddress
			AND CAMPAIGNADDRESS_SIGNOFF = 0
	)
	RETURN 1;
		
	RETURN 0;		
END
GO