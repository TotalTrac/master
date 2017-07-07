SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Maintenance_ReIndexAllTables] 
	
AS
BEGIN
	SET NOCOUNT ON;
    
	DECLARE @TableName varchar(255);

	DECLARE 
		TableCursor 
	CURSOR FOR 
		SELECT table_name FROM information_schema.tables 
		WHERE table_type = 'base table';

	OPEN TableCursor; 

	FETCH NEXT FROM TableCursor INTO @TableName ;
	
	WHILE @@FETCH_STATUS = 0 
	BEGIN 
		DBCC DBREINDEX(@TableName,' ', 0); 
		FETCH NEXT FROM TableCursor INTO @TableName ;
	END 

	CLOSE TableCursor;

	DEALLOCATE TableCursor;
END
GO