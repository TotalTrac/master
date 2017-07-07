﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ScfServiceAreasGet]
	
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		SCFSERVICEAREA_ID
		, SCFSERVICEAREA_END
		, SCFSERVICEAREA_SCFID
		, SCFSERVICEAREA_START
    FROM
		[dbo].[SCFServiceAreas];	
END
GO