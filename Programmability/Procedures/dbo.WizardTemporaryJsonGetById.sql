﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [dbo].[WizardTemporaryJsonGetById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[WizardTemporaryJsonGetById]
-- Date Generated: Thursday, July 21, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[WizardTemporaryJsonGetById]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[ClientId],
	[Json],
	[UserId]
FROM
	[dbo].[Wizard_TemporaryJson]
WHERE
	[Id] = @Id

--endregion

GO