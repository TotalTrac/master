﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [dbo].[BillingSubscriptionsGetByClientIdByLastUpdated]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[BillingSubscriptionsGetByClientIdByLastUpdated]
-- Date Generated: Monday, June 26, 2017
------------------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE [dbo].[BillingSubscriptionsGetByClientIdByLastUpdated]
    @To DATETIME,
    @From DATETIME,
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[Allotted],
	[ClientId],
	[Created],
	[CreatedById],
	[CycleStartDate],
	[LastInvoicedDate],
	[LastUpdated],
	[MinimumQty],
	[MinimumRate],
	[MonthsPerCycle],
	[OverageRate],
	[PayCycle],
	[ProductId],
	[ProductPrice],
	[ProviderId],
	[Remaining],
	[Seats],
	[SeatItemId],
	[SeatPrice],
	[UsageAlertsSent],
	[UsageAlertThreshold],
	[UsageId],
	[Users],
	[RowVersion]
FROM
	[dbo].[BillingSubscriptions]
WHERE
    LastUpdated  BETWEEN @From AND @To AND 	[ClientId] = @Id


--endregion

GO