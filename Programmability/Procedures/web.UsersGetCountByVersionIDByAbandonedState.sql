SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[UsersGetCountByVersionIDByAbandonedState] 
	@ID				int
	, @Abandoned	bit
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		COUNT(u.[USER_ID])
    FROM
		[web].[Users] AS u
	WHERE
		u.USER_VERSIONID = @ID
		AND (u.USER_ABANDONED = @Abandoned OR (u.USER_ABANDONED IS NULL AND @Abandoned IS NULL));
END
GO