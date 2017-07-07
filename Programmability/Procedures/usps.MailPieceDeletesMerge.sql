SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[MailPieceDeletesMerge]
	
AS
BEGIN
	SET NOCOUNT ON;
		
	DECLARE @key uniqueidentifier;
	SET @key = NEWID();

	--#####################################
	--
	-- SET THE KEY SO THAT MULTIPLE THREADS
	-- DON'T UPDATE THE SAME RECORDS
	--
	--#####################################
	UPDATE 
		[usps].[MailPieceDeletesStaging] WITH (ROWLOCK, UPDLOCK, READPAST)
	SET
		MAILPIECE_DELETEKEY = @key;
	
	--#####################################
	--
	-- DELETE MAIL PIECES
	--
	--#####################################

	DELETE p 
	FROM 
		[dbo].[MailPieces] AS p 
		INNER JOIN [usps].[MailPieceDeletesStaging] AS s
			ON p.MAILPIECE_ID = s.MAILPIECE_ID
	WHERE
		s.MAILPIECE_DELETEKEY = @key;
	
	--#####################################
	--
	-- DELETE THE STAGING TABLE
	--
	--#####################################
	DELETE 
		[usps].[MailPieceDeletesStaging]
	WHERE
		MAILPIECE_DELETEKEY = @key;
	
END
GO