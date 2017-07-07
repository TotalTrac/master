SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [file].[_DataUpdate]
	@ID				int
	, @Data			varbinary(max) = NULL
	, @MetaDataID	int	
	, @Version		timestamp
AS
BEGIN
	
	SET NOCOUNT ON;
	
    UPDATE [file].[Data]
	SET
		DATA_DATA = @Data
		, DATA_METADATAID = @MetaDataID
	OUTPUT
		inserted.DATA_ID AS ID, inserted.DATA_ROWVERSION AS [VERSION]
	WHERE
		DATA_ID = @ID
		AND DATA_ROWVERSION = @Version;
END
GO