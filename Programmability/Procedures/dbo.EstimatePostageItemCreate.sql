SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[EstimatePostageItemCreate] 
	@Description		nvarchar(100)
	, @EstimateID		int
	, @ExtendedPrice	decimal(18,5)
	, @NonProfit		bit
	, @PieceWeight		decimal(5,4)
	, @Quantity			int
	, @Rate				decimal(5,3)
	, @RateDescription	nvarchar(100)
	
AS
BEGIN

	SET NOCOUNT ON;
	
	INSERT [dbo].[EstimatePostageItems]
	(
		ESTIMATEPOSTAGE_DESCRIPTION
		, ESTIMATEPOSTAGE_ESTIMATEID
		, ESTIMATEPOSTAGE_EXTENDEDPRICE
		, ESTIMATEPOSTAGE_NONPROFIT
		, ESTIMATEPOSTAGE_PIECEWEIGHT
		, ESTIMATEPOSTAGE_QUANTITY
		, ESTIMATEPOSTAGE_RATE
		, ESTIMATEPOSTAGE_RATEDESCRIPTION
	)
	OUTPUT
		inserted.ESTIMATEPOSTAGE_ID AS ID, inserted.ESTIMATEPOSTAGE_ROWVERSION AS [VERSION]
	VALUES
	(
		@Description
		, @EstimateID
		, @ExtendedPrice
		, @NonProfit
		, @PieceWeight
		, @Quantity
		, @Rate
		, @RateDescription
	);	
END
GO