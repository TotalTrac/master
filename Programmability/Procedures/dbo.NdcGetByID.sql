﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[NdcGetByID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		NDC_ID
		, NDC_LATITUDE
		, NDC_LONGITUDE
		, NDC_NAME
		, NDC_STATE
		, NDC_ZIPCODE
    FROM
		[dbo].[NDCs]
	WHERE
		NDC_ID = @ID;
END
GO