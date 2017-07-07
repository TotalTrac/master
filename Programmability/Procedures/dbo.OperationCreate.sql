SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[OperationCreate]
	@Code				int
	, @Cutoff			time = NULL	
	, @Description		nvarchar(50)
	, @MachineID		int
	, @MailLevelID		int
	, @MailPhaseID		int
	, @MailTypeID		int
	, @OperationTypeID	int
	, @ProcessTypeID	int
AS
BEGIN
	SET NOCOUNT ON;

    INSERT [dbo].[Operations]
	(
		OPERATION_CODE
		, OPERATION_CUTOFF
		, OPERATION_DESCRIPTION		
		, OPERATION_MACHINEID
		, OPERATION_MAILLEVELID
		, OPERATION_MAILPHASEID
		, OPERATION_MAILTYPEID
		, OPERATION_OPERATIONTYPEID
		, OPERATION_PROCESSTYPEID
	)
	OUTPUT
		inserted.OPERATION_ID AS ID, NULL AS [VERSION]
	VALUES
	(
		@Code
		, @Cutoff
		, @Description
		, @MachineID
		, @MailLevelID
		, @MailPhaseID
		, @MailTypeID
		, @OperationTypeID
		, @ProcessTypeID
	);
END
GO