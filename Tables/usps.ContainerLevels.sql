﻿CREATE TABLE [usps].[ContainerLevels] (
  [CONTAINERLEVEL_ID] [int] IDENTITY (-2147483648, 1),
  [CONTAINERLEVEL_NAME] [nvarchar](max) NOT NULL,
  CONSTRAINT [PK_ContainerLevels] PRIMARY KEY CLUSTERED ([CONTAINERLEVEL_ID])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO