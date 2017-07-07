CREATE TABLE [dbo].[BillingSubscriptions] (
  [Id] [int] IDENTITY,
  [Allotted] [int] NULL,
  [ClientId] [int] NOT NULL,
  [Created] [datetime] NOT NULL,
  [CreatedById] [int] NOT NULL,
  [CycleStartDate] [datetime] NULL,
  [LastInvoicedDate] [datetime] NULL,
  [LastUpdated] [datetime] NULL,
  [MinimumQty] [int] NULL,
  [MinimumRate] [decimal](18, 6) NULL,
  [MonthsPerCycle] [int] NULL,
  [OverageRate] [decimal](18, 6) NULL,
  [PayCycle] [int] NULL,
  [ProductId] [int] NULL,
  [ProductPrice] [decimal](18, 4) NULL,
  [ProviderId] [int] NULL,
  [Remaining] [int] NULL,
  [Seats] [int] NULL,
  [SeatItemId] [int] NULL,
  [SeatPrice] [decimal](18, 4) NULL,
  [UsageAlertsSent] [int] NULL,
  [UsageAlertThreshold] [int] NULL,
  [UsageId] [int] NULL,
  [Users] [int] NULL,
  [RowVersion] [timestamp] NULL,
  CONSTRAINT [PK_BillingSubscription] PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[BillingSubscriptions]
  ADD CONSTRAINT [FK_BillingSubscriptions_Clients_CLIENT_ID] FOREIGN KEY ([ClientId]) REFERENCES [dbo].[Clients] ([CLIENT_ID])
GO

ALTER TABLE [dbo].[BillingSubscriptions]
  ADD CONSTRAINT [FK_BillingSubscriptions_Users_USER_USERID] FOREIGN KEY ([CreatedById]) REFERENCES [dbo].[Users] ([USER_USERID])
GO