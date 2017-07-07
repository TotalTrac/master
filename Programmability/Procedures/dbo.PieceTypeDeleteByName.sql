SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[PieceTypeDeleteByName]
	@PieceTypeName NVarChar(50)
AS
BEGIN
	
	DELETE 
		PieceTypes
	WHERE
		PIECETYPE_NAME = @PieceTypeName;

	IF @@ROWCOUNT > 0 
		RETURN 0;
	ELSE
		RETURN 1;
	
END
GO