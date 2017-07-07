﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[EstimatesGetByCsrID] 
	@ID int
AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT
		ESTIMATE_ID
		, ESTIMATE_CLIENTID
		, ESTIMATE_CONTACT
		, ESTIMATE_CSRID
		, ESTIMATE_DATADUE
		, ESTIMATE_DROPDATE
		, ESTIMATE_ENTERED
		, ESTIMATE_ENTEREDBYID
		, ESTIMATE_ESTIMATEDQTY
		, ESTIMATE_JOBNAME
		, ESTIMATE_MATERIALDUE
		, ESTIMATE_REFERENCE
		, ESTIMATE_ROWVERSION
	FROM
		[dbo].[Estimates]	
	WHERE 
		ESTIMATE_CSRID = @ID
	ORDER BY
		ESTIMATE_ID;
END
GO