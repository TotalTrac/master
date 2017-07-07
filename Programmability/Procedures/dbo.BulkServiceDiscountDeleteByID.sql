SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[BulkServiceDiscountDeleteByID]
	@ID			int
AS
	DELETE 
		BulkServiceDiscounts
	WHERE
		DISCOUNT_ID = @ID;
	
	IF @@ROWCOUNT > 0
		RETURN 0;
	ELSE
		RETURN 1;
GO