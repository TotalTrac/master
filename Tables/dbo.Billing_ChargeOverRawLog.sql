CREATE TABLE [dbo].[Billing_ChargeOverRawLog] (
  [Id] [int] IDENTITY,
  [RawRequest] [varchar](max) NULL,
  [Created] [datetime] NULL,
  [CreatedById] [int] NULL,
  [ChargeOverLogItemId] [int] NULL,
  CONSTRAINT [PK_Billing_ChargeOverRawLog] PRIMARY KEY NONCLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO