﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [dbo].[EmailContactInfoInsert]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[EmailContactInfoInsert]
-- Date Generated: Wednesday, May 13, 2015
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[EmailContactInfoInsert]
	@Address varchar(200),
	@Subscriberid int

AS

SET NOCOUNT ON

INSERT INTO [dbo].[EmailContactInfo] (
	[Address],
	[SubscriberId]
) 
OUTPUT		
		inserted.Id AS ID, inserted.Rowversion AS [VERSION]
VALUES (
	@Address,
	@Subscriberid
)

--endregion
GO