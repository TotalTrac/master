﻿CREATE TABLE [dbo].[OperationTypes] (
  [OPERATIONTYPE_ID] [int] IDENTITY,
  [OPERATIONTYPE_DESCRIPTION] [nvarchar](50) NOT NULL,
  CONSTRAINT [PK_OperationTypes] PRIMARY KEY CLUSTERED ([OPERATIONTYPE_ID])
)
ON [PRIMARY]
GO