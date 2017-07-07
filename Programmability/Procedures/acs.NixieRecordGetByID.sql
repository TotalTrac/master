﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [acs].[NixieRecordGetByID]
	@ID	int
AS
BEGIN
	
	SET NOCOUNT ON;
	    
	SELECT
		[RECORD_ID]
		, [RECORD_ACSTYPEID]
		,[RECORD_CAPTURETYPEID]
		,[RECORD_DELIVERABILITYCODEID]
		,[RECORD_FEENOTIFICATIONTYPEID]
		,[RECORD_FULFILLMENTDATE]
		,[RECORD_HARDCOPYFLAG]
		,[RECORD_IDTAG]
		,[RECORD_IMPB]
		,[RECORD_MAILACTIONCODEID]
		,[RECORD_MAILERID]
		,[RECORD_MAILPIECEID]
		,[RECORD_MAILSHAPEID]
		,[RECORD_NOTIFICATIONTYPEID]
		,[RECORD_POSTAGEDUE]
		,[RECORD_POSTALSERVICESITEID]
		,[RECORD_PROCESSINGTYPEID]
	FROM
		[acs].[NixieRecords]
	WHERE
		RECORD_ID = @ID;
END
GO