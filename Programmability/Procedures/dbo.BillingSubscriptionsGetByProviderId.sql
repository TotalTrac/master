﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [dbo].[BillingSubscriptionsGetByClientId]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[BillingSubscriptionsGetByClientId]
-- Date Generated: Wednesday, May 31, 2017
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[BillingSubscriptionsGetByProviderId]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[ClientId],
	[Created],
	[CreatedById],
	[LastUpdated],
	[Remaining],
	[Allotted],
	[LastInvoicedDate],
	[MinimumQty],
	[MinimumRate],
	[MonthsPerCycle],
	[CycleStartDate],
	[OverageRate],
	[ProviderId],
  [Seats],
	[UsageAlertsSent],
	[UsageAlertThreshold],
	[Users],
	[RowVersion]
FROM
	[dbo].[BillingSubscriptions]
WHERE
	ProviderId = @Id

--endregion
GO