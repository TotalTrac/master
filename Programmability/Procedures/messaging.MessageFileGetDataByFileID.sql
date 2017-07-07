SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [messaging].[MessageFileGetDataByFileID]
	@ID int = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT		
		[DATA]
	FROM 
		[messaging].[MessageFiles]
	WHERE 
		[ID] = @ID;			
END
GO