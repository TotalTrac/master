SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[SampleItemsGet] 
	
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
	ORDER BY
		ID;
END
GO