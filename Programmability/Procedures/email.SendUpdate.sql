SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[SendUpdate] 
	@ID					int
	, @AddressID		int	
	, @ScheduledSend	datetime
	, @Sent				datetime = NULL
	, @SendStatus		int	
	, @Version			timestamp
AS
BEGIN
	
	SET NOCOUNT ON;
	
	UPDATE [email].[Sends]
	SET
		AddressId	= @AddressID		
		, [Send]	= @ScheduledSend
		, [Sent]	= @Sent
		, [Status]	= @SendStatus
	OUTPUT
		inserted.Id AS ID, inserted.[RowVersion] AS [VERSION]
	WHERE 
		(Id = @ID) AND
		([RowVersion] = @Version);
END
GO