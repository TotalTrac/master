SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[PostageUsageItemCreate]
	@DateTime		datetime	
	, @PackageID	int
	, @Quantity		int
	, @Rate			float
AS
BEGIN

	SET NOCOUNT ON;
	
	INSERT [dbo].[PostageUsageItems]
	(
		POSTAGEUSAGEITEM_DATETIME		
		, POSTAGEUSAGEITEM_PACKAGEID
		, POSTAGEUSAGEITEM_QUANTITY
		, POSTAGEUSAGEITEM_RATE
	)
	OUTPUT		
		inserted.POSTAGEUSAGEITEM_ID AS ID, inserted.POSTAGEUSAGEITEM_ROWVERSION AS [VERSION]
	VALUES
	(
		@DateTime	
		, @PackageID
		, @Quantity
		, @Rate
	);	
END
GO