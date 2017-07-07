SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [acxiom].[OrderZipCodeCreate]
	@Created		datetime
	, @CreatedByID	int
	, @Name			char(10)	
	, @ZipCode		char(5)
AS
BEGIN
	SET NOCOUNT ON;

    INSERT [acxiom].[OrderZipCodes]
	(
		ZIPCODE_CREATED
		, ZIPCODE_CREATEDBYID
		, ZIPCODE_NAME
		, ZIPCODE_ZIPCODE
	)
	OUTPUT inserted.ZIPCODE_ID AS [ID], inserted.ZIPCODE_ROWVERSION AS [VERSION]
	VALUES
	(
		@Created
		, @CreatedByID
		, @Name
		, @ZipCode
	);
END
GO