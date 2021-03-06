﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [usps].[PostageAccountsGetByClientId]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [usps].[PostageAccountsGetByClientId]
-- Date Generated: Wednesday, July 20, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [usps].[PostageAccountsGetByClientId]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[ClientId],
	[Name],
  [RowVersion]
FROM
	[usps].[PostageAccounts]
WHERE
	[ClientId] = @Id

--endregion

GO