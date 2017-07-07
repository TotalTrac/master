SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[MAD_DestroyMailPieceSource] 	
AS
BEGIN
	SET NOCOUNT ON;

	IF OBJECT_ID('dbo._MostRecentMADPieces', 'U') IS NOT NULL 
		DROP TABLE dbo._MostRecentMADPieces; 

END
GO