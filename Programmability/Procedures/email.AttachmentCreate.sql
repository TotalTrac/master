SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[AttachmentCreate]	
	@Data			varbinary(MAX)
	, @Filename		nvarchar(200)
	, @VersionID	int	
AS
BEGIN

	SET NOCOUNT ON;
	
	INSERT [email].[Attachments]
	(		
		Data
		, [FileName]
		, VersionId
	)
	OUTPUT
		inserted.Id AS ID, inserted.[RowVersion] AS [VERSION]
	VALUES
	(		
		@Data
		, @Filename
		, @VersionID
	);
END
GO