﻿CREATE TABLE [acs].[Types] (
  [ID] [int] IDENTITY (-2147483648, 1),
  [Description] [nvarchar](max) NOT NULL,
  [Value] [nvarchar](max) NOT NULL,
  CONSTRAINT [PK_Types] PRIMARY KEY CLUSTERED ([ID])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO