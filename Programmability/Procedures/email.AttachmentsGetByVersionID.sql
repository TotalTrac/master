SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[AttachmentsGetByVersionID]
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
		VersionId = @ID
	ORDER BY 
		Id;
END
GO