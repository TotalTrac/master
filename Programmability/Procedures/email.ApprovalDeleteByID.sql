SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[ApprovalDeleteByID] 
	@ID	int
AS
BEGIN

	DELETE 
		[email].[Approvals]
	WHERE 
		Id = @ID;
END
GO