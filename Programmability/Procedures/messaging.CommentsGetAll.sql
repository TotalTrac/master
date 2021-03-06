﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [messaging].[CommentsGetAll]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [messaging].[CommentsGetAll]
-- Date Generated: Thursday, June 1, 2017
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [messaging].[CommentsGetAll]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[Content],
	[Created],
	[CreatedByAdmin],
	[CreatedByCurrentUser],
	[CreatedById],
	[Creator],
	[Deleted],
	[FileId],
	[FileName],
	[FileSource],
	[FileMimeType],
	[FileUrl],
	[Fullname],
	[IsNew],
	[Modified],
	[Pings],
	[Parent],
	[ProfileUrl],
	[ProfilePictureUrl],
	[ThreadId],
	[UpVoteCount],
	[UserHasUpvoted],
	[RowVersion]
FROM
	[messaging].[Comments]

--endregion

GO