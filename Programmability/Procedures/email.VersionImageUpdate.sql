SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[VersionImageUpdate]
	@ID						int
	, @CampaignVersionID	int
	, @FullSizeImage		varbinary(MAX)
	, @ThumbnailImage		varbinary(MAX)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	UPDATE [dbo].[CampaignVersionImages]
	SET
		CAMPAIGNVERSIONIMAGE_FULLSIZE		= @FullSizeImage
		, CAMPAIGNVERSIONIMAGE_THUMBNAIL	= @ThumbnailImage
		, CAMPAIGNVERSIONIMAGE_VERSIONID	= @CampaignVersionID
	OUTPUT
		inserted.CAMPAIGNVERSIONIMAGE_ID AS ID, NULL AS [VERSION]
	WHERE
		CAMPAIGNVERSIONIMAGE_ID = @ID;
	
END
GO