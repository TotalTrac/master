﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [messaging].[PrivateMessageDeleteById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [messaging].[PrivateMessageDeleteById]
-- Date Generated: Wednesday, June 7, 2017
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [messaging].[PrivateMessageDeleteById]
	@Id int
AS

SET NOCOUNT ON

DELETE FROM [messaging].[PrivateMessages]
WHERE
	[Id] = @Id

--endregion

GO