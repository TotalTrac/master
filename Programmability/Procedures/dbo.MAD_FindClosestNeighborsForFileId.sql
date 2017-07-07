SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[MAD_FindClosestNeighborsForFileId] 
	@FileId int	
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRANSACTION;

	WITH 

	--CTE_SelectedKeyedRecords AS (
	--SELECT 
	--	k.*
	--	, UPPER(CONCAT(FirstName,LastName,[Address], City, [State], ZipCode)) AS [MatchInfo]
	--	, mp.MAILPIECE_SEGMENTID
	--FROM MAD_Neighbors_KeyedData k
	--INNER JOIN MailPieceFields f
	--	ON CONVERT(varchar(15),k.KNOWLEDGE_LINK_NUMBER) = CONVERT(varchar(15), f.FIELD_VALUE)
	--INNER JOIN MailPieces mp
	--	ON mp.MAILPIECE_ID = f.FIELD_MAILPIECEID
	--WHERE f.FIELD_NAME = 'KNOWLEDGE_LINK_NUMBER' AND k.FileId = @FileId),

	CTE_SelectedKeyedRecords AS (
	SELECT 
		k.*
		, UPPER(CONCAT(FirstName,LastName,[Address], City, [State], ZipCode)) AS [MatchInfo]
		, f.MAILPIECE_SEGMENTID
	FROM 
		MAD_Neighbors_KeyedData k
		INNER JOIN _MostRecentMADPieces f
			ON k.KNOWLEDGE_LINK_NUMBER =f.KNOWLEDGE_LINK_NUMBER		
	WHERE  k.FileId = @FileId),

	CTE_NeighborData AS (
		SELECT
			* 
		FROM
			CTE_SelectedKeyedRecords k
		CROSS APPLY 
		( 
			SELECT TOP(4) 
				m.FIELD_MAILPIECEID
				, dbo.Haversine(CONVERT(float, m.Latitude), CONVERT(float, m.Longitude), k.Latitude, k.Longitude) AS distance
				, ROW_NUMBER() OVER(ORDER BY dbo.Haversine(CONVERT(float, m.Latitude), CONVERT(float, m.Longitude), k.Latitude, k.Longitude)) AS [Row] 
			FROM 
				dbo._MostRecentMADPieces m   
				INNER JOIN
				(
					SELECT 
						MAILSEGMENT_ID
					FROM 
						dbo.MailSegments seg 
						INNER JOIN
						(
							SELECT 
								m.JOB_ID 
							FROM 
								dbo.Jobs m
								INNER JOIN dbo.MailSegments s
									ON s.MAILSEGMENT_JOBID = m.JOB_ID
							WHERE 
								MAILSEGMENT_ID = k.MAILPIECE_SEGMENTID
						) AS mailing
					ON mailing.JOB_ID = seg.MAILSEGMENT_JOBID
				) AS segments
				ON 
					segments.MAILSEGMENT_ID = m.MAILPIECE_SEGMENTID -- Check only segments within the same mailing
			WHERE 
				dbo.Haversine(CONVERT(float, m.Latitude), CONVERT(float, m.Longitude), k.Latitude, k.Longitude) <= 2 -- Distance is less than or equal to 2 miles
				AND m.MatchInfo NOT IN (SELECT MatchInfo FROM CTE_SelectedKeyedRecords) -- Make sure not to return someone that has already responded   
			GROUP 
				BY m.FIELD_MAILPIECEID, m.Latitude, m.Longitude
		) AS A  
	),

	CTE_Results AS (
		(
			SELECT 
				Id
				, [1] AS [Neighbor1]
				, [2] AS [Neighbor2]
				, [3] AS [Neighbor3]
				, [4] AS [Neighbor4]
			FROM
			(
				SELECT 
					Id
					, FIELD_MAILPIECEID
					, [Row]
				FROM 
					CTE_NeighborData
			) AS SourceTable
			PIVOT
			(
				MAX(FIELD_MAILPIECEID)
				FOR [Row] IN ([1], [2], [3], [4])
			) AS results
		)
	)

	MERGE INTO MAD_Neighbors_KeyedData AS k
	USING CTE_Results r 
		ON r.id = k.id         
	WHEN MATCHED THEN
	   UPDATE 
		  SET k.ClosestNeighbor1Id = r.Neighbor1,
			  k.ClosestNeighbor2Id = r.Neighbor2,
    		k.ClosestNeighbor3Id = r.Neighbor3,
			  k.ClosestNeighbor4Id = r.Neighbor4;

	UPDATE 
		MAD_Neighbors_Files
	SET
		processeddatetime = GETUTCDATE()
	WHERE
		id = @FileId;

	COMMIT TRANSACTION;

END
GO