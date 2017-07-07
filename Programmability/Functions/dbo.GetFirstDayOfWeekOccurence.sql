SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[GetFirstDayOfWeekOccurence]
(
	@Year			int
	, @Month		int
	, @DayOfWeek	int
)
RETURNS int
AS
BEGIN
	
	DECLARE @R int;
		
    IF ((@Month < 1) OR (@Month > 12) OR (@DayOfWeek < 1) OR (@DayOfWeek > 7))
        RETURN 0;
		    			    
    DECLARE @Date date;	
	SET @Date = DATEFROMPARTS(@Year, @Month, 1);
		 
    DECLARE @FirstDay int;
	SET @FirstDay = DATEPART(WEEKDAY, @Date);

    IF (@DayOfWeek < @FirstDay)
        SET @R = (8 - (@FirstDay - @DayOfWeek));
    ELSE
        SET @R = (1 + (@DayOfWeek - @FirstDay));

	RETURN @R;
END
GO