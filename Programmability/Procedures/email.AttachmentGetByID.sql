SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[AttachmentGetByID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		VersionId
		, Data
		, [FileName] 
	FROM 
		[email].[Attachments]
	WHERE
		Id = @ID;
	
END
GO