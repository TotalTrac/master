﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [dbo].[OptionGetById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[OptionGetById]
-- Date Generated: Wednesday, October 12, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[OptionGetById]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[UserId],
	[Json],
	[RowVersion]
FROM
	[dbo].[Options]
WHERE
	[Id] = @Id

--endregion

GO