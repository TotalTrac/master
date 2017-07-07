﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[OutputFilesGetByPackageID] 
	@ID int
AS
BEGIN

	SET NOCOUNT ON;
    
	SELECT
		OUTPUTFILE_ID 
		, OUTPUTFILE_DESCRIPTION
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
		, OUTPUTFILE_ROWVERSION
	FROM 
		[dbo].[OutputFiles]
	WHERE 
		OUTPUTFILE_PACKAGEID = @ID;
END
GO