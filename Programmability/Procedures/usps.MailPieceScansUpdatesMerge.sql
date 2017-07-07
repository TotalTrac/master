SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[MailPieceScansUpdatesMerge]
	
AS
BEGIN
	SET NOCOUNT ON;

	SET XACT_ABORT ON;
			
	BEGIN TRY
		BEGIN TRANSACTION

			-- DECLARE A TABLE VARIABLE TO HOLD OUR MAILPIECE_IDs
			--DECLARE @MailPieces TABLE (
			--	MAILPIECE_SEGMENTID	int INDEX IX_MailSegmentID NONCLUSTERED
			--	, MAILPIECE_ID		int INDEX IX_MailPieceID CLUSTERED
			--);

			CREATE TABLE #temp_MailPieces (
				MAILPIECE_SEGMENTID	int
				, MAILPIECE_ID		int
			);

			-- DELETE ALL OF THE ROWS WAITING IN MailPieceScanUpdates AND OUTPUT
			-- THE RESULTS INTO OUR MAIL PIECES TABLE VARIABLE
			--DELETE u WITH (TABLOCK, UPDLOCK, READPAST)
			--OUTPUT deleted.MAILPIECE_SEGMENTID, deleted.MAILPIECE_ID
			--INTO @MailPieces
			--FROM 
			--	[usps].[MailPieceScanUpdates] u
				-- 2016-07-01 FJL - Added the segment ID to the usps.MailPieceScanUpdates table
				--INNER JOIN [dbo].[MailPieces] AS p
				--	ON u.MAILPIECE_ID = p.MAILPIECE_ID;

			DELETE u WITH (TABLOCK, UPDLOCK, READPAST)
			OUTPUT deleted.MAILPIECE_SEGMENTID, deleted.MAILPIECE_ID
			INTO #temp_MailPieces
			FROM 
				[usps].[MailPieceScanUpdates] u

			-- CREATE OUR INDEXES
			CREATE CLUSTERED INDEX IX_MailPieceID ON #temp_MailPieces (MAILPIECE_ID);
			CREATE NONCLUSTERED INDEX IX_MailSegmentID ON #temp_MailPieces (MAILPIECE_SEGMENTID);			

			-- DECLARE TABLE VARIABLE FOR ALL OF THE MAILPIECE SCANS WE'll NEED
			--DECLARE @MailPieceScans TABLE (
			--	MAILPIECESCAN_ID			int			INDEX IX_MailPieceScanID CLUSTERED
			--	, MAILPIECESCAN_DATETIME	datetime 
			--	, MAILSEGMENT_ID			int			INDEX IX_MailSegmentID NONCLUSTERED
			--	, MAILPIECESCAN_MAILPIECEID int			INDEX IX_MailPieceID NONCLUSTERED
			--	, OPERATION_CODE			int 
			--	, OPERATION_CUTOFF			time(0) 
			--	-- COMPOSITE INDEXES
			--	, INDEX IX_MailSegmentID_DateTime_MailPieceScanID NONCLUSTERED (MAILSEGMENT_ID, MAILPIECESCAN_DATETIME, MAILPIECESCAN_ID)
			--	, INDEX IX_MailPieceID_DateTime_Code NONCLUSTERED(MAILPIECESCAN_MAILPIECEID, MAILPIECESCAN_DATETIME, OPERATION_CODE)	
			--	, INDEX IX_MailPieceScanID_DateTime_MailPieceID_Cutoff NONCLUSTERED(MAILPIECESCAN_ID, MAILPIECESCAN_DATETIME, MAILPIECESCAN_MAILPIECEID, OPERATION_CODE)
			--	, INDEX IX_MailPieceID_Cutoff_DateTime NONCLUSTERED(MAILPIECESCAN_MAILPIECEID, OPERATION_CUTOFF, MAILPIECESCAN_DATETIME)
			--); 
  	
			-- DECLARE TABLE VARIABLE FOR ALL OF THE MAILPIECE SCANS WE'll NEED
			CREATE TABLE #temp_MailPieceScans (
				MAILPIECESCAN_ID			int
				, MAILPIECESCAN_DATETIME	datetime
				, MAILSEGMENT_ID			int
				, MAILPIECESCAN_MAILPIECEID int
				, OPERATION_CODE			int
				, OPERATION_CUTOFF			time(0)
  			);
			
			-- POPULATE OUR TABLE VARIABLE
			--INSERT INTO @MailPieceScans			
			INSERT INTO #temp_MailPieceScans
			SELECT
				s.MAILPIECESCAN_ID
				, s.MAILPIECESCAN_DATETIME
				, u.MAILPIECE_SEGMENTID
				, s.MAILPIECESCAN_MAILPIECEID
				, o.OPERATION_CODE
				, o.OPERATION_CUTOFF
			FROM
				dbo.MailPieceScans AS s
				INNER JOIN dbo.Operations AS o
					ON s.MAILPIECESCAN_OPERATIONID = o.OPERATION_ID
				--INNER JOIN @MailPieces AS u
				INNER JOIN #temp_MailPieces AS u
					ON s.MAILPIECESCAN_MAILPIECEID = u.MAILPIECE_ID;

			-- CREATE INDEXES
			CREATE CLUSTERED INDEX IX_MailPieceScanID ON #temp_MailPieceScans(MAILPIECESCAN_ID);
			CREATE NONCLUSTERED INDEX IX_MailPieceScanID_DateTime_MailPieceID_Cutoff ON #temp_MailPieceScans (MAILPIECESCAN_ID, MAILPIECESCAN_DATETIME, MAILPIECESCAN_MAILPIECEID, OPERATION_CODE);
			CREATE NONCLUSTERED INDEX IX_MailSegmentID_DateTime_MailPieceScanID ON #temp_MailPieceScans (MAILSEGMENT_ID, MAILPIECESCAN_DATETIME, MAILPIECESCAN_ID);
			CREATE NONCLUSTERED INDEX IX_MailPieceID_DateTime_Code ON #temp_MailPieceScans (MAILPIECESCAN_MAILPIECEID, MAILPIECESCAN_DATETIME, OPERATION_CODE);
			CREATE NONCLUSTERED INDEX IX_MailPieceID_Cutoff_DateTime ON #temp_MailPieceScans (MAILPIECESCAN_MAILPIECEID, OPERATION_CUTOFF, MAILPIECESCAN_DATETIME);

			-- UPDATE OUR MAILPIECES WITH THE APPROPRIATE SCAN IDs ---------------------------
			UPDATE
				p
			SET	
				-- GET FINALIZED SCAN
				MAILPIECE_FINALIZESCANID = (
					SELECT TOP 1 MAILPIECESCAN_ID 
					FROM
						--@MailPieceScans AS s
						#temp_MailPieceScans AS s
					WHERE 
						p.MAILPIECE_ID = s.MAILPIECESCAN_MAILPIECEID
						AND s.OPERATION_CUTOFF IS NOT NULL
					ORDER BY
						s.MAILPIECESCAN_DATETIME
				)

				-- GET FIRST SCAN
				, MAILPIECE_FIRSTSCANID = (
					SELECT TOP 1 MAILPIECESCAN_ID 
					FROM 
						--@MailPieceScans AS s
						#temp_MailPieceScans AS s
					WHERE 
						p.MAILPIECE_ID = s.MAILPIECESCAN_MAILPIECEID				
					ORDER BY
						s.MAILPIECESCAN_DATETIME
				)

				-- GET FORWARDED SCAN
				, MAILPIECE_FORWARDSCANID = (
					SELECT TOP 1 MAILPIECESCAN_ID 
					FROM
						--@MailPieceScans AS s
						#temp_MailPieceScans AS s
					WHERE 
						p.MAILPIECE_ID = s.MAILPIECESCAN_MAILPIECEID
						AND (s.OPERATION_CODE = 58 OR s.OPERATION_CODE = 93 OR s.OPERATION_CODE = 97)
					ORDER BY
						s.MAILPIECESCAN_DATETIME
				)

				-- GET LAST SCAN
				, MAILPIECE_LASTSCANID = (
					SELECT TOP 1 MAILPIECESCAN_ID 
					FROM
						--@MailPieceScans AS s
						#temp_MailPieceScans AS s
					WHERE 
						p.MAILPIECE_ID = s.MAILPIECESCAN_MAILPIECEID				
					ORDER BY
						s.MAILPIECESCAN_DATETIME DESC
				)

				-- GET RETURNED SCAN
				, MAILPIECE_RETURNSCANID = (
					SELECT TOP 1 MAILPIECESCAN_ID 
					FROM
						--@MailPieceScans AS s				
						#temp_MailPieceScans AS s
					WHERE 
						p.MAILPIECE_ID = s.MAILPIECESCAN_MAILPIECEID
						AND (s.OPERATION_CODE = 59 OR s.OPERATION_CODE = 86 OR s.OPERATION_CODE = 91 OR s.OPERATION_CODE = 5091)
					ORDER BY
						s.MAILPIECESCAN_DATETIME
				)
			FROM
				[dbo].[MailPieces] AS p
				--INNER JOIN @MailPieces AS u
				INNER JOIN #temp_MailPieces AS u
					ON p.MAILPIECE_ID = u.MAILPIECE_ID	
			--OPTION (RECOMPILE);
			--------------------------------------------------------------------------------------


			-- UPDATE DELIVERY DATE --------------------------------------------------------------
			UPDATE
				p
			SET	
				MAILPIECE_DELIVERYDATE = [usps].[GetDeliveryDateFromScan](MAILPIECE_FINALIZESCANID)
			FROM
				[dbo].[MailPieces] AS p		
				--INNER JOIN @MailPieces AS u
				INNER JOIN #temp_MailPieces AS u
					ON p.MAILPIECE_ID = u.MAILPIECE_ID
			WHERE
				MAILPIECE_FINALIZESCANID IS NOT NULL
			--OPTION (RECOMPILE);
			---------------------------------------------------------------------------------------
	

			-- DECLARE A TABLE VARIABLE TO HOLD OUR MAILSEGMENT_IDs -------------------------------
			DECLARE @Segments TABLE (MAILSEGMENT_ID integer INDEX IX_SegmentID CLUSTERED);

			-- POPULATE THE SEGMENTS WE'VE TOUCHED
			INSERT @Segments
			SELECT
				DISTINCT u.MAILPIECE_SEGMENTID
			FROM
				--@MailPieces AS u;
				#temp_MailPieces AS u;
			----------------------------------------------------------------------------------------

			----------------------------------------------------------------------------------------
			-- 2016-02-11 FJL - These next four inserts assume that the various scan IDs on the 
			--					segment are accurate.  For example, that the MAILSEGMENT_FIRSTSCANID
			--					is in fact the ID for the actual first scan the segment has received
			----------------------------------------------------------------------------------------

			-- UPDATE OUR MAIL PIECE SCANS TABLE VARIABLE WITH SEGMENT FIRST SCAN ------------------
			--INSERT INTO @MailPieceScans
			INSERT INTO #temp_MailPieceScans
			(
				MAILPIECESCAN_ID
				, MAILPIECESCAN_DATETIME
				, MAILPIECESCAN_MAILPIECEID
				, OPERATION_CODE
				, OPERATION_CUTOFF
			)
			SELECT
				scan.MAILPIECESCAN_ID
				, scan.MAILPIECESCAN_DATETIME
				, scan.MAILPIECESCAN_MAILPIECEID
				, o.OPERATION_CODE
				, o.OPERATION_CUTOFF
			FROM
				@Segments AS seg1
				INNER JOIN dbo.MailSegments AS seg2
					ON seg1.MAILSEGMENT_ID = seg2.MAILSEGMENT_ID
				INNER JOIN dbo.MailPieceScans AS scan
					ON seg2.MAILSEGMENT_FIRSTSCANID = scan.MAILPIECESCAN_ID
				INNER JOIN dbo.Operations AS o
					ON scan.MAILPIECESCAN_OPERATIONID = o.OPERATION_ID
			------------------------------------------------------------------------------------------	 

			-- UPDATE OUR MAIL PIECE SCANS TABLE VARIABLE WITH SEGMENT FIRST FINALIZE SCANS ----------
			--INSERT INTO @MailPieceScans
			INSERT INTO #temp_MailPieceScans
			(
				MAILPIECESCAN_ID
				, MAILPIECESCAN_DATETIME
				, MAILPIECESCAN_MAILPIECEID
				, OPERATION_CODE
				, OPERATION_CUTOFF
			)
			SELECT
				scan.MAILPIECESCAN_ID
				, scan.MAILPIECESCAN_DATETIME
				, scan.MAILPIECESCAN_MAILPIECEID
				, o.OPERATION_CODE
				, o.OPERATION_CUTOFF
			FROM
				@Segments AS seg1
				INNER JOIN dbo.MailSegments AS seg2
					ON seg1.MAILSEGMENT_ID = seg2.MAILSEGMENT_ID
				INNER JOIN dbo.MailPieceScans AS scan
					ON seg2.MAILSEGMENT_FIRSTFINALIZESCANID = scan.MAILPIECESCAN_ID
				INNER JOIN dbo.Operations AS o
					ON scan.MAILPIECESCAN_OPERATIONID = o.OPERATION_ID
			-----------------------------------------------------------------------------------------	 
		
			-- UPDATE OUR MAIL PIECE SCANS TABLE VARIABLE WITH SEGMENT LAST SCAN --------------------
			--INSERT INTO @MailPieceScans
			INSERT INTO #temp_MailPieceScans
			(
				MAILPIECESCAN_ID
				, MAILPIECESCAN_DATETIME
				, MAILPIECESCAN_MAILPIECEID
				, OPERATION_CODE
				, OPERATION_CUTOFF
			)
			SELECT
				scan.MAILPIECESCAN_ID
				, scan.MAILPIECESCAN_DATETIME
				, scan.MAILPIECESCAN_MAILPIECEID
				, o.OPERATION_CODE
				, o.OPERATION_CUTOFF
			FROM
				@Segments AS seg1
				INNER JOIN dbo.MailSegments AS seg2
					ON seg1.MAILSEGMENT_ID = seg2.MAILSEGMENT_ID
				INNER JOIN dbo.MailPieceScans AS scan
					ON seg2.MAILSEGMENT_LASTSCANID = scan.MAILPIECESCAN_ID
				INNER JOIN dbo.Operations AS o
					ON scan.MAILPIECESCAN_OPERATIONID = o.OPERATION_ID
			------------------------------------------------------------------------------------------	 

			-- UPDATE OUR MAIL PIECE SCANS TABLE VARIABLE WITH SEGMENT LAST FINALIZE SCAN ------------
			--INSERT INTO @MailPieceScans
			INSERT INTO #temp_MailPieceScans
			(
				MAILPIECESCAN_ID
				, MAILPIECESCAN_DATETIME
				, MAILPIECESCAN_MAILPIECEID
				, OPERATION_CODE
				, OPERATION_CUTOFF
			)
			SELECT
				scan.MAILPIECESCAN_ID
				, scan.MAILPIECESCAN_DATETIME
				, scan.MAILPIECESCAN_MAILPIECEID
				, o.OPERATION_CODE
				, o.OPERATION_CUTOFF
			FROM
				@Segments AS seg1
				INNER JOIN dbo.MailSegments AS seg2
					ON seg1.MAILSEGMENT_ID = seg2.MAILSEGMENT_ID
				INNER JOIN dbo.MailPieceScans AS scan
					ON seg2.MAILSEGMENT_LASTFINALIZESCANID = scan.MAILPIECESCAN_ID
				INNER JOIN dbo.Operations AS o
					ON scan.MAILPIECESCAN_OPERATIONID = o.OPERATION_ID
			------------------------------------------------------------------------------------------	 

			------------------------------------------------------------------------------------------
			-- 2016-02-11 FJL - Okay, so now the @MailPieceScans table variable should hold all of the
			--					scans that we've just received from the USPS along with the first, 
			--					first finalized, last, and last finalized scans for each segment.
			------------------------------------------------------------------------------------------

			-- UPDATE THE SEGMENT'S FIRST SCAN -------------------------------------------------------
			; WITH CTE_Scans AS
			(
				SELECT 
					scan.MAILSEGMENT_ID AS [MAILSEGMENT_ID]
					, ROW_NUMBER() over (partition by scan.MAILSEGMENT_ID order by scan.MAILPIECESCAN_DATETIME) AS [MAILSEGMENT_RN]                                            	    
					, scan.MAILPIECESCAN_ID AS [MAILSEGMENT_SCANID]			                                
				FROM			
					--@MailPieceScans AS scan
					#temp_MailPieceScans AS scan
			)
			UPDATE s
			SET
				s.MAILSEGMENT_FIRSTSCANID = f.MAILSEGMENT_SCANID
			FROM 
				CTE_Scans AS f
				INNER JOIN dbo.MailSegments AS s
					ON f.MAILSEGMENT_ID = s.MAILSEGMENT_ID
						AND f.MAILSEGMENT_RN = 1
			--OPTION (RECOMPILE);
			-------------------------------------------------------------------------------------------

			-- UPDATE THE SEGMENT'S FIRST FINALIZE SCAN ----------------------------------------------
			; WITH CTE_FinalizedScans AS
			(
				SELECT 
					scan.MAILSEGMENT_ID AS [MAILSEGMENT_ID]
					, ROW_NUMBER() over (partition by scan.MAILSEGMENT_ID order by scan.MAILPIECESCAN_DATETIME) AS [MAILSEGMENT_RN]                                            	    
					, scan.MAILPIECESCAN_ID AS [MAILSEGMENT_SCANID]			                                
				FROM			
					--@MailPieceScans AS scan
					#temp_MailPieceScans AS scan
				WHERE
					scan.OPERATION_CUTOFF IS NOT NULL
			)
			UPDATE s
			SET
				s.MAILSEGMENT_FIRSTFINALIZESCANID = f.MAILSEGMENT_SCANID
			FROM 
				CTE_FinalizedScans AS f
				INNER JOIN dbo.MailSegments AS s
					ON f.MAILSEGMENT_ID = s.MAILSEGMENT_ID
						AND f.MAILSEGMENT_RN = 1
			--OPTION (RECOMPILE);
			-------------------------------------------------------------------------------------------
	
			-- UPDATE THE SEGMENT'S LAST SCAN -------------------------------------------------------
			; WITH CTE_Scans AS
			(
				SELECT 
					scan.MAILSEGMENT_ID AS [MAILSEGMENT_ID]
					, ROW_NUMBER() over (partition by scan.MAILSEGMENT_ID order by scan.MAILPIECESCAN_DATETIME DESC) AS [MAILSEGMENT_RN]                                            	    
					, scan.MAILPIECESCAN_ID AS [MAILSEGMENT_SCANID]			                                
				FROM			
					--@MailPieceScans AS scan
					#temp_MailPieceScans AS scan
			)
			UPDATE s
			SET
				s.MAILSEGMENT_LASTSCANID = f.MAILSEGMENT_SCANID
			FROM 
				CTE_Scans AS f
				INNER JOIN dbo.MailSegments AS s
					ON f.MAILSEGMENT_ID = s.MAILSEGMENT_ID
						AND f.MAILSEGMENT_RN = 1
			--OPTION (RECOMPILE);
			-------------------------------------------------------------------------------------------

			---- UPDATE THE SEGMENT'S LAST FINALIZED SCAN ---------------------------------------------                           
			; WITH CTE_FinalizedScans AS
			(
				SELECT 
					scan.MAILSEGMENT_ID AS [MAILSEGMENT_ID]
					, ROW_NUMBER() over (partition by scan.MAILSEGMENT_ID order by scan.MAILPIECESCAN_DATETIME DESC) AS [MAILSEGMENT_RN]
					, scan.MAILPIECESCAN_ID AS [MAILSEGMENT_SCANID]			                                
				FROM			
					--@MailPieceScans AS scan
					#temp_MailPieceScans AS scan
				WHERE
					scan.OPERATION_CUTOFF IS NOT NULL
			)
			UPDATE s
			SET
				s.MAILSEGMENT_LASTFINALIZESCANID = f.MAILSEGMENT_SCANID
			FROM 
				CTE_FinalizedScans AS f
				INNER JOIN dbo.MailSegments AS s
					ON f.MAILSEGMENT_ID = s.MAILSEGMENT_ID
						AND f.MAILSEGMENT_RN = 1
			--OPTION (RECOMPILE);
			----------------------------------------------------------------------------------------------
	
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION;

		DECLARE @ErrorNumber INT = ERROR_NUMBER();
		DECLARE @ErrorLine INT = ERROR_LINE();
		DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
		DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
		DECLARE @ErrorState INT = ERROR_STATE();

		PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
		PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));

		RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	END CATCH
END
GO