SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [file].[ContentTypeCreate]
	@Extension	nvarchar(10)
	, @MimeType	nvarchar(100)
AS
BEGIN
	SET NOCOUNT ON;

    INSERT
		[file].[ContentTypes]
		(
			CONTENTTYPE_EXTENSION
			, CONTENTTYPE_MIMETYPE
		)
	OUTPUT
		inserted.CONTENTTYPE_ID AS ID, NULL AS [VERSION]
	VALUES
	(
		@Extension
		, @MimeType
	);	
END
GO