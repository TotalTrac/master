﻿CREATE TABLE [laser].[JobConfigs] (
  [JOBCONFIG_ID] [int] IDENTITY (-2147483648, 1),
  [JOBCONFIG_REQUESTEDSTARTPAGE] [int] NOT NULL,
  [JOBCONFIG_REQUESTEDENDPAGE] [int] NOT NULL,
  [JOBCONFIG_REQUESTEDPRINTTOEND] [bit] NOT NULL,
  [JOBCONFIG_COLLATE] [bit] NOT NULL,
  [JOBCONFIG_COPYCOUNT] [int] NOT NULL,
  [JOBCONFIG_PRINTUSERGROUP1] [bit] NOT NULL,
  [JOBCONFIG_PRINTUSERGROUP2] [bit] NOT NULL,
  [JOBCONFIG_PRINTUSERGROUP3] [bit] NOT NULL,
  [JOBCONFIG_OFFSETX] [float] NOT NULL,
  [JOBCONFIG_OFFSETY] [float] NOT NULL,
  [JOBCONFIG_SCALEX] [float] NOT NULL,
  [JOBCONFIG_SCALEY] [float] NOT NULL,
  [JOBCONFIG_PRINTERRESOLUTION] [int] NOT NULL,
  CONSTRAINT [PK_JobConfigs] PRIMARY KEY CLUSTERED ([JOBCONFIG_ID])
)
ON [PRIMARY]
GO