SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[MailPieceScansGetHistoricalAverage]
	@EntryPoint			char(5) = NULL
	, @Destination		char(5) = NULL
	, @PostalClassID	int
	, @From				date = NULL
	, @To				date = NULL
AS
BEGIN
	SET NOCOUNT ON;


	If @Destination IS NULL
		BEGIN
			SELECT
				SUM(NDC_PIECES) AS [TOTAL PIECES]
				, (SUM(CONVERT(bigint,NDC_PIECES * NDC_AVERAGEHOURS)) / SUM(CONVERT(bigint,NDC_PIECES))) AS [AVG HOURS]
			FROM [usps].NdcFinalizedAverages
			WHERE
				@PostalClassID = NDC_POSTALCLASSID
				AND (@EntryPoint IS NULL OR @EntryPoint = NDC_ENTRYPOINT)
				AND (@From IS NULL OR NDC_SCANDATE > @From)
				AND (@To IS NULL OR NDC_SCANDATE < @To)
		END
	ELSE
		BEGIN
			WITH CTE AS 
			(
				SELECT
					MAILPIECE_ID
					, MAILPIECESCAN_DATETIME			
					, OPERATION_CUTOFF
					, MAILSEGMENT_DROPDATE					
					FROM
						[dbo].[MailPieces] AS p
						INNER JOIN [dbo].[MailPieceScans] AS scan
							ON p.MAILPIECE_FINALIZESCANID = scan.MAILPIECESCAN_ID
						INNER JOIN [dbo].[Operations] AS o
							ON o.OPERATION_ID = scan.MAILPIECESCAN_OPERATIONID
						INNER JOIN [dbo].[MailSegments] AS seg
							ON p.MAILPIECE_SEGMENTID = seg.MAILSEGMENT_ID
					WHERE
						(MAILSEGMENT_POSTALCLASSID = @PostalClassID 
							AND (@EntryPoint IS NULL OR MAILSEGMENT_ENTRYPOINT = @EntryPoint))
						AND (@Destination IS NULL OR (LEFT(MAILPIECE_ZIPCODE, LEN(@Destination)) = @Destination))
						AND (@From IS NULL OR @From <= MAILSEGMENT_DROPDATE)
						AND (@To IS NULL OR @To >= MAILSEGMENT_DROPDATE)
			)
			SELECT
				COALESCE(COUNT(CTE.MAILPIECE_ID), 0) AS [TOTAL PIECES],
				CONVERT(bigint, COALESCE(AVG(DATEDIFF(HOUR, CTE.MAILSEGMENT_DROPDATE, 		
					CASE 
						WHEN CONVERT(TIME, CTE.MAILPIECESCAN_DATETIME) < CTE.OPERATION_CUTOFF THEN DATEADD(dd, 0, DATEDIFF(dd, 0, CTE.MAILPIECESCAN_DATETIME))
						ELSE DATEADD(dd, 1, DATEDIFF(dd, 0, CTE.MAILPIECESCAN_DATETIME)) 
					END		
				)), 0)) AS [AVG HOURS]
			FROM		
				CTE			
		END
END
GO