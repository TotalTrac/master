SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ScfServiceAreaCreate]
	@End		char(3)
	, @ScfID	int
	, @Start		char(3)
AS
BEGIN
	SET NOCOUNT ON;

    INSERT [dbo].[SCFServiceAreas]
    (
		SCFSERVICEAREA_END
		, SCFSERVICEAREA_SCFID
		, SCFSERVICEAREA_START
    )
    OUTPUT		
		inserted.SCFSERVICEAREA_ID AS ID, NULL AS [VERSION]
    VALUES
    (
		@End
		, @ScfID
		, @Start
    );
END
GO