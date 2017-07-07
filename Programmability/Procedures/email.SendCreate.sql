SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [email].[SendCreate] 
	@AddressID			int	
	, @ScheduledSend	datetime
	, @Sent				datetime = NULL
	, @SendStatus		int	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	INSERT [email].[Sends]
	(
		AddressId		
		, [Send]
		, [Sent]
		, [Status]
	)
	OUTPUT
		inserted.Id AS ID, inserted.[RowVersion] AS [VERSION]
	VALUES
	(
		@AddressID		
		, @ScheduledSend
		, @Sent
		, @SendStatus		
	);	
END
GO