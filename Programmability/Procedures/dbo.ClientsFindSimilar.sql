SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ClientsFindSimilar]
	@Keyword nvarchar(MAX)
AS
BEGIN
	SET NOCOUNT ON;
	
	-- 2015-03-03 FJL - We might need to change this to do a word-by-word match. 'Academy of Fine' doesn't return
	--					'Pennsylvania Academy of the Fine Arts'.

	DECLARE @Soundex char(4);
	SET @Soundex = SOUNDEX(@Keyword);
 
	SELECT
		CLIENT_ID
		, CLIENT_PARENTID 
		, CLIENT_NAME	
	FROM
		dbo.Clients
	WHERE
		CHARINDEX(@Keyword, CLIENT_NAME) > 0
		OR CHARINDEX(@Keyword, CLIENT_SHORTNAME) > 0
		OR CHARINDEX(@Keyword, CLIENT_LEGALNAME) > 0
		OR DIFFERENCE(CLIENT_NAME, @Keyword) = 4
		OR DIFFERENCE(CLIENT_SHORTNAME, @Keyword) = 4
		OR DIFFERENCE(CLIENT_LEGALNAME, @Keyword) = 4
		--OR SOUNDEX(CLIENT_NAME) = @Soundex
		--OR SOUNDEX(CLIENT_SHORTNAME) = @Soundex
		--OR SOUNDEX(CLIENT_LEGALNAME) = @Soundex	
	ORDER BY
		CASE WHEN CHARINDEX(@Keyword, CLIENT_NAME) > 0
				OR CHARINDEX(@Keyword, CLIENT_SHORTNAME) > 0
				OR CHARINDEX(@Keyword, CLIENT_LEGALNAME) > 0
				THEN 3
				ELSE CASE WHEN DIFFERENCE(CLIENT_NAME, @Keyword) = 4
					OR DIFFERENCE(CLIENT_SHORTNAME, @Keyword) = 4
					OR DIFFERENCE(CLIENT_LEGALNAME, @Keyword) = 4
					THEN 2
					--ELSE CASE WHEN SOUNDEX(CLIENT_NAME) = @Soundex
					--	OR SOUNDEX(CLIENT_SHORTNAME) = @Soundex
					--	OR SOUNDEX(CLIENT_LEGALNAME) = @Soundex
					--	THEN 1
					--	END
					END
				END
		 DESC,
		 CLIENT_NAME	
	
END
GO