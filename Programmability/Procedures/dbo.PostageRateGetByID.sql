﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[PostageRateGetByID] 
	@ID int
AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT
		POSTAGERATE_ID
		, POSTAGERATE_DESCRIPTION
		, POSTAGERATE_NONPROFIT
		, POSTAGERATE_RATE
		, POSTAGERATE_ROWVERSION
	FROM 
		[dbo].[PostageRates]
	WHERE 
		POSTAGERATE_ID = @ID;
END
GO