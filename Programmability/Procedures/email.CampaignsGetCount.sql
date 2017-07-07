SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[CampaignsGetCount] 	
AS
BEGIN
	
    SELECT 
		COUNT(Id) 
	FROM 
		[email].[Campaigns];
END
GO