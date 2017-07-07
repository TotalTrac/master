﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[AffixingPostageItemGetById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[AffixingPostageItemGetById]
-- Date Generated: Wednesday, April 27, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[AffixingPostageItemGetById]
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
	[Id] = @Id

--endregion

GO