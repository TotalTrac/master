﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [dbo].[BillingSubscriptionsGetByClientIdByCreatedPaged]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[BillingSubscriptionsGetByClientIdByCreatedPaged]
-- Date Generated: Monday, June 26, 2017
------------------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE [dbo].[BillingSubscriptionsGetByClientIdByCreatedPaged]
	@Id int
,
    @From DATETIME,
    @To DATETIME,
    @PageNumber INT = 1,
    @PageSize   INT = 10
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED


;WITH pg AS
  (
    SELECT Id
      FROM [dbo].[BillingSubscriptions] main
      WHERE 	[ClientId] = @Id
 AND Created BETWEEN @From AND @To
      ORDER BY Id
      OFFSET @PageSize * (@PageNumber - 1) ROWS
      FETCH NEXT @PageSize ROWS ONLY
  )
  SELECT 	
	[sub].[Id],
	[sub].[Allotted],
	[sub].[ClientId],
	[sub].[Created],
	[sub].[CreatedById],
	[sub].[CycleStartDate],
	[sub].[LastInvoicedDate],
	[sub].[LastUpdated],
	[sub].[MinimumQty],
	[sub].[MinimumRate],
	[sub].[MonthsPerCycle],
	[sub].[OverageRate],
	[sub].[PayCycle],
	[sub].[ProductId],
	[sub].[ProductPrice],
	[sub].[ProviderId],
	[sub].[Remaining],
	[sub].[Seats],
	[sub].[SeatItemId],
	[sub].[SeatPrice],
	[sub].[UsageAlertsSent],
	[sub].[UsageAlertThreshold],
	[sub].[UsageId],
	[sub].[Users],
	[sub].[RowVersion]
  FROM [dbo].[BillingSubscriptions] sub
  WHERE EXISTS (SELECT 1 FROM pg WHERE pg.Id = sub.Id)
  ORDER BY sub.Id OPTION (RECOMPILE);

--endregion

GO