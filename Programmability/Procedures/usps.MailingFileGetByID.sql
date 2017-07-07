﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[MailingFileGetByID]
	@ID int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		[FILE_ID]
		, FILE_MAILINGID
		, FILE_METADATAID		
	FROM 
		[usps].[MailingFiles]
	WHERE
		[FILE_ID] = @ID;
END
GO