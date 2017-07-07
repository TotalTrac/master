SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[SampleItemCreate] 
	@KitID		int
	, @Quantity		int
	, @Copies		int
	, @Type			int
	, @GenericText	nvarchar(100) = NULL
	, @Run			int = NULL
AS
BEGIN
	
	SET NOCOUNT ON;
	
    INSERT job.[SampleItems]
	(
		KITID
		, QUANTITY
		, COPIES
		, [Type]
		, GENERICTEXT
		, RUN
	)
	OUTPUT		
		inserted.ID AS ID, inserted.[RowVersion] AS [VERSION]
	VALUES
	(
		@KitID
		, @Quantity
		, @Copies
		, @Type
		, @GenericText
		, @Run
	);
END
GO