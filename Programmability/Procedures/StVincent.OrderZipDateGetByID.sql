﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [StVincent].[OrderZipDateGetByID]
	@ID				int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT 
		ph.ZIPCODE_ID		
		, ph.ZIPCODE_DATE		
		, ph.ZIPCODE_DEPOTID
		, ph.ZIPCODE_ITEMID		
		, ph.ZIPCODE_ROWVERSION
	FROM
		StVincent.[OrderZipDate] AS ph		
	WHERE
		ph.ZIPCODE_ID = @ID;
END
GO