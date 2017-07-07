SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[SubscriberDeleteByID]
	@ID	int
AS
BEGIN
	SET NOCOUNT ON;
	
	DELETE [email].[Subscribers]
	WHERE
		Id = @ID;
END
GO