﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [dbo].[BillingTierDeleteById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[BillingTierDeleteById]
-- Date Generated: Monday, June 19, 2017
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[BillingTierDeleteById]
	@Id int
AS

SET NOCOUNT ON

DELETE FROM [dbo].[BillingTier]
WHERE
	[Id] = @Id

--endregion

GO