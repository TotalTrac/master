﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [dbo].[EmailContactInfosGetAll]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[EmailContactInfosGetAll]
-- Date Generated: Wednesday, May 13, 2015
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[EmailContactInfosGetAll]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[Address],
	[SubscriberId],
	[Rowversion]
FROM
	[dbo].[EmailContactInfo]

--endregion
GO