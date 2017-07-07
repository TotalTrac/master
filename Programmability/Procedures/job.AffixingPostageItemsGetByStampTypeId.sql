﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[AffixingPostageItemsGetByStampTypeId]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[AffixingPostageItemsGetByStampTypeId]
-- Date Generated: Wednesday, April 27, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[AffixingPostageItemsGetByStampTypeId]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[Denomination],
	[PostageTypeId],
	[Quantity],
	[StampTypeId],
	[AffixingItemId],
	[RowVersion]
FROM
	[job].[AffixingPostageItems]
WHERE
	[StampTypeId] = @Id

--endregion

GO