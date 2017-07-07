SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LogItemsGetByIpAddressDateRangePaged] 
	@IpAddress nchar(15),
	@From datetime,
	@To datetime,
	@Page int,
	@RowsPerPage int
AS
BEGIN
	
	SET NOCOUNT ON;

	DECLARE @StartRow int,
			@EndRow int;

	SET @StartRow = ((@Page - 1) * @RowsPerPage) + 1;
	SET @EndRow = @StartRow + @RowsPerPage - 1;

	SELECT * FROM (
		SELECT 
			ROW_NUMBER() OVER (ORDER BY LOG_ID) AS ResultNum, 
			LOG_ID,
			LOG_USERID,
			LOG_DATETIME,
			LOG_IPADDRESS,
			LOG_MESSAGE
		FROM [dbo].[Log] 
		WHERE LOG_ID IN (
			SELECT LOG_ID FROM [dbo].[Log] 
			WHERE LOG_IPADDRESS = @IpAddress
			AND ((LOG_DATETIME >= @From)
			AND (LOG_DATETIME <= @To))))
		AS NumberResults
	WHERE ResultNum BETWEEN @StartRow AND @EndRow;

END
GO