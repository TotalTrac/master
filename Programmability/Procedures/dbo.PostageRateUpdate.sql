SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[PostageRateUpdate] 
	@ID				int
	, @Description	nvarchar(100)
	, @NonProfit	bit
	, @Rate			decimal(5,3)
	, @Version		timestamp
AS
BEGIN
	
	SET NOCOUNT ON;
	
	UPDATE
		[dbo].[PostageRates]
	SET
		POSTAGERATE_DESCRIPTION		= @Description
		, POSTAGERATE_NONPROFIT		= @NonProfit
		, POSTAGERATE_RATE			= @Rate
	OUTPUT		
		inserted.POSTAGERATE_ID AS ID, inserted.POSTAGERATE_ROWVERSION AS [VERSION]
	WHERE
		(POSTAGERATE_ID = @ID) 
		AND	(POSTAGERATE_ROWVERSION = @Version);
END
GO