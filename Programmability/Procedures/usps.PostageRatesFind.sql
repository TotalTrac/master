SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[PostageRatesFind]
	@CategoryID				int = NULL
	, @EffectiveDate		datetime = NULL
	, @EntryPointLevelID	int = NULL
	, @NonProfit			bit	= NULL
	, @PieceTypeID			int = NULL
	, @PostalClassID		int = NULL
	, @Weight				decimal(5,3) = NULL
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
		(@CategoryID IS NULL OR RATE_CATEGORYID = @CategoryID)
		AND (@EffectiveDate IS NULL OR RATE_EFFECTIVEDATE <= @EffectiveDate)
		AND (@EntryPointLevelID IS NULL OR RATE_ENTRYPOINTLEVELID = @EntryPointLevelID)
		AND (@NonProfit IS NULL OR RATE_NONPROFIT = @NonProfit)
		AND (@PieceTypeID IS NULL OR RATE_PIECETYPEID = @PieceTypeID)
		AND (@PostalClassID IS NULL OR RATE_POSTALCLASSID = @PostalClassID)
		AND (@Weight IS NULL OR @Weight BETWEEN RATE_WEIGHTMIN AND RATE_WEIGHTMAX);
	
END
GO