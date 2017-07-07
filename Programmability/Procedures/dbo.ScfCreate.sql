SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ScfCreate]
	@Name		nvarchar(30)
	, @NdcID	int
	, @State	char(2)
	, @ZipCode	char(5)
AS
BEGIN
	SET NOCOUNT ON;

    INSERT [dbo].[SCFs]
    (
		SCF_NAME
		, SCF_NDCID
		, SCF_STATE
		, SCF_ZIPCODE
    )
    OUTPUT		
		inserted.SCF_ID AS ID, NULL AS [VERSION]
    VALUES
    (
		@Name
		, @NdcID
		, @State
		, @ZipCode
    );
END
GO