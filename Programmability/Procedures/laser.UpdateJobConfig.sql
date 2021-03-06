﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--region [laser].[UpdateJobConfig]

------------------------------------------------------------------------------------------------------------------------
-- Generated By:   dlaub using CodeSmith 6.0.0.0
-- Template:       StoredProcedures.cst
-- Procedure Name: [laser].[UpdateJobConfig]
-- Date Generated: Thursday, April 30, 2015
------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [laser].[UpdateJobConfig]
	@Id int,
	@Requestedstartpage int,
	@Requestedendpage int,
	@Requestedprinttoend bit,
	@Copycount int,
	@Collate bit,
	@Printusergroup1 bit,
	@Printusergroup2 bit,
	@Printusergroup3 bit,
	@Offsetx float,
	@Offsety float,
	@Scalex float,
	@Scaley float,
	@Printerresolution int
AS

SET NOCOUNT ON

UPDATE [laser].[JobConfigs] SET
	[JOBCONFIG_REQUESTEDSTARTPAGE] = @Requestedstartpage,
	[JOBCONFIG_REQUESTEDENDPAGE] = @Requestedendpage,
	[JOBCONFIG_REQUESTEDPRINTTOEND] = @Requestedprinttoend,
	[JOBCONFIG_COPYCOUNT] = @Copycount,
	[JOBCONFIG_COLLATE] = @Collate,
	[JOBCONFIG_PRINTUSERGROUP1] = @Printusergroup1,
	[JOBCONFIG_PRINTUSERGROUP2] = @Printusergroup2,
	[JOBCONFIG_PRINTUSERGROUP3] = @Printusergroup3,
	[JOBCONFIG_OFFSETX] = @Offsetx,
	[JOBCONFIG_OFFSETY] = @Offsety,
	[JOBCONFIG_SCALEX] = @Scalex,
	[JOBCONFIG_SCALEY] = @Scaley,
	[JOBCONFIG_PRINTERRESOLUTION] = @Printerresolution

WHERE
		[JOBCONFIG_ID] = @Id
 

--endregion
GO