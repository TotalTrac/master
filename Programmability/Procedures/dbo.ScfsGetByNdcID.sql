﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ScfsGetByNdcID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		SCF_ID
		, SCF_LATITUDE
		, SCF_LONGITUDE
		, SCF_NAME
		, SCF_NDCID
		, SCF_STATE
		, SCF_ZIPCODE
    FROM
		[dbo].[SCFs]
	WHERE
		SCF_NDCID = @ID
	ORDER BY
		SCF_ID;
END
GO