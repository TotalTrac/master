﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ScfServiceAreaGetBy3DigitZipCode]
	@ZipCode char(3)
AS
BEGIN
	SET NOCOUNT ON;

    SELECT TOP 1
		SCFSERVICEAREA_ID
		, SCFSERVICEAREA_END
		, SCFSERVICEAREA_SCFID
		, SCFSERVICEAREA_START
    FROM
		[dbo].[SCFServiceAreas]
	WHERE
		(SCFSERVICEAREA_START <= @ZipCode)
		AND (SCFSERVICEAREA_END >= @ZipCode)
	ORDER BY 
		SCFSERVICEAREA_ID DESC;
END
GO