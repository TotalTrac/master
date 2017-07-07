SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[MailDatFilesetCreate]
	@ContentType	nvarchar(50) = NULL 
	, @Data			varbinary(MAX)
	, @Date			date
	, @Filename		nvarchar(50)
	, @JobID		int
AS
BEGIN
	SET NOCOUNT ON;

    INSERT [dbo].[MailDatFilesets]
    (
		MAILDATFILESET_CONTENTTYPE
		, MAILDATFILESET_DATA
		, MAILDATFILESET_DATETIME
		, MAILDATFILESET_FILENAME
		, MAILDATFILESET_JOBID
    )
    OUTPUT inserted.MAILDATFILESET_ID AS ID, NULL AS [VERSION]
    VALUES
    (
		@ContentType
		, @Data
		, @Date
		, @Filename
		, @JobID
    );	
END
GO