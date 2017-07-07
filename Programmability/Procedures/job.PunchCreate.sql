SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[PunchCreate]	
	@JobID			int
	, @MachineName	nvarchar(100)
	, @StartTime	datetime
	, @StopTime		datetime = NULL
	, @Username		nvarchar(100)
AS
BEGIN
	SET NOCOUNT ON;
	
	INSERT [job].[Punches]
	(		
		JOBID
		, MACHINENAME
		, STARTTIME
		, USERNAME
	)
	OUTPUT INSERTED.ID AS [ID], INSERTED.[ROWVERSION] AS [Version]
	VALUES
	(		
		@JobId
		, @MachineName
		, @StartTime
		, @Username	
	);
	
END
GO