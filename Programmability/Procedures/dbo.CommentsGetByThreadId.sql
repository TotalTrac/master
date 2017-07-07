﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
--region [dbo].[CommentsGetByThreadId]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[CommentsGetByThreadId]
-- Date Generated: Tuesday, May 23, 2017
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[CommentsGetByThreadId]
	@Id int
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
	[dbo].[Comments]
WHERE
	[ThreadId] = @Id

--endregion

GO