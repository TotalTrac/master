SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
   
CREATE PROCEDURE [dbo].[Find_InModule]
   @string NVARCHAR(MAX)
AS
BEGIN
   SET NOCOUNT ON;

   SELECT
       cmd = N'EXEC sp_helptext ''' 
           + QUOTENAME(OBJECT_SCHEMA_NAME([object_id]))
           + '.' + QUOTENAME(OBJECT_NAME([object_id])) + ''';'
   FROM
       sys.sql_modules
   WHERE
       [definition] LIKE N'%' + @string + '%'
   ORDER BY
       cmd;
END
GO