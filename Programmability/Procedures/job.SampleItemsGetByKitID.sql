SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[SampleItemsGetByKitID] 
	@ID int
AS
BEGIN
	
	SET NOCOUNT ON;
    
	SELECT
		ID
		, COPIES
		, GENERICTEXT
		, KITID
		, QUANTITY
		, RUN
		, [Type]
		, [RowVersion]

	FROM
		job.[SampleItems]
	WHERE 
		KITID = @ID
	ORDER BY
		ID;
END
GO