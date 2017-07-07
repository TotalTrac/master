SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[PostOfficeUpdate] 
	@ID int,
	@City NVarChar(50),
	@StateID int,
	@ZIP NVarChar(9),
	@Address NVarChar(100),
	@Phone NVarChar(10),
	@Fax NVarChar(10),
	@Version timestamp
AS
BEGIN
	
	UPDATE [dbo].[PostOffices]
	SET		
		POSTOFFICE_PHONE = @Phone,
		POSTOFFICE_FAX = @Fax
	OUTPUT		
		inserted.POSTOFFICE_ID AS ID, inserted.POSTOFFICE_ROWVERSION AS [VERSION]
	WHERE
		(POSTOFFICE_ID = @ID) AND
		(POSTOFFICE_ROWVERSION = @Version);
END
GO