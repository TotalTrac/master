SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[ClientServiceDiscountDeleteByID]
	@ID				int
AS
BEGIN
	
	SET NOCOUNT ON;

	DELETE 
		job.[ClientServiceDiscounts]
	WHERE
		ID = @ID;
		
	IF @@ROWCOUNT > 0
		RETURN 0;
	ELSE
		RETURN 1;
END
GO