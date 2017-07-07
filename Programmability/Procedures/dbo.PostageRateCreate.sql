SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[PostageRateCreate] 
	@Description	nvarchar(100)
	, @NonProfit	bit 
	, @Rate			decimal(5,3)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	INSERT [dbo].[PostageRates]
	(
		POSTAGERATE_DESCRIPTION
		, POSTAGERATE_NONPROFIT
		, POSTAGERATE_RATE
	)
	OUTPUT		
		inserted.POSTAGERATE_ID AS ID, inserted.POSTAGERATE_ROWVERSION AS [VERSION]
	VALUES
	(
		@Description
		, @NonProfit
		, @Rate
	);
END
GO