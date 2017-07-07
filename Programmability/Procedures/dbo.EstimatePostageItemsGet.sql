﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[EstimatePostageItemsGet]
	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT
		ESTIMATEPOSTAGE_ID
		, ESTIMATEPOSTAGE_DESCRIPTION
		, ESTIMATEPOSTAGE_ESTIMATEID
		, ESTIMATEPOSTAGE_EXTENDEDPRICE
		, ESTIMATEPOSTAGE_NONPROFIT
		, ESTIMATEPOSTAGE_PIECEWEIGHT
		, ESTIMATEPOSTAGE_QUANTITY
		, ESTIMATEPOSTAGE_RATE
		, ESTIMATEPOSTAGE_RATEDESCRIPTION
		, ESTIMATEPOSTAGE_ROWVERSION
	FROM
		[dbo].[EstimatePostageItems]
	ORDER BY
		ESTIMATEPOSTAGE_ID;
	
END
GO