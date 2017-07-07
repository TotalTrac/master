SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[EstimatePostageItemUpdate] 
	@ID					int
	, @Description		nvarchar(100)
	, @EstimateID		int
	, @ExtendedPrice	decimal(18,5)
	, @NonProfit		bit
	, @PieceWeight		decimal(5,4)
	, @Quantity			int
	, @Rate				decimal(5,3)
	, @RateDescription	nvarchar(100)
	, @Version			timestamp
	
AS
BEGIN

	SET NOCOUNT ON;
	
	UPDATE 
		[dbo].[EstimatePostageItems]
	SET
		ESTIMATEPOSTAGE_DESCRIPTION		= @Description,
		ESTIMATEPOSTAGE_ESTIMATEID		= @EstimateID,
		ESTIMATEPOSTAGE_EXTENDEDPRICE	= @ExtendedPrice,
		ESTIMATEPOSTAGE_NONPROFIT		= @NonProfit,
		ESTIMATEPOSTAGE_PIECEWEIGHT		= @PieceWeight,
		ESTIMATEPOSTAGE_QUANTITY		= @Quantity,
		ESTIMATEPOSTAGE_RATE			= @Rate,
		ESTIMATEPOSTAGE_RATEDESCRIPTION = @RateDescription
	OUTPUT
		inserted.ESTIMATEPOSTAGE_ID AS ID, inserted.ESTIMATEPOSTAGE_ROWVERSION AS [VERSION]
	WHERE 
		(ESTIMATEPOSTAGE_ID = @ID)
		AND (ESTIMATEPOSTAGE_ROWVERSION = @Version);	
END
GO