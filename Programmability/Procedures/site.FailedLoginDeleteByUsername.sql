SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [site].[FailedLoginDeleteByUsername] 
	@Username nvarchar(320)
AS
BEGIN
	
	SET NOCOUNT ON;
		
	DELETE 
		[site].[FailedLogins]
	WHERE 
		[Username] = @Username;

	IF @@ROWCOUNT > 0 
		RETURN 0;
	ELSE
		RETURN 1;

END
GO