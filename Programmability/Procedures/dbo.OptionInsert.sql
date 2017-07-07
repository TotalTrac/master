﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [dbo].[OptionInsert]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[OptionInsert]
-- Date Generated: Wednesday, October 12, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[OptionInsert]
	@Userid int,
	@Json varchar(max)

AS

SET NOCOUNT ON

INSERT INTO [dbo].[Options] (
	[UserId],
	[Json]
) 
OUTPUT		
		inserted.Id AS ID, inserted.Rowversion AS [VERSION]
VALUES (
	@Userid,
	@Json
)

--endregion

GO