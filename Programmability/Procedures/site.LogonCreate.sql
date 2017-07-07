SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [site].[LogonCreate] 
	@InactiveLogout	int
	, @LockedOut	bit
	, @Logons		int
	, @SiteID		int
	, @UserID		int
AS
BEGIN
	SET NOCOUNT ON;
	
	INSERT INTO [site].[Logons]
	(
		LOGON_INACTIVELOGOUT
		, LOGON_LOCKEDOUT
		, LOGON_LOGONS
		, LOGON_SITEID
		, LOGON_USERID
	)
	OUTPUT
		inserted.LOGON_ID AS ID, inserted.LOGON_ROWVERSION AS [VERSION]
	VALUES
	(
		@InactiveLogout
		, @LockedOut
		, @Logons
		, @SiteID
		, @UserID
	);
END
GO