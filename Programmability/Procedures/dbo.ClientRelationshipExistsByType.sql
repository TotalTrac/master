﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [dbo].[ClientRelationshipsGetByPartnerClientId]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[ClientRelationshipsGetByPartnerClientId]
-- Date Generated: Friday, March 3, 2017
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[ClientRelationshipExistsByType] @Id INT,
  @PartnerId INT,
  @RelationshipType INT
AS

  SET NOCOUNT ON
  SET TRANSACTION ISOLATION LEVEL READ COMMITTED
IF EXISTS(
  SELECT
    [Id]
  FROM [dbo].[ClientRelationships]
  WHERE ParentClientId = @Id AND [PartnerClientId] = @PartnerId AND RelationshipState = 1 AND @RelationshipType & RelationshipType <> 0
  )
	RETURN 1;
	ELSE
		RETURN 0;
--endregion
GO