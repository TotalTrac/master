﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [messaging].[AttachmentListDeleteById]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [messaging].[AttachmentListDeleteById]
-- Date Generated: Thursday, June 1, 2017
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [messaging].[AttachmentListDeleteById]
	@Id int
AS

SET NOCOUNT ON

DELETE FROM [messaging].[AttachmentLists]
WHERE
	[Id] = @Id

--endregion

GO