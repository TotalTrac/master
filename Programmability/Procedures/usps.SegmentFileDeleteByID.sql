SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[SegmentFileDeleteByID]
	@ID int
AS
BEGIN
	SET NOCOUNT ON;

	DELETE 
		[usps].[SegmentFiles]
	WHERE
		[FILE_ID] = @ID;


	IF @@ROWCOUNT > 0
		RETURN 0;
	ELSE
		RETURN 1;	
END
GO