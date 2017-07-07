SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[MailSegmentEmailVersionCreate]
	@VersionID		int
	, @SegmentID	int
	, @TriggerEvent int
AS
BEGIN
	SET NOCOUNT ON;
	
	INSERT [usps].[MailSegmentEmailVersions]
	(
		VERSION_VERSIONID
		, VERSION_SEGMENTID
		, VERSION_TRIGGEREVENT
	)
	VALUES
	(
		@VersionID
		, @SegmentID
		, @TriggerEvent
	);

	IF @@ROWCOUNT > 0
		RETURN 0;
	ELSE
		RETURN 1;
END
GO