﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [dbo].[BillingChargeOverLogDeleteById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[BillingChargeOverLogDeleteById]
-- Date Generated: Tuesday, February 7, 2017
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[BillingChargeOverLogDeleteById]
	@Id int
AS

SET NOCOUNT ON

DELETE FROM [dbo].[Billing_ChargeOverLog]
WHERE
	[Id] = @Id

--endregion

GO