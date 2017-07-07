﻿CREATE TABLE [dbo].[ContainerTypes] (
  [TYPE_ID] [int] IDENTITY,
  [TYPE_NAME] [nvarchar](50) NOT NULL,
  CONSTRAINT [PK_tblContainers] PRIMARY KEY CLUSTERED ([TYPE_ID]) WITH (FILLFACTOR = 90)
)
ON [PRIMARY]
GO