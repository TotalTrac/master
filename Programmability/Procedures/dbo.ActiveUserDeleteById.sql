﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [dbo].[ActiveUserDeleteById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[ActiveUserDeleteById]
-- Date Generated: Monday, June 5, 2017
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[ActiveUserDeleteById]
	@Id int
AS

SET NOCOUNT ON

DELETE FROM [dbo].[ActiveUsers]
WHERE
	[Id] = @Id

--endregion

GO