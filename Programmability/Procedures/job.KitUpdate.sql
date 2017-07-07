SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [job].[KitUpdate]
	@Id					int
	, @CompleteMailing	int
	, @Created			datetime
	, @CreatedBy		int
	, @Csruserid		int
	, @Estimatedqty		int
	, @Instructions		varchar(max)
	, @JobId			int
	, @Dropdate			date
	, @Name				nvarchar(50)
	, @SegmentId		int
	, @StartTime		datetime = NULL
	, @EndTime			datetime = NULL
	, @Version			timestamp
	, @Soduedate		date
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [job].[Kits] 
	SET
		CompleteMailing		= @CompleteMailing
		, Created			= @Created
		, CreatedBy			= @CreatedBy
		, [CsrUserId]		= @Csruserid
		, [EstimatedQty]	= @Estimatedqty
		, [Instructions]	= @Instructions
		, [JobId]			= @JobId
		, [SegmentID]		= @SegmentId
		, [DropDate]		= @Dropdate
		, [Name]			= @Name
		, StartTime			= @StartTime
		, EndTime			= @EndTime
		, [SoDueDate]		= @Soduedate
	OUTPUT
		inserted.ID AS ID, inserted.[ROWVERSION] AS [VERSION]
	WHERE
		(ID = @ID)
		AND	([ROWVERSION] = @Version);
END

GO