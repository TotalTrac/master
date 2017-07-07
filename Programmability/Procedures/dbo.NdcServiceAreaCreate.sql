SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[NdcServiceAreaCreate]
	@End		char(3)
	, @NdcID	int
	, @Start	char(3)
AS
BEGIN
	SET NOCOUNT ON;

    INSERT [dbo].[NDCServiceAreas]
    (
		NDCSERVICEAREA_END
		, NDCSERVICEAREA_NDCID
		, NDCSERVICEAREA_START
    )
    OUTPUT		
		inserted.NDCSERVICEAREA_ID AS ID, NULL AS [VERSION]
    VALUES
    (
		@End
		, @NdcID
		, @Start
    );
END
GO