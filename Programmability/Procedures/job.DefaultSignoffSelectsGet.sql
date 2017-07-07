SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[DefaultSignoffSelectsGet] 
	
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM tblDefaultSignoffSelects;
END
GO