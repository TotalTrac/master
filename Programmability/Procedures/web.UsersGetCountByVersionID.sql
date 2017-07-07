SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[UsersGetCountByVersionID] 
	@ID				int	
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		COUNT(u.[USER_ID])
    FROM
		[web].[Users] AS u		
	WHERE
		u.USER_VERSIONID = @ID;
END
GO