﻿CREATE TABLE [usps].[EntryPointLevels] (
  [ENTRYPOINTLEVEL_ID] [int] IDENTITY (-2147483648, 1),
  [ENTRYPOINTLEVEL_NAME] [nvarchar](max) NOT NULL,
  CONSTRAINT [PK_EntryPointLevels] PRIMARY KEY CLUSTERED ([ENTRYPOINTLEVEL_ID])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO