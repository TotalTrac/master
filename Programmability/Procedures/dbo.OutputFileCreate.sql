SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[OutputFileCreate] 
	@AssignmentID	int
	, @Description	nvarchar(4000)
	, @FileName		nvarchar(50)
	, @Folder		nvarchar(2000)
	, @Lines		int
	, @PackageID	int
	, @Posted		datetime
	, @PostedByID	int
	, @Quantity		int
	, @TargetID		int
	, @TypeID		int
AS
BEGIN

	SET NOCOUNT ON;
	
	INSERT [dbo].[OutputFiles]
	(
		OUTPUTFILE_DESCRIPTION
		, OUTPUTFILE_NAME
		, OUTPUTFILE_FOLDER
		, OUTPUTFILE_LINES
		, OUTPUTFILE_PACKAGEID
		, OUTPUTFILE_POSTED
		, OUTPUTFILE_POSTEDBYID
		, OUTPUTFILE_PROCESSASSIGNMENTID
		, OUTPUTFILE_QUANTITY
		, OUTPUTFILE_TARGETID
		, OUTPUTFILE_TYPEID
	)
	OUTPUT		
		inserted.OUTPUTFILE_ID AS ID, inserted.OUTPUTFILE_ROWVERSION AS [VERSION]
	VALUES
	(
		@Description
		, @FileName
		, @Folder
		, @Lines
		, @PackageID
		, @Posted
		, @PostedByID
		, @AssignmentID
		, @Quantity
		, @TargetID
		, @TypeID
	);
END
GO