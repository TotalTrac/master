﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE FUNCTION [purpleheart].[DateFromWeek]
    (@YearNum int,
    @WeekNum int,
    @DayNum int)
    RETURNS Date AS

    BEGIN

        DECLARE @FirstDayYear As Date;

        SET @FirstDayYear='01/01/' + CAST(@YearNum As varchar)

        RETURN dateadd(d,(@DayNum-datepart(weekday,@FirstDayYear)),dateadd(week, @WeekNum-1,@FirstDayYear))

    END
GO