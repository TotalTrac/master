SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[SegmentSequenceCreate]
	@Created		datetime
	, @CreatedByID	int
	, @CycleCount	int
	, @EndValue		int
	, @Increment	int
	, @MailerID		int
	, @MaxValue		int
	, @MinValue		int
	, @SegmentID	int
	, @StartValue	int
AS
BEGIN
	
	SET NOCOUNT ON;
	    
	INSERT [usps].[MailSegmentSequences]
	(
		SEQUENCE_CREATED
		, SEQUENCE_CREATEDBYID
		, SEQUENCE_CYCLECOUNT
		, SEQUENCE_ENDVALUE
		, SEQUENCE_INCREMENT
		, SEQUENCE_MAILERID
		, SEQUENCE_MAXVALUE
		, SEQUENCE_MINVALUE
		, SEQUENCE_SEGMENTID
		, SEQUENCE_STARTVALUE
	)
	OUTPUT inserted.SEQUENCE_ID AS [ID], NULL AS [VERSION]
	VALUES
	(
		@Created
		, @CreatedByID
		, @CycleCount
		, @EndValue
		, @Increment
		, @MailerID
		, @MaxValue
		, @MinValue
		, @SegmentID
		, @StartValue
	);
END
GO