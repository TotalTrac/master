SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE FUNCTION [usps].[GetDeliveryDateFromScan]
(
	@ScanID	int
)
RETURNS date
AS
BEGIN
	
	DECLARE @Date date,
		@ScanDateTime datetime,
		@OperationCutoff time,
		@Valid bit;

	SELECT 
		@ScanDateTime = MAILPIECESCAN_DATETIME
		, @OperationCutoff = OPERATION_CUTOFF
	FROM 
		dbo.MailPieceScans 
		INNER JOIN dbo.Operations 
			ON MAILPIECESCAN_OPERATIONID = OPERATION_ID
	WHERE 
		MAILPIECESCAN_ID = @ScanID;	
	
	-- If the scan happened after the operation cutoff, add a day
	IF CONVERT(TIME, @ScanDateTime) < @OperationCutoff
		SET @Date = DATEADD(dd, 0, DATEDIFF(dd, 0, @ScanDateTime));
	ELSE 
		SET @Date = DATEADD(dd, 1, DATEDIFF(dd, 0, @ScanDateTime));

	-- Make sure date is not a sunday or a holiday
	SET @Valid = CASE WHEN (DATEPART(WEEKDAY, @Date) = 1) THEN 0 ELSE CASE WHEN ([usps].[IsHoliday](@Date) = 1) THEN 0 ELSE 1 END END;

	WHILE (@Valid = 0)
	BEGIN 
		--Add a day		
		SET @Date = DATEADD(dd, 1, @Date);

		-- Make sure date is not a sunday or a holiday
		SET @Valid = CASE WHEN (DATEPART(WEEKDAY, @Date) = 1) THEN 0 ELSE CASE WHEN ([usps].[IsHoliday](@Date) = 1) THEN 0 ELSE 1 END END;
	END

	RETURN @Date;
END
GO