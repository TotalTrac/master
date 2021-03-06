﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [dbo].[GeoStatesGetAll]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   pmurphy using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [dbo].[GeoStatesGetAll]
-- Date Generated: Thursday, March 10, 2016
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[GeoStatesGetAll]
AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SELECT
	[Id],
	[FipsId],
	[StateWkt],
	--[StateWkb],
	[Region],
	[Division],
	[GnisCode],
	[GeoId],
	[Abbreviation],
	[Name],
	[LsadId],
	[FunctionalStatus],
	[LandArea],
	[WaterArea],
	[InteriorLat],
	[InteriorLon]
FROM
	[dbo].[geo_States]

--endregion

GO