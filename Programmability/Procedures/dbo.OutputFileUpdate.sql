SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[OutputFileUpdate]
	@ID				int 
	, @AssignmentID	int
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
	, @Version		timestamp
AS
BEGIN

	UPDATE 
		[dbo].[OutputFiles]
	SET
		OUTPUTFILE_DESCRIPTION				= @Description
		, OUTPUTFILE_NAME					= @FileName
		, OUTPUTFILE_FOLDER					= @Folder
		, OUTPUTFILE_LINES					= @Lines
		, OUTPUTFILE_PACKAGEID				= @PackageID
		, OUTPUTFILE_POSTED					= @Posted
		, OUTPUTFILE_POSTEDBYID				= @PostedByID
		, OUTPUTFILE_PROCESSASSIGNMENTID	= @AssignmentID
		, OUTPUTFILE_QUANTITY				= @Quantity
		, OUTPUTFILE_TARGETID				= @TargetID
		, OUTPUTFILE_TYPEID					= @TypeID
	OUTPUT		
		inserted.OUTPUTFILE_ID AS ID, inserted.OUTPUTFILE_ROWVERSION AS [VERSION]
	WHERE
		(OUTPUTFILE_ID = @ID) 
		AND (OUTPUTFILE_ROWVERSION = @Version);
END
GO