﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [dbo].[CommentThreadDeleteById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[CommentThreadDeleteById]
-- Date Generated: Tuesday, May 23, 2017
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[CommentThreadDeleteById]
	@Id int
AS

SET NOCOUNT ON

DELETE FROM [dbo].[CommentThreads]
WHERE
	[Id] = @Id

--endregion

GO