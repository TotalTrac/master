SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [site].[LogonUpdate] 
	@ID					int
	, @InactiveLogout	int
	, @LockedOut		bit
	, @Logons			int
	, @SiteID			int
	, @UserID			int
	, @Version			timestamp
AS
BEGIN
	SET NOCOUNT ON;
	
	UPDATE [site].[Logons]
	SET
		LOGON_INACTIVELOGOUT	= @InactiveLogout
		, LOGON_LOCKEDOUT		= @LockedOut
		, LOGON_LOGONS			= @Logons
		, LOGON_SITEID			= @SiteID
		, LOGON_USERID			= @UserID
	OUTPUT
		inserted.LOGON_ID AS ID, inserted.LOGON_ROWVERSION AS [VERSION]
	WHERE
		LOGON_ID = @ID
		AND LOGON_ROWVERSION = @Version;
END
GO