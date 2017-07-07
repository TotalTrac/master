SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[SegmentFileCreate]
	@FileID			int
	, @SegmentID	int
AS
BEGIN
	SET NOCOUNT ON;

	INSERT [usps].[SegmentFiles]
	(		
		FILE_METADATAID
		, FILE_SEGMENTID
	)
	OUTPUT inserted.FILE_ID AS [ID], NULL AS [Version]
	VALUES
	(		
		@FileID
		, @SegmentID
	);	
END
GO