SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[AttachmentUpdate]
	@ID				int	
	, @Data			varbinary(MAX)
	, @Filename		nvarchar(200)
	, @VersionID	int	
	, @Version		timestamp	
AS
BEGIN

	SET NOCOUNT ON;
	
	UPDATE 
		[email].[Attachments]
	SET		
		Data			= @Data				
		, [FileName]	= @Filename
		, VersionId	= @VersionID
	OUTPUT
		inserted.Id AS ID, inserted.[RowVersion] AS [VERSION]
	WHERE
		(Id = @ID) AND 
		([RowVersion] = @Version);		
END
GO