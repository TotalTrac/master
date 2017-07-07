SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[PieceTypeUpdate] 
	@ID			int,
	@Name		nvarchar(50),
	@Version	timestamp
AS
BEGIN

	SET NOCOUNT ON;
	
	UPDATE 
		PieceTypes
	SET
		PIECETYPE_NAME = @Name
	OUTPUT		
		inserted.PIECETYPE_ID AS ID, inserted.PIECETYPE_ROWVERSION AS [VERSION]
	WHERE
		(PIECETYPE_ID = @ID) AND
		(PIECETYPE_ROWVERSION = @Version);
END
GO