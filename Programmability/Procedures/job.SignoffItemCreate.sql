SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[SignoffItemCreate] 
	@KitID	INT
  , @Instructions VARCHAR(MAX)
	, @Quantity int
	, @Copies	int
	, @Random	BIT
  , @SoDueDate DATETIME
AS
BEGIN
	
	SET NOCOUNT ON;
	
    INSERT job.[SignoffItems]
	(
		KITID
      ,Instructions
		, QUANTITY
		, COPIES
		, RANDOM
      ,SoDueDate
	)
	OUTPUT		
		inserted.ID AS ID, inserted.[ROWVERSION] AS [VERSION]
	VALUES
	(
		@KitID
      ,@Instructions  
		, @Quantity
		, @Copies
		, @Random
      ,@SoDueDate
	);
END
GO