﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ScfServiceAreasGetByScfID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		SCFSERVICEAREA_ID
		, SCFSERVICEAREA_END
		, SCFSERVICEAREA_SCFID
		, SCFSERVICEAREA_START
    FROM
		[dbo].[SCFServiceAreas]
	WHERE
		SCFSERVICEAREA_SCFID = @ID;
END
GO