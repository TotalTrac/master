SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [web].[UserCreate] 	
	@Abandoned			bit				= NULL
	, @City				nvarchar(30)	= NULL	
	, @Code				nvarchar(20)	= NULL
	, @CompanyName		nvarchar(100)	= NULL
	, @Country			nvarchar(50)	= NULL	
	, @EmailAddress		nvarchar(320)	= NULL
	, @FirstName		nvarchar(50)	= NULL
	, @IsGeneric		bit
	, @LastName			nvarchar(50)	= NULL
	, @Phone			varchar(20)		= NULL
	, @PostalCode		varchar(15)		= NULL
	, @Region			nvarchar(30)	= NULL
	, @StreetAddress1	nvarchar(100)	= NULL
	, @StreetAddress2	nvarchar(100)	= NULL
	, @Signoff			bit
	, @Title			nvarchar(100)	= NULL
	, @Type				int
	, @URL				nvarchar(100)
	, @VersionID		int	
AS
BEGIN
	SET NOCOUNT ON;
    
	SET XACT_ABORT ON;
			
	BEGIN TRY

		BEGIN TRANSACTION
			
			UPDATE c
			SET
				City				= @City
				, CompanyName		= @CompanyName
				, Country			= @Country
				, EmailAddress		= @EmailAddress
				, FirstName			= @FirstName
				, IsSignoff			= @Signoff
				, LastName			= @LastName
				, Phone				= @Phone
				, PostalCode		= @PostalCode
				, Region			= @Region
				, StreetAddress1	= @StreetAddress1
				, StreetAddress2	= @StreetAddress2
				, Title				= @Title
			FROM
				[dbo].[CampaignUsers] AS c
				INNER JOIN [web].[Users] AS u
					ON c.[Id] = u.USER_TARGETID;
					

			UPDATE [web].[Users]
			SET
				USER_ABANDONED		= @Abandoned
				, USER_CODE			= @Code
				, USER_ISGENERIC	= @IsGeneric
				, USER_TYPE			= @Type
				, USER_URL			= @URL
				, USER_VERSIONID	= @VersionID
			OUTPUT
				inserted.[USER_ID] AS ID, inserted.USER_ROWVERSION AS [VERSION];

			COMMIT TRANSACTION

	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;

		DECLARE @ErrorNumber INT = ERROR_NUMBER();
		DECLARE @ErrorLine INT = ERROR_LINE();
		DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
		DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
		DECLARE @ErrorState INT = ERROR_STATE();

		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));

		RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
END
GO