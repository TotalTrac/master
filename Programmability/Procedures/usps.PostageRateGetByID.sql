﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[PostageRateGetByID]
	@ID int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		RATE_ID
		, RATE_CATEGORYID
		, RATE_EFFECTIVEDATE
		, RATE_ENTRYPOINTLEVELID
		, RATE_NONPROFIT
		, RATE_PIECETYPEID
		, RATE_POSTALCLASSID
		, RATE_RATE
		, RATE_WEIGHTMAX
		, RATE_WEIGHTMIN
	FROM
		[usps].[PostageRates]
	WHERE
		RATE_ID = @ID;	
END
GO