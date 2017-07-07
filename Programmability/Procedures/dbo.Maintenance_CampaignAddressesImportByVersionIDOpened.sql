﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Maintenance_CampaignAddressesImportByVersionIDOpened]
	 @SourceVersionID	int
	, @TargetVersionID	int	
AS
BEGIN
	SET NOCOUNT ON;
    
    DECLARE @TargetCampaignID int;    
    SET @TargetCampaignID = (SELECT CAMPAIGNVERSION_CAMPAIGNID FROM [dbo].[CampaignVersions] WHERE CAMPAIGNVERSION_ID = @TargetVersionID);
    
    DECLARE @TargetClientID	int;
    SET @TargetClientID = (
		SELECT 
			c.CAMPAIGN_CLIENTID
		FROM 
			[dbo].[CampaignVersions] AS v
			INNER JOIN [dbo].[Campaigns] AS c
				ON v.CAMPAIGNVERSION_CAMPAIGNID = c.CAMPAIGN_ID
		WHERE
			v.CAMPAIGNVERSION_ID = @TargetVersionID
	);
	
    DECLARE @SourceClientID	int;    
    SET @SourceClientID = (
		SELECT 
			c.CAMPAIGN_CLIENTID
		FROM 
			[dbo].[CampaignVersions] AS v
			INNER JOIN [dbo].[Campaigns] AS c
				ON v.CAMPAIGNVERSION_CAMPAIGNID = c.CAMPAIGN_ID
		WHERE
			v.CAMPAIGNVERSION_ID = @SourceVersionID
	);    
	
	IF (@TargetClientID <> @SourceClientID)
		RETURN 1;
		
	INSERT INTO [dbo].[CampaignAddresses]
	(
		CAMPAIGNADDRESS_CAMPAIGNID
		, CAMPAIGNADDRESS_CAMPAIGNVERSIONID
		, CAMPAIGNADDRESS_COMPANYNAME
		, CAMPAIGNADDRESS_CUSTOMFIELD1
		, CAMPAIGNADDRESS_CUSTOMFIELD2
		, CAMPAIGNADDRESS_CUSTOMFIELD3
		, CAMPAIGNADDRESS_CUSTOMFIELD4
		, CAMPAIGNADDRESS_CUSTOMFIELD5
		, CAMPAIGNADDRESS_EMAILADDRESS
		, CAMPAIGNADDRESS_FIRSTNAME
		, CAMPAIGNADDRESS_LASTNAME
		, CAMPAIGNADDRESS_LIVESENDSTATUS
		, CAMPAIGNADDRESS_SIGNOFF
		, CAMPAIGNADDRESS_SUBJECTLINE
		, CAMPAIGNADDRESS_TYPE
	)
	SELECT
		@TargetCampaignID
		, @TargetVersionID
		, a.CAMPAIGNADDRESS_COMPANYNAME
		, a.CAMPAIGNADDRESS_CUSTOMFIELD1
		, a.CAMPAIGNADDRESS_CUSTOMFIELD2
		, a.CAMPAIGNADDRESS_CUSTOMFIELD3
		, a.CAMPAIGNADDRESS_CUSTOMFIELD4
		, a.CAMPAIGNADDRESS_CUSTOMFIELD5		
		, a.CAMPAIGNADDRESS_EMAILADDRESS
		, a.CAMPAIGNADDRESS_FIRSTNAME
		, a.CAMPAIGNADDRESS_LASTNAME
		, 0
		, a.CAMPAIGNADDRESS_SIGNOFF
		, NULL
		, a.CAMPAIGNADDRESS_TYPE
	FROM
		[dbo].[CampaignAddresses] AS a
	WHERE 
		(a.CAMPAIGNADDRESS_CAMPAIGNVERSIONID = @SourceVersionID)
		AND (a.CAMPAIGNADDRESS_SIGNOFF = 0)
		AND (EXISTS (		
			SELECT
				o.CAMPAIGNADDRESSOPEN_CAMPAIGNADDRESSID
			FROM	
				[dbo].[CampaignAddressOpens] AS o				
			WHERE
				o.CAMPAIGNADDRESSOPEN_CAMPAIGNADDRESSID = a.CAMPAIGNADDRESS_ID
		))
		AND (NOT EXISTS (
			SELECT
				b.CAMPAIGNADDRESSBOUNCE_CAMPAIGNADDRESSID
			FROM	
				[dbo].[CampaignAddressBounces] AS b		
			WHERE
				(b.CAMPAIGNADDRESSBOUNCE_CAMPAIGNADDRESSID = a.CAMPAIGNADDRESS_ID)
				AND (b.CAMPAIGNADDRESSBOUNCE_TYPE = 1)
		))
		AND (NOT EXISTS (
			SELECT
				u.CAMPAIGNADDRESSUNSUBSCRIBE_CAMPAIGNADDRESSID
			FROM	
				[dbo].[CampaignAddressUnsubscribes] AS u				
			WHERE
				(u.CAMPAIGNADDRESSUNSUBSCRIBE_CAMPAIGNADDRESSID = a.CAMPAIGNADDRESS_ID)				
		));
		
	IF @@ROWCOUNT > 0
		RETURN 0;
	ELSE
		RETURN 1;
END
GO