SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[Find_InSP]
   @string NVARCHAR(MAX)
AS
BEGIN
   SET NOCOUNT ON;

   SELECT
       cmd = N'EXEC sp_helptext ''' 
           + QUOTENAME(OBJECT_SCHEMA_NAME([object_id]))
           + '.' + QUOTENAME([name]) + ''';'
   FROM
       sys.procedures
   WHERE
       OBJECT_DEFINITION([object_id]) LIKE N'%' + @string + '%'
   ORDER BY
       cmd;
END
GO