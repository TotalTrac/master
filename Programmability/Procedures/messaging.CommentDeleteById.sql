﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [messaging].[CommentDeleteById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [messaging].[CommentDeleteById]
-- Date Generated: Thursday, June 1, 2017
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [messaging].[CommentDeleteById]
	@Id int
AS

SET NOCOUNT ON

DELETE FROM [messaging].[Comments]
WHERE
	[Id] = @Id

--endregion

GO