﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [job].[AffixingItemTypesGet] 
	
AS
BEGIN
	SET NOCOUNT ON;

	SELECT 
		ID
		, NAME
		, ATTRIBUTES
		, [ROWVERSION] 
	FROM 
		job.[AffixingItemTypes]
	ORDER BY
		ID;
END
GO