SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[ProductionItemDeleteByID] 
	@ID int
AS
BEGIN

	SET NOCOUNT ON;

	DELETE
		job.[ProductionItems]
	WHERE 
		Id = @ID;

	IF @@ROWCOUNT > 0
		RETURN 0;
	ELSE
		RETURN 1;
		
END
GO