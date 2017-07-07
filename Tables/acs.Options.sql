﻿CREATE TABLE [acs].[Options] (
  [OPTION_ID] [int] IDENTITY (-2147483648, 1),
  [OPTION_DESCRIPTION] [varchar](50) NOT NULL,
  CONSTRAINT [PK_Options] PRIMARY KEY CLUSTERED ([OPTION_ID])
)
ON [PRIMARY]
GO