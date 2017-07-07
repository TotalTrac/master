SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [file].[_DataCreate]
	@Data			varbinary(max) = NULL
	, @MetaDataID	int
AS
BEGIN
	
	SET NOCOUNT ON;
	
    INSERT [file].[Data]
	(
		DATA_DATA
		, DATA_METADATAID
	)
	OUTPUT
		inserted.DATA_ID AS ID, inserted.DATA_ROWVERSION AS [VERSION]
	VALUES
	(
		@Data,
		@MetaDataID
	);
END
GO