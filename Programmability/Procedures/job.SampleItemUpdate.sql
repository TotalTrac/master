SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[SampleItemUpdate]
	@ID				int
	, @KitID	int
	, @Quantity		int
	, @Copies		int
	, @Type			int
	, @GenericText	nvarchar(100)
	, @Run			int
	, @Version		timestamp
AS
BEGIN
	
	SET NOCOUNT ON;
	
	UPDATE 
		job.[SampleItems]
	SET
		KitId		= @KitID
		, Quantity		= @Quantity
		, Copies			= @Copies
		, [Type]			= @Type
		, GenericText	= @GenericText
		, Run			= @Run
	OUTPUT		
		inserted.ID AS ID, inserted.[RowVersion] AS [VERSION]
	WHERE
		Id = @ID
		AND [RowVersion] = @VERSION;
END
GO