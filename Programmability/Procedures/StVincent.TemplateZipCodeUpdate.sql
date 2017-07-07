SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [StVincent].[TemplateZipCodeUpdate]
	@ID				int
	, @Created		datetime 
	, @CreatedByID	int
	, @Name			char(10)
	, @ZipCode		char(5)
	, @Version		timestamp
AS
BEGIN
	SET NOCOUNT ON;

    UPDATE [StVincent].[TemplateZipCodes]
	SET
		ZIPCODE_CREATED			= @Created
		, ZIPCODE_CREATEDBYID	= @CreatedByID
		, ZIPCODE_NAME			= @Name	
		, ZIPCODE_ZIPCODE		= @ZipCode	
	OUTPUT inserted.ZIPCODE_ID AS [ID], inserted.ZIPCODE_ROWVERSION AS [VERSION]
	WHERE
		ZIPCODE_ID = @ID
		AND ZIPCODE_ROWVERSION = @Version;
END
GO