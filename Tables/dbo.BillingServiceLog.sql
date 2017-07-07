CREATE TABLE [dbo].[BillingServiceLog] (
  [Id] [int] IDENTITY,
  [Created] [datetime] NOT NULL,
  [CreatedById] [int] NOT NULL,
  [Message] [varchar](max) NULL,
  [ProcessStartTime] [datetime] NOT NULL,
  [ProcessEndTime] [datetime] NULL,
  [ProcessStatus] [int] NOT NULL,
  [SegmentsProcessed] [int] NULL,
  [StackTrace] [varchar](max) NULL,
  [RowVersion] [timestamp],
  CONSTRAINT [PK_BillingServiceLog] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[BillingServiceLog]
  ADD CONSTRAINT [FK_BillingServiceLog_BillingServiceStatuses_Id] FOREIGN KEY ([ProcessStatus]) REFERENCES [dbo].[BillingServiceStatusTypes] ([Id])
GO