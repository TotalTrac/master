﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[AffixingPersonalizationItemDeleteById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[AffixingPersonalizationItemDeleteById]
-- Date Generated: Monday, February 22, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[AffixingPersonalizationItemDeleteById]
	@Id int
AS

SET NOCOUNT ON

DELETE FROM [job].[AffixingPersonalizationItem]
WHERE
	[Id] = @Id

--endregion

GO