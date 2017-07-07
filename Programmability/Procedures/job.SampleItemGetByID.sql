SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[SampleItemGetByID] 
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
		ID = @ID;
END
GO