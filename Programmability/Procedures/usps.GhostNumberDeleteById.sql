SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[GhostNumberDeleteById] 
	@ID int
AS
BEGIN
	
	DELETE 
		[usps].[GhostNumbers] 
	WHERE 
		GHOSTNUMBER_ID = @ID;

	IF @@ROWCOUNT > 0
		RETURN 0
	ELSE
		RETURN 1;
END
GO