SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[AttachmentsGet]
	
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT 
		VersionId
		, Data
		, [FileName] 
	FROM 
		[email].[Attachments]
	ORDER BY 
		Id;
END
GO