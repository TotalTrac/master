SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[BinaryIpAddressToString]
(
    @BinaryIP binary(16)
)
RETURNS nvarchar(39)
AS
BEGIN
    DECLARE @ipAsString nvarchar(39)

    -- Is IPv4
    IF (substring(@binaryIP, 5, 1) = 0x00)  
		BEGIN

			SELECT @ipAsString = CAST(CAST(substring(@binaryIP, 1, 1) AS int) AS nvarchar(3)) + '.' +
			CAST(CAST(substring(@binaryIP, 2, 1) AS int) AS nvarchar(3)) + '.' +
			CAST(CAST(substring(@binaryIP, 3, 1) AS int) AS nvarchar(3)) + '.' +
			CAST(CAST(substring(@binaryIP, 4, 1) AS int) AS nvarchar(3))

		END
    ELSE
		BEGIN
		-- Is IPv6
			-- taken and modified from http://support.microsoft.com/kb/104829
			DECLARE @i int
			DECLARE @length int
			DECLARE @hexstring char(16)

			SELECT @ipAsString = ''
			SELECT @i = 1
			SELECT @length = 16
			SELECT @hexstring = '0123456789ABCDEF'

			WHILE (@i <= @length)
			BEGIN
				DECLARE @tempint int
				DECLARE @firstint int
				DECLARE @secondint int

				SELECT @tempint = convert(int, substring(@binaryIP,@i,1))
				SELECT @firstint = floor(@tempint/16)
				SELECT @secondint = @tempint - (@firstint*16)

				SELECT @ipAsString = @ipAsString + substring(@hexstring, @firstint+1, 1) + substring(@hexstring, @secondint+1, 1)

				IF (@i % 2 = 0)
					SELECT @ipAsString = @ipAsString + ':'

				SELECT @i = @i + 1
		   END
		END

		-- Return the result of the function
		RETURN @ipAsString
END
GO