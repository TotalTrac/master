﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE FUNCTION [dbo].[GetTableFromParam] (@list nvarchar(MAX))
   RETURNS @tbl TABLE (ListPos int IDENTITY(1, 1) NOT NULL,
                       Number  int NOT NULL) AS
BEGIN
   DECLARE @startpos int,
           @endpos   int,
           @textpos  int,
           @chunklen smallint,
           @str      nvarchar(4000),
           @tmpstr   nvarchar(4000),
           @leftover nvarchar(4000)

   SET @textpos = 1
   SET @leftover = ''
   WHILE @textpos <= datalength(@list) / 2
   BEGIN
      SET @chunklen = 4000 - datalength(@leftover) / 2
      SET @tmpstr = ltrim(@leftover +
                    substring(@list, @textpos, @chunklen))
      SET @textpos = @textpos + @chunklen

      SET @startpos = 0
      SET @endpos = charindex(' ' COLLATE Slovenian_BIN2, @tmpstr)

      WHILE @endpos > 0
      BEGIN
         SET @str = substring(@tmpstr, @startpos + 1,
                              @endpos - @startpos - 1)
         IF @str <> ''
            INSERT @tbl (Number) VALUES(convert(int, @str))
         SET @startpos = @endpos
         SET @endpos = charindex(' ' COLLATE Slovenian_BIN2,
                                 @tmpstr, @startpos + 1)
      END

      SET @leftover = right(@tmpstr, datalength(@tmpstr) / 2 - @startpos)
   END

   IF ltrim(rtrim(@leftover)) <> ''
      INSERT @tbl (number) VALUES(convert(int, @leftover))

   RETURN
END
GO