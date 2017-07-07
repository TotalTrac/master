﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [dbo].[BillingTierGetById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[BillingTierGetById]
-- Date Generated: Monday, June 19, 2017
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[BillingTierGetById]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[TierId],
	[TiersetId],
	[UnitFrom],
	[UnitTo],
	[Amount],
	[Rowversion]
FROM
	[dbo].[BillingTier]
WHERE
	[Id] = @Id

--endregion

GO