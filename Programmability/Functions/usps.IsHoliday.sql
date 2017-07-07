SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE FUNCTION [usps].[IsHoliday]
(
	@Date	date
)
RETURNS bit
AS
BEGIN
	
	DECLARE @Year int, @Month int, @Day int;
	DECLARE @Offset int;

	SET @Year = DATEPART(YEAR, @Date);
	SET @Month = DATEPART(MONTH, @Date);
	SET @Day = DATEPART(DAY, @Date);

	RETURN
		CASE @Month
			WHEN 1 THEN
				CASE @Day
					WHEN 1 THEN 1	-- New Year's Day
					WHEN (14 + [dbo].[GetFirstDayOfWeekOccurence](@Year, @Month, 2)) THEN 1	-- MLK Day
					ELSE 0
				END
			WHEN 2 THEN
				CASE @Day
					WHEN (14 + [dbo].[GetFirstDayOfWeekOccurence](@Year, @Month, 2)) THEN 1 -- Presidents' Day
					ELSE 0
				END
			WHEN 5 THEN
				CASE DATEPART(WEEKDAY, DATEFROMPARTS(@Year, 5, 1))
					WHEN 1 THEN 
						CASE @Day
							WHEN (28 + [dbo].[GetFirstDayOfWeekOccurence](@Year, @Month, 2)) THEN 1
							ELSE 0
						END
					WHEN 2 THEN
						CASE @Day
							WHEN (28 + [dbo].[GetFirstDayOfWeekOccurence](@Year, @Month, 2)) THEN 1
							ELSE 0
						END
					ELSE 
						CASE @Day
							WHEN (21 + [dbo].[GetFirstDayOfWeekOccurence](@Year, @Month, 2)) THEN 1
							ELSE 0
						END						
				END
			WHEN 7 THEN
				CASE @Day
					WHEN 4 THEN 1	-- 4th of July
					ELSE 0
				END
			WHEN 9 THEN
				CASE @Day
					WHEN [dbo].[GetFirstDayOfWeekOccurence](@Year, @Month, 2) THEN 1	-- Labor Day
					ELSE 0
				END
			WHEN 10 THEN 
				CASE @Day
					WHEN 7 + [dbo].[GetFirstDayOfWeekOccurence](@Year, @Month, 2) THEN 1	-- Columbus Day
					ELSE 0
				END
			WHEN 11 THEN
				CASE @Day
					WHEN 10 THEN
						CASE DATEPART(WEEKDAY, DATEFROMPARTS(@Year, 11, 11))	-- Veterans' Day (if Saturday)
							WHEN 7 THEN 1
							ELSE 0
						END
					WHEN 11 THEN
						CASE DATEPART(WEEKDAY, DATEFROMPARTS(@Year, 11, 11))	-- Veterans' Day (Not weekend)
							WHEN 1 THEN 0
							WHEN 7 THEN 0
							ELSE 1
						END
					WHEN 12 THEN
						CASE DATEPART(WEEKDAY, DATEFROMPARTS(@Year, 11, 11))	-- Veterans' Day (if Sunday)
							WHEN 1 THEN 1
							ELSE 0
						END
					WHEN 21 + [dbo].[GetFirstDayOfWeekOccurence](@Year, @Month, 5) THEN 1	-- Thanksgiving
					ELSE 0
				END
			WHEN 12 THEN
				CASE @Day
					WHEN 25 THEN 1	-- Christmas
					ELSE 0
				END
			ELSE
				0
		END	
	
END
GO