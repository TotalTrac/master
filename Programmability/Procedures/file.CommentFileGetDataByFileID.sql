SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [file].[CommentFileGetDataByFileID]
	@ID int = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT		
		[FILE_DATA]
	FROM 
		[file].[CommentFiles]
	WHERE 
		[FILE_ID] = @ID;			
END
GO