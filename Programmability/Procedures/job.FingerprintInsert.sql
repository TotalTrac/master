﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[FingerprintInsert]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[FingerprintInsert]
-- Date Generated: Thursday, September 1, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[FingerprintInsert]
	@Fingertypeid int,
	@Fingertemplate varbinary(max),
	@Operatorid int

AS

SET NOCOUNT ON

INSERT INTO [job].[Fingerprint] (
	[FingerTypeId],
	[FingerTemplate],
	[OperatorId]
) 
OUTPUT		
		inserted.Id AS ID, inserted.Rowversion AS [VERSION]
VALUES (
	@Fingertypeid,
	@Fingertemplate,
	@Operatorid
)

--endregion

GO