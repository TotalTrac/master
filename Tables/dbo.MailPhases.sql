﻿CREATE TABLE [dbo].[MailPhases] (
  [MAILPHASE_ID] [int] IDENTITY,
  [MAILPHASE_DESCRIPTION] [nvarchar](55) NOT NULL,
  CONSTRAINT [PK_MailPhases] PRIMARY KEY CLUSTERED ([MAILPHASE_ID])
)
ON [PRIMARY]
GO