SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [site].[FailedLoginGetByUsername] 
	@Username nvarchar(320)
AS
BEGIN
	
	SET NOCOUNT ON;
	    
	MERGE INTO [site].[FailedLogins] AS a
	USING 
		(SELECT @Username AS [Username]) AS b
			ON a.[Username] = b.[Username]
	WHEN MATCHED THEN
		UPDATE SET
			[FailedLogins] = [FailedLogins] + 1
	WHEN NOT MATCHED THEN		
		INSERT (Username, FailedLogins)
		VALUES (@Username, 1); 
		
	SELECT
		[Username]
		, [FailedLogins]
	FROM
		[site].[FailedLogins]
	WHERE
		[Username] = @Username;
END
GO