﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[AffixingPersonalizationProductionProcessGroupDeleteById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[AffixingPersonalizationProductionProcessGroupDeleteById]
-- Date Generated: Thursday, September 1, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[AffixingPersonalizationProductionProcessGroupDeleteById]
	@Id int
AS

SET NOCOUNT ON

DELETE FROM [job].[AffixingPersonalizationProductionProcessGroups]
WHERE
	[Id] = @Id

--endregion

GO