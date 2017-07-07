﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [usps].[SegmentSequencesGetBySegmentID]
	@ID int
AS
BEGIN
	
	SET NOCOUNT ON;
	    
	SELECT
		SEQUENCE_ID
		, SEQUENCE_CREATED
		, SEQUENCE_CREATEDBYID
		, SEQUENCE_CYCLECOUNT
		, SEQUENCE_ENDVALUE
		, SEQUENCE_INCREMENT
		, SEQUENCE_MAILERID
		, SEQUENCE_MAXVALUE
		, SEQUENCE_MINVALUE
		, SEQUENCE_SEGMENTID
		, SEQUENCE_STARTVALUE
	FROM
		[usps].[MailSegmentSequences]
	WHERE
		SEQUENCE_SEGMENTID = @ID;
END
GO