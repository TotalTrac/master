SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE FUNCTION [usps].[GetDeliveryDate]
(
	@ScanDateTime		datetime
	, @OperationCutoff	time
)
RETURNS date
AS
BEGIN
	
	DECLARE @Date date;

	IF CONVERT(TIME, @ScanDateTime) < @OperationCutoff
			SET @Date = DATEADD(dd, 0, DATEDIFF(dd, 0, @ScanDateTime))
		ELSE 
			SET @Date = DATEADD(dd, 1, DATEDIFF(dd, 0, @ScanDateTime)) 

	-- IF the delivery date is a Sunday, make it Monday
	IF DATEPART(WEEKDAY, @Date) = 1
		SET @Date = DATEADD(dd, 1, @Date);

	-- If the delivery date is a USPS holiday, move to the next day
	IF [usps].[IsHoliday](@Date) = 1
		SET @Date = DATEADD(dd, 1, DATEDIFF(dd, 0, @Date)) 	
	

	RETURN @Date;
END
GO