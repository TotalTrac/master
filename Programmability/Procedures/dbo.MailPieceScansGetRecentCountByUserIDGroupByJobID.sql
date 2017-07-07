SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[MailPieceScansGetRecentCountByUserIDGroupByJobID]
	@ID			int
	, @DateTime	datetime = NULL
	WITH RECOMPILE
AS
BEGIN
	
	SET NOCOUNT ON;

    WITH CTE 
	(
		CLIENT_ID
	)
	AS
	(
		(SELECT c.CLIENT_ID
		FROM [dbo].[Clients] AS c
			INNER JOIN [dbo].[Relationships] AS r
				ON c.CLIENT_ID = r.RELATIONSHIP_CLIENTID
		WHERE 
			c.CLIENT_PARENTID IS NULL
			AND r.RELATIONSHIP_USERID = @ID

			UNION
		
		SELECT 
			c.CLIENT_ID
		FROM [dbo].[Clients] AS c
			INNER JOIN [dbo].[Users] AS u
				ON c.CLIENT_ID = u.USER_CLIENT_ID
		WHERE 
			u.USER_USERID = @ID
		)
			
		UNION ALL

		SELECT 
			c.CLIENT_ID
		FROM [dbo].[Clients] AS c
			INNER JOIN [dbo].[Relationships] AS r
				ON c.CLIENT_ID = r.RELATIONSHIP_CLIENTID
			INNER JOIN CTE
				ON CTE.CLIENT_ID = c.CLIENT_PARENTID
		WHERE 
			c.CLIENT_PARENTID IS NOT NULL
			AND r.RELATIONSHIP_USERID = @ID
	)
	SELECT 
		m.JOB_ID		
		, COUNT(DISTINCT p.MAILPIECE_ID) AS [COUNT]
	FROM 
		[dbo].[MailPieceScans] AS s
		INNER JOIN [dbo].[MailPieces] AS p
			ON s.MAILPIECESCAN_MAILPIECEID = p.MAILPIECE_ID
		INNER JOIN [dbo].[MailSegments] AS seg
			ON p.MAILPIECE_SEGMENTID = seg.MAILSEGMENT_ID
		INNER JOIN [dbo].[Jobs] AS m
			ON seg.MAILSEGMENT_JOBID = m.JOB_ID
		INNER JOIN [job].[Jobs] AS j
			ON m.JOB_JOBID = j.JOB_ID
		INNER JOIN CTE
			ON j.JOB_CLIENTID = CTE.CLIENT_ID
	WHERE
		(@DateTime IS NULL OR s.MAILPIECESCAN_DATETIME = @DateTime)
	GROUP BY
		m.JOB_ID
	--ORDER BY
	--	[COUNT] DESC;
END
GO