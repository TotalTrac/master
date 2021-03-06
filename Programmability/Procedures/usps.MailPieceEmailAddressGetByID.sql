﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[MailPieceEmailAddressGetByID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		ADDRESS_ID
		, ADDRESS_COMPANYNAME
		, ADDRESS_CUSTOMFIELD1
		, ADDRESS_CUSTOMFIELD2
		, ADDRESS_CUSTOMFIELD3
		, ADDRESS_CUSTOMFIELD4
		, ADDRESS_CUSTOMFIELD5
		, ADDRESS_EMAILADDRESS
		, ADDRESS_FIRSTNAME
		, ADDRESS_LASTNAME
		, ADDRESS_MAILPIECEID
	FROM
		[usps].[MailPieceEmailAddresses]
	WHERE
		ADDRESS_ID = @ID;	
END
GO