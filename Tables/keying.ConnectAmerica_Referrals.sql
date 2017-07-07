CREATE TABLE [keying].[ConnectAmerica_Referrals] (
  [id] [int] IDENTITY,
  [referrerid] [int] NOT NULL,
  [name] [varchar](50) NULL,
  [phone] [varchar](15) NULL
)
ON [PRIMARY]
GO

ALTER TABLE [keying].[ConnectAmerica_Referrals]
  ADD CONSTRAINT [FK_ConnectAmerica_Referrals_Referrer] FOREIGN KEY ([referrerid]) REFERENCES [keying].[ConnectAmerica_Referrer] ([id])
GO