﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [dbo].[ActiveUserGetById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[ActiveUserGetById]
-- Date Generated: Monday, June 5, 2017
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[ActiveUserGetById]
	@Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[Expiration],
	[UserId],
	[Created],
	[CreatedById],
  [RowVersion] 
FROM
	[dbo].[ActiveUsers]
WHERE
	[Id] = @Id

--endregion

GO