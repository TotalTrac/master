﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [dbo].[BillingTiersetsGetByItemIdByWriteDatetimePaged]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[BillingTiersetsGetByItemIdByWriteDatetimePaged]
-- Date Generated: Monday, June 19, 2017
------------------------------------------------------------------------------------------------------------------------


CREATE PROCEDURE [dbo].[BillingTiersetsGetByItemIdByWriteDatetimePaged]
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
      FROM [dbo].[BillingTiersets] main
      WHERE 	[ItemId] = @Id
 AND WriteDatetime BETWEEN @From AND @To
      ORDER BY Id
      OFFSET @PageSize * (@PageNumber - 1) ROWS
      FETCH NEXT @PageSize ROWS ONLY
  )
  SELECT 	
	[sub].[Id],
	[sub].[TiersetId],
	[sub].[CurrencyId],
	[sub].[Setup],
	[sub].[Base],
	[sub].[Percent],
	[sub].[Paycycle],
	[sub].[PriceModel],
	[sub].[WriteDatetime],
	[sub].[ModDatetime],
	[sub].[CurrencySymbol],
	[sub].[CurrencyIso4217],
	[sub].[ItemId],
	[sub].[SetupFormatted],
	[sub].[BaseFormatted],
	[sub].[PercentFormatted],
	[sub].[PriceModelDesc],
	[sub].[RowVersion]
  FROM [dbo].[BillingTiersets] sub
  WHERE EXISTS (SELECT 1 FROM pg WHERE pg.Id = sub.Id)
  ORDER BY sub.Id OPTION (RECOMPILE);

--endregion

GO