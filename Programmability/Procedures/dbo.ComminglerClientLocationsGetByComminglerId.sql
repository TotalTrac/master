﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ComminglerClientLocationsGetByComminglerId]
	@ID int
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT 
		COMMINGLERLOCATION_ID		
		, COMMINGLERLOCATION_COMMINGLERID
		, COMMINGLERLOCATION_LOCATIONID
		, COMMINGLERLOCATION_VALUE
	FROM 
		[dbo].[ComminglerClientLocations]
	WHERE
		COMMINGLERLOCATION_COMMINGLERID = @ID;
END
GO