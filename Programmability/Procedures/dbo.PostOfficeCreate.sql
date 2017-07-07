SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[PostOfficeCreate] 
	@Phone NVarChar(10),
	@Fax NVarChar(10)
AS
BEGIN

	SET NOCOUNT ON;
	
	INSERT [dbo].[PostOffices]
	(
		POSTOFFICE_PHONE,
		POSTOFFICE_FAX
	) 
	OUTPUT		
		inserted.POSTOFFICE_ID AS ID, inserted.POSTOFFICE_ROWVERSION AS [VERSION]
	VALUES 
	(
		@Phone,
		@Fax
	);
END
GO