CREATE TABLE [keying].[ConnectAmerica_Referrer] (
  [id] [int] IDENTITY,
  [code] [varchar](15) NULL,
  [name] [varchar](50) NULL,
  [phone] [varchar](15) NULL,
  [timestamp] [datetime] NOT NULL,
  [keyer] [varchar](10) NULL,
  [batch] [varchar](20) NULL,
  CONSTRAINT [PK_ConnectAmericaReferrals_Referrer] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO