﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[PieceTypeGetByName] 
	@Name nvarchar(50)
AS

BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		PIECETYPE_ID,
		PIECETYPE_NAME,
		PIECETYPE_ROWVERSION
	FROM 
		PieceTypes 
	WHERE 
		PIECETYPE_NAME = @Name;		
END
GO