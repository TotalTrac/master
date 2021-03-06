﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[NdcServiceAreaGetBy3DigitZipCode]
	@ZipCode char(3)
AS
BEGIN
	SET NOCOUNT ON;

    SELECT TOP 1
		NDCSERVICEAREA_ID
		, NDCSERVICEAREA_END
		, NDCSERVICEAREA_NDCID
		, NDCSERVICEAREA_START
    FROM
		[dbo].[NDCServiceAreas]
	WHERE
		(NDCSERVICEAREA_START <= @ZipCode)
		AND (NDCSERVICEAREA_END >= @ZipCode)
	ORDER BY
		NDCSERVICEAREA_ID DESC;
END
GO