SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[colpenn_PsiSlipCreate]
	@ContentType	nvarchar(50) = NULL 
	, @Data			varbinary(MAX)
	, @Date			date
	, @Filename		nvarchar(50)
	, @Uploaded		datetime
AS
BEGIN
	SET NOCOUNT ON;

    INSERT [dbo].[colpenn_PsiSlips]
    (
		PSISLIP_CONTENTTYPE
		, PSISLIP_DATA	
		, PSISLIP_DATE
		, PSISLIP_FILENAME
		, PSISLIP_UPLOADED
    )
    OUTPUT inserted.PSISLIP_ID AS ID, NULL AS [VERSION]
    VALUES
    (
		@ContentType
		, @Data
		, @Date
		, @Filename
		, @Uploaded
    );	
END
GO