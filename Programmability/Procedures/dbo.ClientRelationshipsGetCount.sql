﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [dbo].[ClientRelationshipsGetAll]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[ClientRelationshipsGetAll]
-- Date Generated: Friday, March 3, 2017
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[ClientRelationshipsGetCount]
  @Id int
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	COUNT([Id])	
FROM
	[dbo].[ClientRelationships]
WHERE ParentClientId = @Id AND RelationshipState = 1
--endregion

GO