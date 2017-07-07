﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[FingerprintsGetByOperatorId]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[FingerprintsGetByOperatorId]
-- Date Generated: Thursday, September 1, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[FingerprintsGetByOperatorId]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[FingerTypeId],
	[FingerTemplate],
	[OperatorId],
	[RowVersion]
FROM
	[job].[Fingerprint]
WHERE
	[OperatorId] = @Id

--endregion

GO