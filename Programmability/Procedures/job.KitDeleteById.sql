﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [job].[KitDeleteById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [job].[KitDeleteById]
-- Date Generated: Friday, January 8, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [job].[KitDeleteById]
	@Id int
AS

SET NOCOUNT ON

DELETE FROM [job].[Kits]
WHERE
	[ID] = @Id

--endregion

GO