﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [dbo].[EmailClickLogDeleteById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[EmailClickLogDeleteById]
-- Date Generated: Monday, November 2, 2015
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[EmailClickLogDeleteById]
	@Id int
AS

SET NOCOUNT ON

DELETE FROM [dbo].[mailgun_ClickLog]
WHERE
	[Id] = @Id

--endregion
GO