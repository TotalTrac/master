﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [acs].[CoaRecordsGetBySegmentID]
	@ID	int
AS
BEGIN
	
	SET NOCOUNT ON;
	    
	SELECT
coa.[RECORD_ID]
	, coa.[RECORD_ACSTYPEID]
    , coa.[RECORD_CAPTURETYPEID]
	, coa.[RECORD_COMPANYNAME] 
	, coa.[RECORD_DELIVERABILITYCODEID]
	, coa.[RECORD_EFFECTIVEDATE]
	, coa.[RECORD_FEENOTIFICATIONTYPEID]
	, coa.[RECORD_FIRSTNAME]
    , coa.[RECORD_FULFILLMENTDATE]
    , coa.[RECORD_HARDCOPYFLAG]
    , coa.[RECORD_IDTAG]
    , coa.[RECORD_IMPB]
	, coa.[RECORD_LASTNAME]
    , coa.[RECORD_MADEAVAILABLE]
    , coa.[RECORD_MAILACTIONCODEID]
    , coa.[RECORD_MAILERID]
	, coa.[RECORD_MAILPIECEID]
    , coa.[RECORD_MAILSHAPEID]
	, coa.[RECORD_MOVETYPEID]
	, coa.[RECORD_NAMEPREFIX]
	, coa.[RECORD_NAMESUFFIX]
	, coa.[RECORD_NEWADDRESSTYPEID]
	, coa.[RECORD_NEWCHECKDIGIT]
	, coa.[RECORD_NEWCITY]
	, coa.[RECORD_NEWDELIVERYPOINT]
	, coa.[RECORD_NEWPOSTDIRECTIONAL]
	, coa.[RECORD_NEWPREDIRECTIONAL]
	, coa.[RECORD_NEWPRIMARYNUMBER]
	, coa.[RECORD_NEWSECONDARYNUMBER]
	, coa.[RECORD_NEWSTATE]
	, coa.[RECORD_NEWSTREETNAME]
	, coa.[RECORD_NEWSTREETSUFFIX]
	, coa.[RECORD_NEWUNITDESIGNATOR]
	, coa.[RECORD_NEWURBANIZATION]
	, coa.[RECORD_NEWZIPCODE]
	, coa.[RECORD_NEWZIPCODEADDON]
	, coa.[RECORD_NOTIFICATIONTYPEID]
	, coa.[RECORD_OLDADDRESSTYPEID]
	, coa.[RECORD_OLDCITY]
	, coa.[RECORD_OLDPOSTDIRECTIONAL]
	, coa.[RECORD_OLDPREDIRECTIONAL]
	, coa.[RECORD_OLDPRIMARYNUMBER]
	, coa.[RECORD_OLDSECONDARYNUMBER]
	, coa.[RECORD_OLDSTATE]
	, coa.[RECORD_OLDSTREETNAME]
	, coa.[RECORD_OLDSTREETSUFFIX]
	, coa.[RECORD_OLDUNITDESIGNATOR]
	, coa.[RECORD_OLDURBANIZATION]
	, coa.[RECORD_OLDZIPCODE]
	, coa.[RECORD_POSTAGEDUE]
	, coa.[RECORD_POSTALSERVICESITEID]
	, coa.[RECORD_PRIVATEMAILBOX]
    , coa.[RECORD_PROCESSINGTYPEID]
	FROM
		[acs].[CoaRecords] AS coa
		INNER JOIN [dbo].[MailPieces] AS p
			ON coa.RECORD_MAILPIECEID = p.MAILPIECE_ID
	WHERE
		p.MAILPIECE_SEGMENTID = @ID
	ORDER BY 
		coa.RECORD_ID;
END
GO