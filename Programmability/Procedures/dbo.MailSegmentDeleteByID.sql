SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[MailSegmentDeleteByID] 	
	@ID int
AS
BEGIN
	
	SET NOCOUNT ON;

	SET XACT_ABORT ON;

	DECLARE @ReturnValue bit;

	BEGIN TRY
		BEGIN TRANSACTION

			-- REMOVE KIT POINTER
			UPDATE [job].[Kits]
			SET
				SegmentId = NULL
			WHERE
				SegmentId = @ID;

			-- DELETE THE SEGMENT
			DELETE 
				[dbo].[MailSegments]
			WHERE
				MAILSEGMENT_ID = @ID;

			IF @@ROWCOUNT > 0 
				SET @ReturnValue = 0;
			ELSE
				SET @ReturnValue = 1;		

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

	RETURN @ReturnValue;
END
GO