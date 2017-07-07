﻿CREATE TABLE [fedex].[BillingOptions] (
  [BILLINGOPTION_ID] [int] NOT NULL,
  [BILLINGOPTION_NAME] [varchar](max) NOT NULL,
  CONSTRAINT [PK_BillingOptions] PRIMARY KEY CLUSTERED ([BILLINGOPTION_ID])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO