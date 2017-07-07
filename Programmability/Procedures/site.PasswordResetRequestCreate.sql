SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [site].[PasswordResetRequestCreate]
	@DateTime		datetime
	, @Host			nvarchar(4000)
	, @IpAddress	varbinary(8)
	, @Key			char(64)
	, @Timestamp	bigint
	, @UserID		int
	, @Username		nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	
	BEGIN TRY
		BEGIN TRANSACTION
			-- DELETE ANY PREVIOUS REQUESTS
			DELETE site.PasswordResetRequests WHERE REQUEST_USERID = @UserID;

			-- INSERT THIS REQUEST
			INSERT [site].[PasswordResetRequests]
			(
				REQUEST_DATETIME
				, REQUEST_HOST
				, REQUEST_IPADDRESS
				, REQUEST_KEY
				, REQUEST_TIMESTAMP
				, REQUEST_USERID
				, REQUEST_USERNAME
			)
			OUTPUT
				INSERTED.REQUEST_ID AS [ID], NULL AS [Version]
			VALUES
			(
				@DateTime
				, @Host
				, @IpAddress
				, @Key
				, @Timestamp
				, @UserID
				, @Username
			);

		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH

		IF @@TRANCOUNT > 0
			ROLLBACK
	END CATCH	
	
END
GO