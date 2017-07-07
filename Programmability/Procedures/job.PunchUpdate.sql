SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[PunchUpdate]	
	@ID				int
	, @JobID		int
	, @MachineName	nvarchar(100)
	, @StartTime	datetime
	, @StopTime		datetime = NULL
	, @Username		nvarchar(100)
	, @Version		timestamp
AS
BEGIN
	SET NOCOUNT ON;
	
	UPDATE [job].[Punches]
	SET		
		JOBID			= @JobID
		, MACHINENAME = @MachineName
		, STARTTIME	= @StartTime
		, STOPTIME	= @StopTime
		, USERNAME	= @Username	
	OUTPUT INSERTED.ID AS [ID], INSERTED.[ROWVERSION] AS [Version]
	WHERE
		ID = @ID
		AND [ROWVERSION] = @Version;	
END
GO