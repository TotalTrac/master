﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [StVincent].[LeadsGetByCRRTBYZIPNTH]
	@CRRT	varchar(4)
	,@ZIP varchar(5)
	,@QTY int
AS
BEGIN
	SET NOCOUNT ON;
	    
	SELECT TOP (@QTY)
		[RECORD_ID]
      ,[RECORD_PREFIXTTL]
      ,[RECORD_INDIVIDUALNAME]
      ,[RECORD_FIRSTNAME]
      ,[RECORD_MIDDLENAME]
      ,[RECORD_LASTNAME]
      ,[RECORD_ADDRESS]
      ,[RECORD_ADDRESS2LINE]
      ,[RECORD_CITY]
      ,[RECORD_STATE]
      ,[RECORD_ZIP]
      ,[RECORD_ZIP4]
      ,[RECORD_DPBC]
      ,[RECORD_CONFIDENCECODE]
      ,[RECORD_POSTSUPPPHONE]
      ,[RECORD_RELIGION]
      ,[RECORD_SECPHONEFLAG]
      ,[RECORD_CRRT]
      ,[RECORD_DSFWALKSEQUENCE]
      ,[RECORD_COUNTY]
	FROM
		[StVincent].[Leads]
	WHERE
		RECORD_CRRT = @CRRT and RECORD_ZIP = @ZIP
	ORDER BY NEWID()
END
GO