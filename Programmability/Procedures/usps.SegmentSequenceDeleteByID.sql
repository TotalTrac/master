SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[SegmentSequenceDeleteByID] 
	@ID int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	DELETE
		[usps].[MailSegmentSequences]
	WHERE 
		SEQUENCE_ID = @ID;

	IF @@ROWCOUNT > 0
		RETURN 0
	ELSE 
		RETURN 1;
END
GO